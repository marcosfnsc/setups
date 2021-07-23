#!/usr/bin/env bash

## fuso de brasilia
#ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

## layout do teclado do sistema
echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

hostnamectl set-hostname note

# root password
passwd

# users
useradd -m marcos
passwd marcos

pacman -S grub efibootmgr os-prober mtools dosfstools
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

#other scripts
cd setups/environ && ./anylinux.sh

cd / && rm -rf setups arch_install2.sh
