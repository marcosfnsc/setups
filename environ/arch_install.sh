#!/usr/bin/env bash

pacstrap /mnt base linux linux-firmware

genfstab -U -p /mnt /mnt/etc/fstab

arch-chroot /mnt

# fuso de brasilia
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# layout do teclado do sistema
echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

hostnamectl set-hostname note
