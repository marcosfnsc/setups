#!/usr/bin/env bash

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
  +1G # 1 GB boot parttion
  n # new partition
  3 # partion number 3
    # default
    # full size partition
  w # write and exit
EOF

# config luks2
modprobe dm-crypt
modprobe dm-mod

# config luks2
cryptsetup \
  --type luks2 \
  --cipher aes-xts-plain64 \
  --hash sha256 \
  --key-size 512 \
  --pbkdf argon2i \
  --sector-size $(cat /sys/block/sda/queue/physical_block_size) \
  --use-urandom \
  --verify-passphrase \
  luksFormat /dev/sda3
cryptsetup open --type luks2 /dev/sda3 luks_part

# config lvm

pvcreate --dataalignment 1m /dev/mapper/luks_part
vgcreate lvgroup /dev/mapper/luks_part
lvcreate -L 4GB      lvgroup -n swap
lvcreate -L 60GB     lvgroup -n root
lvcreate -l 100%FREE lvgroup -n home

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/lvgroup/swap
swapon /dev/lvgroup/swap
mkfs.btrfs /dev/lvgroup/root
mkfs.btrfs /dev/lvgroup/home

mount /dev/lvgroup/root /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
mkdir /mnt/home
mount /dev/lvgroup/home /mnt/home

mkdir /mnt/etc
genfstab -U /mnt > /mnt/etc/fstab

#pacstrap /mnt base linux linux-firmware

#arch-chroot /mnt

## fuso de brasilia
#ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

## layout do teclado do sistema
#echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

#hostnamectl set-hostname note
