#!/usr/bin/env bash

# dicas-> loadkeys br-abnt2

# create partitions
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/sda
  g # clear the disk and create GPT table
  n # new partition
  1 # partition number 1
    # default
  +500M # 500 MB efi parttion
  t # change the type partition
  1 # selected type EFI system
  n # new partition
  2 # partion number 2
    # default
    # full size partition
  w # write and exit
EOF

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
cryptsetup open --type luks2 /dev/sda2 luks_part

mkfs.fat -F32 /dev/sda1
mkfs.btrfs /dev/mapper/luks_part

mount /dev/mapper/luks_part /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@swap
umount /mnt

mount -o autodefrag,compress=zstd,subvol=@ /dev/mapper/luks_part /mnt
mkdir /mnt/{boot,home,swap}
mount /dev/sda1 /mnt/boot
mount -o autodefrag,compress=zstd,subvol=@home /dev/mapper/luks_part /mnt/home
mount -o subvol=@swap                          /dev/mapper/luks_part /mnt/swap


mkdir /mnt/etc
genfstab -U /mnt >> /mnt/etc/fstab

# mirrors
yes | pacman -S reflector
reflector --latest 20 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
yes | pacstrap /mnt base linux linux-firmware networkmanager intel-ucode btrfs-progs

cp arch_install2.sh /mnt
cd && cp -r setups /mnt

arch-chroot /mnt ./arch_install2.sh

