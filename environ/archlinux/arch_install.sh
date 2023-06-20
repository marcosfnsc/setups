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

if [[ -z $ARCHROOT_ENVIRON ]] ; then
  # if variable doens't exists

  echo "select the target config:
  1 -> bare-metal
  2 -> bare-metal dual boot
  3 -> vm
  4 -> vm with encrypt"
  read -p "> " target_selected

  case $target_selected in
    1) # "bare-metal" target
      DEVICE=nvme0n1
      DEVICE_PATH=/dev/nvme0n1
      DEVICE_PATH_PART1=/dev/nvme0n1p1

      ;;

    2) # "bare-metal dual boot" target
      echo "not implemented"
      ;;

    3) # "vm" target
      DEVICE=vda
      DEVICE_PATH=/dev/vda
      DEVICE_PATH_PART1=/dev/vda1
      DEVICE_PATH_PART2=/dev/vda2
      ;;

    4) # "vm with encrypt" target
      DEVICE=vda
      DEVICE_PATH=/dev/vda
      DEVICE_PATH_PART1=/dev/vda1
      DEVICE_PATH_PART2=/dev/vda2

      partition_disk $DEVICE_PATH
      encrypt_partition $DEVICE $DEVICE_PATH_PART2
      cryptsetup open --type luks2 $DEVICE_PATH_PART2 container

      mkfs.fat -F32 $DEVICE_PATH_PART1
      mkfs.btrfs /dev/mapper/container
      create_btrfs_subvolumes /dev/mapper/container /mnt
      mount_partion_and_subvolumes $DEVICE_PATH_PART1 /dev/mapper/container /mnt
      ;;

    *)
      echo "invalid op"
      exit
      ;;
  esac

  create_swapfile /mnt/.swap/swapfile

  mkdir /mnt/etc
  genfstab -U /mnt > /mnt/etc/fstab

  reflector \
    --latest 20 \
    --protocol http \
    --protocol https \
    --sort rate \
    --save /etc/pacman.d/mirrorlist \
    --verbose
  yes | pacstrap \
    /mnt \
    base \
    btrfs-progs \
    intel-ucode \
    linux \
    linux-firmware \
    networkmanager

else
  # if variable exists
fi


cp arch_install2.sh /mnt
cd && cp -r setups /mnt

arch-chroot /mnt ./arch_install2.sh
