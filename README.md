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
Arkane Linux is an opinionated, immutable multi-root Arch-based distibution which aims to provide a GNOME-centered experienced with minimal yet full featured and sensible non-intrusive defaults.

Is immutability not your thing but still want to experience the arkane? Normal installation ISOs are also available.

## Getting Arkane Linux
Arkane Linux provides ISO images over at the [Arkane Linux download page](https://download.arkanelinux.org/).

## Available configurations
| Config | About |
| --- | --- |
| baseline | An ultra-minimal basic configuration suitable as a template for new configs |
| gnome | The Arkane Linux flagship release, a GNOME-centered experience featuring a graphical installer |

## Development
Contributions, in any form, be it code or ideas are always welcome!

### Building the ISO
#### 1. Install the build tools

```
sudo pacman -S archiso
```

#### 2. Pull the repository
```
git clone https://github.com/arkanelinux/arkaneiso.git
```

#### 3. Prepare localrepo
Some configs such as the one for GNOME are configured by default to utilize a local package repo to allow for the offline installation of Arkane Linux.

```
# Pull and cache the packages
pacman -Syw \
    --noconfirm \
    --cachedir $(pwd)/airootfs/var/localrepo/ \
    --dbpath /tmp \
    - < /path/to/package.list

# Generating a database
cd $(pwd)/airootfs/var/localrepo
repo-add ./localrepo.db.tar ./*[^sig]
```

#### 4. Building an ISO
```
sudo mkarchiso -v -w workdir/ -o out/ .
```

Once the building process is finished you can find the ISO image inside of the `./out` directory.

### How to start hacking
Refer to the ArchWiki page on [Archiso](https://wiki.archlinux.org/title/Archiso) for information. Or follow the introductionary videos and articles by Erik Dubois on the Carli project, if you are GNU/Linux savvy the [Carli-1](https://www.arcolinuxiso.com/carli-1/) series of videos should provide you with all the information you need to get started.
