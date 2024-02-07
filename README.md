<div align="center">
	<a href="https://arkanelinux.org" align="center">
		<center align="center">
			<picture>
			 	<img src="https://raw.githubusercontent.com/arkanelinux/artwork/main/arkanelinux-logo/1200x1200/arkanelinux-logo.png" alt="Arkane Linux" align="center" height="200">
			</picture>
		</center>
	</a>
	<br>
	<h1 align="center"><center>Arkane Linux</center></h1>
	<h3 align="center"><center>Archiso configuration for disk image creation</center></h3>
	<br>
	<br>
</div>

<br>


## What is Arkane Linux
Arkane Linux is an opinionated, immutable, atomic, multi-root Arch-based distibution which aims to provide a GNOME-centered experienced with minimal yet full featured and sensible non-intrusive defaults.

Is immutability not your thing but still want to embrace the Arkane? Normal installation ISOs are also available.

## Getting Arkane Linux
Arkane Linux provides ISO images over at the [Arkane Linux download page](https://arkanelinux.org/downloads).

## Available configurations
| Config | About |
| --- | --- |
| gnome-arkdep | Arkdep-based immutable version of Arkane Linux's flagship release, a GNOME-centered experience featuring a graphical installer |
| gnome | A standard version of the Arkane Linux flagship release, a GNOME-centered experience featuring a graphical installer |
| baseline | An ultra-minimal basic configuration suitable as a template for new archiso configs |

## Spinning an ISO image
Build requirements;
- `archiso` and `pacman` are installed
- Depending on which ISO you want to build you need to also have a clone of either [os-installer-config](https://github.com/arkanelinux/os-installer-config) or [os-installer-config-arkdep](https://github.com/arkanelinux/os-installer-config-arkdep) for the `gnome` and `gnome-arkdep` variants respectively.

The `gnome` and `gnome-arkdep` images expect a local repository to be available on-disk, this localrepo will allow for the installation of the core system without the need to download packages.

Build this cache like so;
```shell
# Create the localrepo directory inside of the ISO variant you wish to build if it does not yet exist
mkdir ./arkaneiso/gnome/airootfs/var/localrepo

# For the GNOME variant
sudo pacman -Syw --noconfirm --cachedir ./arkaneiso/gnome/airootfs/var/localrepo/ --dbpath /tmp - < ./os-installer-config/bits/{base.list,gnome.list}

# For the GNOME Arkdep variant
sudo pacman -Syw --noconfirm --cachedir ./arkaneiso/gnome-arkdep/airootfs/var/localrepo/ --dbpath /tmp - < ./os-installer-config-arkdep/bits/{base.list,arkdep.list}

# Navigate to the airootfs/var/localrepo directory and generate the repository database
repo-add ./localrepo.db.tar ./*[^sig]
```

Then spin the ISO with mkarchiso;
```
sudo mkarchiso -v -w workdir/ -o out/ .
```

Once the building process is finished you can find your ISO image inside of the `./out` directory.

## How to start hacking
Refer to the ArchWiki page on [Archiso](https://wiki.archlinux.org/title/Archiso) for information. Or follow the introductionary videos and articles by Erik Dubois on the Carli project, if you are GNU/Linux savvy the [Carli-1](https://www.arcolinuxiso.com/carli-1/) series of videos should provide you with all the information you need to get started.
