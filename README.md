<div align="center">
	<a href="https://arkanelinux.org" align="center">
		<center align="center">
			<picture>
			 	<img src="https://raw.githubusercontent.com/arkanelinux/artwork/main/originals/arkanelinux-logo.png" alt="Arkane Linux" align="center" height="200">
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
 Arkane Linux is an opinionated, immutable, atomic Arch-based distibution which aims to provide a GNOME-centered experienced with minimal yet full featured and sensible non-intrusive defaults.

## Getting Arkane Linux
Arkane Linux provides ISO images over at the [Arkane Linux download page](https://arkanelinux.org/downloads).

## Spinning an ISO image
Build requirements;
- `archiso` and `pacman` are installed

Build the ISO with mkarchiso;
```
sudo mkarchiso -v -w workdir/ -o out/ .
```

Once the building process is finished you can find your ISO image inside of the `./out` directory.

## How to start hacking
Refer to the ArchWiki page on [Archiso](https://wiki.archlinux.org/title/Archiso) for information. Or follow the introductionary videos and articles by Erik Dubois on the Carli project, if you are GNU/Linux savvy the [Carli-1](https://www.arcolinuxiso.com/carli-1/) series of videos should provide you with all the information you need to get started.
