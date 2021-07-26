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

## config luks2
modprobe dm-crypt
modprobe dm-mod

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

## config lvm
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
mkdir -p /mnt/{boot,home}
mount /dev/sda2 /mnt/boot
mount /dev/lvgroup/home /mnt/home
mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

mkdir /mnt/etc
genfstab -U /mnt > /mnt/etc/fstab

# mirrors
pacman -Syu
yes | pacman -S reflector
reflector -c BR --sort rate -a 6 --save /etc/pacman.d/mirrorlist

APPS_INSTALL=(
  alacritty
  audacity
  clang
  cmake
  curl
  ffmpeg
  flatpak
  gcc
  gimp
  git
  gparted
  htop
  k3b
  kate
  lvm2
  neovim
  networkmanager
  nodejs
  okular
  openssh
  qbittorrent
  screenfetch
  the_silver_searcher
  tmux
  tree
  zsh
)
yes | pacstrap /mnt base linux linux-firmware ${APPS_INSTALL[@]}

cp arch_install2.sh /mnt
cd && cp -r setups /mnt

arch-chroot /mnt ./arch_install2.sh

