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
Arkane Linux is a a full rebuild of Arch Linux for the x86-64-v3 architecture target.

## Getting Arkane Linux
Arkane Linux provides ISO images over at the [Arkane Linux download page](https://download.arkanelinux.org/).

## Building the ISO
### 1. Install the build tools

```bash
sudo pacman -S archiso
```

### 2. Pull the repository

```bash
git clone https://github.com/arkanelinux/arkaneiso.git
```

### 3. Build

```bash
cd arkaneiso
sudo mkarchiso -v -w workdir/ -o out/ .
```

Once the building process is finished you can find the ISO image inside of the `./out` directory.

### 4. Rebuilding the ISO
When building a second time you will have to remove the `./out` and `./workdir` directories.

```bash
sudo rm -rf ./out ./workdir
```

## Development
Contributions, in any form, be it code or ideas are always welcome!

### Getting started as a contributor
Refer to the ArchWiki page on [Archiso](https://wiki.archlinux.org/title/Archiso) for information. Or follow the introductionary videos and articles by Erik Dubois on the Carli project, if you are GNU/Linux savvy the [Carli-1](https://www.arcolinuxiso.com/carli-1/) series of videos should provide you with all the information you need to get started.
