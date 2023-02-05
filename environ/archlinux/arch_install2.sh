#!/usr/bin/env bash

DISK="nvme0n1"
PART="p"

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

echo "password root"
passwd

# users
useradd -m marcos
echo "password marcos"
passwd marcos


## conf zram
echo 'zram' > /etc/modules-load.d/zram.conf
echo 'options zram num_devices=1' > /etc/modprobe.d/zram.conf

RAM_SIZE=$(free -m | sed -n '2 p' | awk '{print $2}')
echo "KERNEL==\"zram0\", ATTR{comp_algorithm}=\"zstd\", ATTR{disksize}=\"${RAM_SIZE}m\" RUN=\"/usr/bin/mkswap /dev/zram0\", TAG+=\"systemd\"" > /etc/udev/rules.d/99-zram.rules

echo "/dev/zram0 none swap defaults,pri=100 0 0" >> /etc/fstab


## config mkinitcpio
HOOKS=$(cat /etc/mkinitcpio.conf | grep ^HOOKS)
if [[ $HOOKS == *"keyboard"* ]] ; then
  sed -e s/keyboard//g -i /etc/mkinitcpio.conf
fi
if [[ $HOOKS == *"encrypt"* ]] ; then
  sed -e s/encrypt//g -i /etc/mkinitcpio.conf
fi
if [[ $HOOKS == *"resume"* ]] ; then
  sed -e s/resume//g -i /etc/mkinitcpio.conf
fi
sed -e "s/autodetect/autodetect keyboard/g"  -i /etc/mkinitcpio.conf
sed -e "s/keyboard/keyboard keymap/g"        -i /etc/mkinitcpio.conf
sed -e "s/filesystems/encrypt filesystems/g" -i /etc/mkinitcpio.conf
sed -e "s/fsck/resume fsck/g"                -i /etc/mkinitcpio.conf
sed -e "s/  / /g"                            -i /etc/mkinitcpio.conf
mkinitcpio -p linux

## config systemd-boot
bootctl install
echo -e "default arch\ntimeout 2" > /boot/loader/loader.conf

pacman -S --needed curl gcc
curl \
  https://raw.githubusercontent.com/osandov/osandov-linux/master/scripts/btrfs_map_physical.c \
  -o btrfs_map_physical.c
gcc -O2 -o btrfs_map_physical btrfs_map_physical.c
RESUME_OFFSET=$(./btrfs_map_physical /.swap/swapfile | head -n 2 | tail -1 | awk '{print $NF}')
RESUME_OFFSET=$(expr $RESUME_OFFSET / $(getconf PAGESIZE))

UUID_STORAGE_DEVICE=$(blkid -s UUID -o value /dev/$DISK${PART}2)
CRYPT_DEVICE="cryptdevice=UUID=$UUID_STORAGE_DEVICE:container:allow-discards" # :allow-discards to enable TRIM commands
DISABLE_WORKQUEUE="no-read-workqueue,no-write-workqueue" # for better performance in ssd, not recomended for hdd
ROOT_DEVICE="root=/dev/mapper/container"
ROOT_FLAGS="rootflags=subvol=@"
RESUME_DEVICE="resume=/dev/mapper/container" # for hibernation
RESUME_OFFSET="resume_offset=$RESUME_OFFSET" # when swap is a swapfile
OTHER_PARAMETERS="zswap.enabled=0" # disable zswap,  add snd_intel_dspcfg.dsp_driver=1 for  enable audio intel driver, add ibt=off for run virtualbox
KERNEL_PARAMETERS="$CRYPT_DEVICE,$DISABLE_WORKQUEUE $ROOT_DEVICE rw $ROOT_FLAGS $RESUME_DEVICE $RESUME_OFFSET $OTHER_PARAMETERS"

echo -e "title Archlinux
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
options $KERNEL_PARAMETERS" > /boot/loader/entries/arch.conf

systemctl enable NetworkManager
systemctl enable fstrim.timer
