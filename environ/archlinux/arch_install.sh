#!/usr/bin/env bash

# dicas-> loadkeys br-abnt2

# create partitions
parted -s /dev/sda \
  mklabel gpt \
  mkpart primary 1MiB 500MiB \
  mkpart primary 500MiB 100% \
  --align optimal \
  align-check min 1

## config luks2
modprobe dm-crypt
modprobe dm-mod

SECTOR_SIZE=$(cat /sys/block/sda/queue/physical_block_size)
cryptsetup \
  --type luks2 \
  --cipher aes-xts-plain64 \
  --hash sha256 \
  --key-size 512 \
  --pbkdf argon2i \
  --sector-size $SECTOR_SIZE \
  --align-payload $(expr $SECTOR_SIZE / 512) \
  --use-urandom \
  --verify-passphrase \
  luksFormat /dev/sda2
cryptsetup open --type luks2 /dev/sda2 container

mkfs.fat -F32 /dev/sda1
mkfs.btrfs /dev/mapper/container

mount /dev/mapper/container /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@swap
btrfs subvolume create /mnt/@snapshots
umount /mnt

mount -o defaults,autodefrag,compress=zstd,commit=120,subvol=@     /dev/mapper/container /mnt
mkdir /mnt/{boot,home,swap,snapshots}
mount /dev/sda1 /mnt/boot
mount -o defaults,autodefrag,compress=zstd,commit=120,subvol=@home /dev/mapper/container /mnt/home
mount -o notatime,subvol=@swap                                     /dev/mapper/container /mnt/swap
mount -o subvol=@snapshots                                         /dev/mapper/container /mnt/snapshots

## swapfile
touch /mnt/swap/swapfile
chmod 600 /mnt/swap/swapfile
chattr +C /mnt/swap/swapfile
dd if=/dev/zero of=/mnt/swap/swapfile bs=1M count=4096 status=progress
mkswap /mnt/swap/swapfile
swapon /mnt/swap/swapfile

mkdir /mnt/etc
genfstab -U /mnt >> /mnt/etc/fstab

reflector --latest 20 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist # mirrors
yes | pacstrap /mnt base linux linux-firmware networkmanager intel-ucode btrfs-progs

cp arch_install2.sh /mnt
cd && cp -r setups /mnt

arch-chroot /mnt ./arch_install2.sh
