#!/usr/bin/bash

# This is an example installer script. For OS-Installer to use it, place it at:
# /etc/os-installer/scripts/install.sh
# The script gets called with the following environment variables set:
# OSI_LOCALE              : Locale to be used in the new system
# OSI_DEVICE_PATH         : Device path at which to install
# OSI_DEVICE_IS_PARTITION : 1 if the specified device is a partition (0 -> disk)
# OSI_DEVICE_EFI_PARTITION: Set if device is partition and system uses EFI boot.
# OSI_USE_ENCRYPTION      : 1 if the installation is to be encrypted
# OSI_ENCRYPTION_PIN      : The encryption pin to use (if encryption is set)

# sanity check that all variables were set
if [ -z ${OSI_LOCALE+x} ] || \
   [ -z ${OSI_DEVICE_PATH+x} ] || \
   [ -z ${OSI_DEVICE_IS_PARTITION+x} ] || \
   [ -z ${OSI_DEVICE_EFI_PARTITION+x} ] || \
   [ -z ${OSI_USE_ENCRYPTION+x} ] || \
   [ -z ${OSI_ENCRYPTION_PIN+x} ]
then
    echo "Installer script called without all environment variables set!"
    exit 1
fi

# Partition the disk
echo "Writing partition scheme to ${OSI_DEVICE_PATH}..."
sudo sfdisk $OSI_DEVICE_PATH < /etc/os-installer/bits/part.sfdisk

# Create filesystems on the created disk
echo "Partitioning ${OSI_DEVICE_PATH}1 with FAT32..."
sudo mkfs.fat -F32 ${OSI_DEVICE_PATH}1

echo "Partitioning ${OSI_DEVICE_PATH}2 with Swap..."
sudo mkswap ${OSI_DEVICE_PATH}2

echo "Partitioning ${OSI_DEVICE_PATH}3 with Btrfs..."
sudo mkfs.btrfs -L arkane_root ${OSI_DEVICE_PATH}3

# Mount partitions to /mnt and activate swap
echo "Mounting ${OSI_DEVICE_PATH}3 as root..."
sudo mount -o compress=zstd ${OSI_DEVICE_PATH}3 /mnt

echo "Mounting ${OSI_DEVICE_PATH}1 as boot..."
sudo mount --mkdir ${OSI_DEVICE_PATH}1 /mnt/boot

echo "Enabling swap on ${OSI_DEVICE_PATH}2..."
sudo swapon ${OSI_DEVICE_PATH}2

# Install base-packages to root
echo "Installing base packages to root..."
sudo pacstrap -K /mnt - < /etc/os-installer/bits/base-package.list

# Generate fstab
echo "Generating fstab..."
sudo genfstab -U /mnt | sudo tee /mnt/etc/fstab

# Copy pacman.conf to root
echo "Copying pacman configuration file to root..."
sudo cp /etc/pacman.conf /mnt/etc/pacman.conf

# Install remaining packages to root
echo "Installing packages to root..."
sudo arch-chroot /mnt pacman -S --noconfirm - < /etc/os-installer/bits/package.list

# Set up systemd-boot
echo "Installing and configuring systemd-boot..."
sudo arch-chroot /mnt bootctl install

exit 0
