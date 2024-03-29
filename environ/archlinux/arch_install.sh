#!/usr/bin/env bash

set -o errexit
set -o nounset

# dicas-> loadkeys br-abnt2

partition_disk() {
  parted -s $1 \
    mklabel gpt \
    mkpart primary 1MiB 500MiB \
    mkpart primary 500MiB 100% \
    set 1 esp on \
    --align optimal \
    align-check min 1
}

encrypt_partition() {
  ## config luks2
  modprobe dm-crypt
  modprobe dm-mod

  local DEVICE=$1
  local PARTITION=$2
  local SECTOR_SIZE=$(cat /sys/block/$DEVICE/queue/physical_block_size)

  cryptsetup \
    --type luks2 \
    --cipher aes-xts-plain64 \
    --hash sha512 \
    --key-size 512 \
    --pbkdf argon2id \
    --sector-size $SECTOR_SIZE \
    --align-payload $(expr $SECTOR_SIZE / 512) \
    --use-random \
    --verify-passphrase \
    luksFormat $PARTITION
}

create_btrfs_subvolumes() {
  local device=$1
  local mount_point=$2
  mount $device $mount_point
  btrfs subvolume create $mount_point/@
  btrfs subvolume create $mount_point/@docker
  btrfs subvolume create $mount_point/@home
  btrfs subvolume create $mount_point/@libvirt
  btrfs subvolume create $mount_point/@snapshots
  btrfs subvolume create $mount_point/@swap
  btrfs subvolume create $mount_point/@tmp
  btrfs subvolume create $mount_point/@var_log
  umount $mount_point
}

mount_partion_and_subvolumes() {
  local device_boot=$1
  local device_container=$2
  local mount_point=$3
  local mount_options="defaults,noatime,compress-force=zstd,commit=120"

  mount -o ${mount_options},subvol=@ $device_container $mount_point
  mkdir -p $mount_point/{boot,var/lib/docker,home,var/lib/libvirt,var/log,.snapshots,.swap,tmp}

  mount -o fmask=0077,dmask=0077 $device_boot /mnt/boot
  mount -o ${mount_options},subvol=@docker  $device_container $mount_point/var/lib/docker
  mount -o ${mount_options},subvol=@home    $device_container $mount_point/home
  mount -o ${mount_options},subvol=@libvirt $device_container $mount_point/var/lib/libvirt
  mount -o ${mount_options},subvol=@tmp     $device_container $mount_point/tmp
  mount -o ${mount_options},subvol=@var_log $device_container $mount_point/var/log
  mount -o noatime,subvol=@swap             $device_container $mount_point/.swap
  mount -o subvol=@snapshots                $device_container $mount_point/.snapshots

  # disable COW
  chattr +C $mount_point/var/lib/docker
  chattr +C $mount_point/var/lib/libvirt
}

create_swapfile() {
  local swapfile_path=$1

  touch $swapfile_path
  chmod 600 $swapfile_path
  chattr +C $swapfile_path
  dd if=/dev/zero of=$swapfile_path bs=1M count=4096 status=progress
  mkswap $swapfile_path
  swapon $swapfile_path
}
enable_pacman_parallet_download() {
  sed -E 's/^#ParallelDownloads.+$/ParallelDownloads = 10/' -i /etc/pacman.conf
}

other_configs() {
  create_swapfile /mnt/.swap/swapfile

  mkdir /mnt/etc
  genfstab -U /mnt > /mnt/etc/fstab
  enable_pacman_parallet_download
  reflector \
    --latest 20 \
    --protocol http \
    --protocol https \
    --sort rate \
    --save /etc/pacman.d/mirrorlist \
    --verbose
  sed -E 's/^#ParallelDownloads.+$/ParallelDownloads = 10/' -i /etc/pacman.conf
  yes | pacstrap \
    /mnt \
    base \
    btrfs-progs \
    intel-ucode \
    linux \
    linux-firmware \
    networkmanager
  cat /etc/pacman.d/mirrorlist > /mnt/etc/pacman.d/mirrorlist
  cp arch_install.sh /mnt
}

if [[ ! -v ARCHROOT_ENVIRON ]] ; then
  # if variable doens't exists

  echo "select the target config:
  1 -> bare-metal
  2 -> bare-metal dual boot
  3 -> vm without encrypt
  4 -> vm with encrypt"
  read -p "> " target_selected

  case $target_selected in
    1) # "bare-metal" target
      DEVICE=nvme0n1
      DEVICE_PATH=/dev/nvme0n1
      DEVICE_PATH_PART1=/dev/nvme0n1p1
      DEVICE_PATH_PART2=/dev/nvme0n1p2
      DEVICE_CONTAINER=/dev/mapper/container

      partition_disk $DEVICE_PATH
      encrypt_partition $DEVICE $DEVICE_PATH_PART2
      cryptsetup open --type luks2 $DEVICE_PATH_PART2 container

      mkfs.fat -F32 $DEVICE_PATH_PART1
      mkfs.btrfs $DEVICE_CONTAINER
      create_btrfs_subvolumes $DEVICE_CONTAINER /mnt
      mount_partion_and_subvolumes $DEVICE_PATH_PART1 $DEVICE_CONTAINER /mnt
      other_configs
      ARCHROOT_ENVIRON=1 STORAGE_DEVICE=$DEVICE_PATH_PART2 ROOT_DEVICE=$DEVICE_CONTAINER RESUME_DEVICE=$DEVICE_CONTAINER arch-chroot /mnt ./arch_install.sh
      ;;

    2) # "bare-metal dual boot" target
      echo "not implemented"
      ;;

    3) # "vm without encrypt" target
      DEVICE=vda
      DEVICE_PATH=/dev/vda
      DEVICE_PATH_PART1=/dev/vda1
      DEVICE_PATH_PART2=/dev/vda2

      partition_disk $DEVICE_PATH

      mkfs.fat -F32 $DEVICE_PATH_PART1
      mkfs.btrfs $DEVICE_PATH_PART2
      create_btrfs_subvolumes $DEVICE_PATH_PART2 /mnt
      mount_partion_and_subvolumes $DEVICE_PATH_PART1 $DEVICE_PATH_PART2 /mnt
      other_configs
      ARCHROOT_ENVIRON=1 STORAGE_DEVICE=$DEVICE_PATH_PART2 ROOT_DEVICE=$DEVICE_CONTAINER RESUME_DEVICE=$DEVICE_CONTAINER arch-chroot /mnt ./arch_install.sh
      ;;

    4) # "vm with encrypt" target
      DEVICE=vda
      DEVICE_PATH=/dev/vda
      DEVICE_PATH_PART1=/dev/vda1
      DEVICE_PATH_PART2=/dev/vda2
      DEVICE_CONTAINER=/dev/mapper/container

      partition_disk $DEVICE_PATH
      encrypt_partition $DEVICE $DEVICE_PATH_PART2
      cryptsetup open --type luks2 $DEVICE_PATH_PART2 container

      mkfs.fat -F32 $DEVICE_PATH_PART1
      mkfs.btrfs $DEVICE_CONTAINER
      create_btrfs_subvolumes $DEVICE_CONTAINER /mnt
      mount_partion_and_subvolumes $DEVICE_PATH_PART1 $DEVICE_CONTAINER /mnt
      other_configs
      ARCHROOT_ENVIRON=1 STORAGE_DEVICE=$DEVICE_PATH_PART2 ROOT_DEVICE=$DEVICE_CONTAINER RESUME_DEVICE=$DEVICE_CONTAINER arch-chroot /mnt ./arch_install.sh
      ;;

    *)
      echo "invalid op"
      exit
      ;;
  esac

else
  # if variable exists

  ## fuso de brasilia
  ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
  hwclock --systohc --utc

  ## layout do teclado do sistema
  echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

  ## lang
  sed -e "s/#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/g" -i /etc/locale.gen
  locale-gen
  echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
  export $(cat /etc/locale.conf)

  echo "password root"
  passwd

  # user marcos
  useradd -m marcos
  echo "password marcos"
  passwd marcos

  ## conf zram
  echo 'zram' > /etc/modules-load.d/zram.conf
  echo 'options zram num_devices=1' > /etc/modprobe.d/zram.conf
  RAM_SIZE=$(free -m | sed -n '2 p' | awk '{print $2}')
  echo "KERNEL==\"zram0\", ATTR{comp_algorithm}=\"zstd\", ATTR{disksize}=\"${RAM_SIZE}m\" RUN=\"/usr/bin/mkswap /dev/zram0\", TAG+=\"systemd\"" > /etc/udev/rules.d/99-zram.rules
  echo "/dev/zram0 none swap defaults,pri=100 0 0" >> /etc/fstab

  ## config mkinitcpio
  sed -E 's/^HOOKS.+$/HOOKS=(base udev autodetect keyboard keymap modconf block encrypt filesystems resume fsck)/' -i /etc/mkinitcpio.conf
  mkinitcpio -p linux

  ## config systemd-boot
  bootctl install
  echo -e "default arch\ntimeout 2\neditor no" > /boot/loader/loader.conf

  enable_pacman_parallet_download
  pacman -S --needed curl gcc
  curl \
    https://raw.githubusercontent.com/osandov/osandov-linux/master/scripts/btrfs_map_physical.c \
    -o btrfs_map_physical.c
  gcc -O2 -o btrfs_map_physical btrfs_map_physical.c
  RESUME_OFFSET=$(./btrfs_map_physical /.swap/swapfile | head -n 2 | tail -1 | awk '{print $NF}')
  RESUME_OFFSET=$(expr $RESUME_OFFSET / $(getconf PAGESIZE))

  UUID_STORAGE_DEVICE=$(blkid -s UUID -o value $STORAGE_DEVICE)
  DEVICE="cryptdevice=UUID=$UUID_STORAGE_DEVICE:container:allow-discards" # :allow-discards to enable TRIM commands
  DISABLE_WORKQUEUE="no-read-workqueue,no-write-workqueue" # for better performance in ssd, not recomended for hdd
  ROOT_DEVICE="root=$ROOT_DEVICE"
  ROOT_FLAGS="rootflags=subvol=@"
  RESUME_DEVICE="resume=$RESUME_DEVICE" # for hibernation
  RESUME_OFFSET="resume_offset=$RESUME_OFFSET" # when swap is a swapfile
  OTHER_PARAMETERS="zswap.enabled=0" # disable zswap,  add snd_intel_dspcfg.dsp_driver=1 for enable audio intel driver, add ibt=off for run virtualbox
  KERNEL_PARAMETERS="$DEVICE,$DISABLE_WORKQUEUE $ROOT_DEVICE rw $ROOT_FLAGS $RESUME_DEVICE $RESUME_OFFSET $OTHER_PARAMETERS"

  echo -e "title Archlinux
  linux /vmlinuz-linux
  initrd /intel-ucode.img
  initrd /initramfs-linux.img
  options $KERNEL_PARAMETERS" > /boot/loader/entries/arch.conf

  pacman -S iwd
  mkdir -p /etc/NetworkManager/conf.d
  echo -e "[device]\nwifi.backend=iwd\nwifi.iwd.autoconnect=no" > /etc/NetworkManager/conf.d/wifi_backend.conf

  systemctl enable NetworkManager
  systemctl enable fstrim.timer
fi
