#!/usr/bin/env bash

set -o errexit
set -o nounset

# dicas-> loadkeys br-abnt2

DISK="nvme0n1"
PART="p"

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

  cryptsetup open --type luks2 $PARTITION container
}


mkfs.fat -F32 /dev/$DISK${PART}1
mkfs.btrfs /dev/mapper/container

create_btrfs_subvolumes() {
  local device=$1
  local mount_point=$2
  mount $device $mount_point
  btrfs subvolume create $mount_point/@
  btrfs subvolume create $mount_point/@home
  btrfs subvolume create $mount_point/@log
  btrfs subvolume create $mount_point/@snapshots
  btrfs subvolume create $mount_point/@swap
  btrfs subvolume create $mount_point/@tmp
  umount $mount_point
}
create_btrfs_subvolumes /dev/mapper/container /mnt



mount_btrfs_subvolumes() {
  local mount_options="defaults,noatime,compress-force=zstd,commit=120"
  mount -o ${mount_options},subvol=@ /dev/mapper/container /mnt
  mkdir -p /mnt/{boot,home,var/log,.snapshots,.swap,tmp}

  mount /dev/$DISK${PART}1 /mnt/boot
  mount -o ${mount_options},subvol=@home /dev/mapper/container /mnt/home
  mount -o ${mount_options},subvol=@log  /dev/mapper/container /mnt/var/log
  mount -o ${mount_options},subvol=@tmp  /dev/mapper/container /mnt/tmp
  mount -o noatime,subvol=@swap          /dev/mapper/container /mnt/.swap
  mount -o subvol=@snapshots             /dev/mapper/container /mnt/.snapshots
}

create_swapfile() {
  touch /mnt/.swap/swapfile
  chmod 600 /mnt/.swap/swapfile
  chattr +C /mnt/.swap/swapfile
  dd if=/dev/zero of=/mnt/.swap/swapfile bs=1M count=4096 status=progress
  mkswap /mnt/.swap/swapfile
  swapon /mnt/.swap/swapfile
}

mkdir /mnt/etc
genfstab -U /mnt > /mnt/etc/fstab

reflector --latest 20 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose # mirrors
yes | pacstrap /mnt base linux linux-firmware networkmanager intel-ucode btrfs-progs

cp arch_install2.sh /mnt
cd && cp -r setups /mnt

arch-chroot /mnt ./arch_install2.sh
