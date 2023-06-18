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
}

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

mount_partion_and_subvolumes() {
  local device_boot=$1
  local device_container=$2
  local mount_point=$3
  local mount_options="defaults,noatime,compress-force=zstd,commit=120"

  mount -o ${mount_options},subvol=@ $device_container $mount_point
  mkdir -p $mount_point/{boot,home,var/log,.snapshots,.swap,tmp}

  mount $device_boot /mnt/boot
  mount -o ${mount_options},subvol=@home $device_container $mount_point/home
  mount -o ${mount_options},subvol=@log  $device_container $mount_point/var/log
  mount -o ${mount_options},subvol=@tmp  $device_container $mount_point/tmp
  mount -o noatime,subvol=@swap          $device_container $mount_point/.swap
  mount -o subvol=@snapshots             $device_container $mount_point/.snapshots
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

partition_disk /dev/vda
encrypt_partition vda /dev/vda2
cryptsetup open --type luks2 /dev/vda2 container

mkfs.fat -F32 /dev/vda1
mkfs.btrfs /dev/mapper/container
create_btrfs_subvolumes /dev/mapper/container /mnt
mount_partion_and_subvolumes /dev/vda1 /dev/mapper/container /mnt
create_swapfile /mnt/.swap/swapfile

mkdir /mnt/etc
genfstab -U /mnt > /mnt/etc/fstab

reflector --latest 20 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose # mirrors
yes | pacstrap /mnt base linux linux-firmware networkmanager intel-ucode btrfs-progs

cp arch_install2.sh /mnt
cd && cp -r setups /mnt

arch-chroot /mnt ./arch_install2.sh
