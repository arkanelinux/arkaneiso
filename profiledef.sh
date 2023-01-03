#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="arkanelinux"
iso_label="ARKANE_$(date +%Y%m)"
iso_publisher="Arkane Linux <https://arkanelinux.org>"
iso_application="Arkane Linux Live/Rescue CD"
iso_version="$(date +%Y.%m.%d)"
install_dir="arkane"
buildmodes=('iso')
bootmodes=(
	'uefi-x64.systemd-boot.esp'
	'uefi-x64.systemd-boot.eltorito'
)
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '15' '-b' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/generate_locale"]="0:0:755"
  ["/etc/default/useradd"]="0:0:600"
  ["/etc/gshadow"]="0:0:400"
  ["/etc/sudoers"]="0:0:400"
  ["/etc/locale.gen"]="0:0:644"
  ["/etc/lsb-release"]="0:0:644"
)
