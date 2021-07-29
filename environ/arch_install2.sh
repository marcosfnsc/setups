#!/usr/bin/env bash

## fuso de brasilia
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc --utc

## layout do teclado do sistema
echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

## lang
sed -e "s/#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/g" -i /etc/locale.gen
locale-gen
echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
export $(cat /etc/locale.conf)

hostnamectl set-hostname note

echo "password root"
passwd

# users
useradd -m marcos
echo "password marcos"
passwd marcos

## config mkinitcpio
HOOKS=$(cat /etc/mkinitcpio.conf | grep ^HOOKS)
if [[ $HOOKS == *"keyboard"* ]] ; then
  sed -e s/keyboard//g -i /etc/mkinitcpio.conf
fi
if [[ $HOOKS == *"encrypt"* ]] ; then
  sed -e s/encrypt//g -i /etc/mkinitcpio.conf
fi
if [[ $HOOKS == *"lvm2"* ]] ; then
  sed -e s/lvm2//g -i /etc/mkinitcpio.conf
fi
sed -e "s/autodetect/autodetect keyboard/g" -i /etc/mkinitcpio.conf
sed -e "s/filesystems/encrypt filesystems/g" -i /etc/mkinitcpio.conf
sed -e "s/filesystems/lvm2 filesystems/g" -i /etc/mkinitcpio.conf
sed -e "s/  / /g" -i /etc/mkinitcpio.conf
mkinitcpio -p linux

## config grub
pacman -S grub efibootmgr os-prober mtools dosfstools
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

UUID_SDA3=$(lsblk -no NAME,UUID /dev/sda3|head -n 1 | awk '{print $2}')
sed -e "s;GRUB_CMDLINE_LINUX_DEFAULT=\"[[:print:]]*\";GRUB_CMDLINE_LINUX_DEFAULT=\"cryptdevice=UUID="$UUID_SDA3":cryptlvm root=/dev/lvgroup/root\";g" -i etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable sddm

#other scripts
cd setups/environ && ./anylinux.sh

cd / && rm -rf setups arch_install2.sh