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

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

#pacstrap /mnt base linux linux-firmware

#genfstab -U -p /mnt /mnt/etc/fstab

#arch-chroot /mnt

## fuso de brasilia
#ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

## layout do teclado do sistema
#echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

#hostnamectl set-hostname note
