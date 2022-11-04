#!/usr/bin/bash

# This is an example configuration script. For OS-Installer to use it, place it at:
# /etc/os-installer/scripts/configure.sh
# The script gets called with the environment variables from the install script
# (see install.sh) and these additional variables:
# OSI_USER_NAME          : User's name. Not ASCII-fied
# OSI_USER_AUTOLOGIN     : Whether to autologin the user
# OSI_USER_PASSWORD      : User's password. Can be empty if autologin is set.
# OSI_FORMATS            : Locale of formats to be used
# OSI_TIMEZONE           : Timezone to be used
# OSI_ADDITIONAL_SOFTWARE: Space-separated list of additional packages to install

# sanity check that all variables were set
if [ -z ${OSI_LOCALE+x} ] || \
   [ -z ${OSI_DEVICE_PATH+x} ] || \
   [ -z ${OSI_DEVICE_IS_PARTITION+x} ] || \
   [ -z ${OSI_DEVICE_EFI_PARTITION+x} ] || \
   [ -z ${OSI_USE_ENCRYPTION+x} ] || \
   [ -z ${OSI_ENCRYPTION_PIN+x} ] || \
   [ -z ${OSI_USER_NAME+x} ] || \
   [ -z ${OSI_USER_AUTOLOGIN+x} ] || \
   [ -z ${OSI_USER_PASSWORD+x} ] || \
   [ -z ${OSI_FORMATS+x} ] || \
   [ -z ${OSI_TIMEZONE+x} ] || \
   [ -z ${OSI_ADDITIONAL_SOFTWARE+x} ]
then
    echo "Installer script called without all environment variables set!"
    exit 1
fi

# Enable systemd services
while read i; do
	sudo arch-chroot /mnt systemctl enable $i
done < /etc/os-installer/bits/systemd.services

# Generate locales
sudo cp /etc/locale.gen /mnt/etc/locale.gen
sudo arch-chroot /mnt locale-gen

# Apply configuration tweaks
echo "Applying configuration..."
sudo cp /etc/os-installer/bits/gdm/custom.conf /mnt/etc/gdm/custom.conf
sudo arch-chroot /mnt chown gdm:gdm /etc/gdm/custom.conf
sudo cp /etc/os-installer/bits/systemd-boot/arkane.conf /mnt/boot/loader/entries/
sudo cp /etc/os-installer/bits/systemd-boot/arkane-fallback.conf /mnt/boot/loader/entries/
sudo cp /etc/os-installer/bits/systemd-boot/loader.conf /mnt/boot/loader/
sudo sed -i 's/#\ %wheel\ ALL=(ALL:ALL)\ ALL/%wheel\ ALL=(ALL:ALL)\ ALL/g' /mnt/etc/sudoers
echo "LANG=en_US.UTF-8" | sudo tee /mnt/etc/locale.conf

exit 0
