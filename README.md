# Arkane Linux build scripts
The Arkane Linux build scripts are used to build the Arkane Linux installation ISO images.

## Getting Arkane Linux
Arkane Linux provides ISO images over at the [Arkane Linux download page](https://download.arkanelinux.org/).

## Building the ISO
### 1. Install the build tools
```
sudo pacman -S archiso
```
### 2. Pull the repository
```
git clone https://github.com/arkanelinux/build-scripts.git
```
### 3. Build
```
cd build-scripts
sudo mkarchiso -v -w workdir/ .
```
Once the building process is finished you can find the ISO image inside of the `./out` directory.
### 4. Rebuilding the ISO
When building a second time you will have to remove the `./out` and `./workdir`.
```
sudo rm -rf ./out ./workdir
```

## Development
Contributions, in any form, be it code or ideas are always welcome!
### Getting started as a contributor
Refer to the ArchWiki page on [Archiso](https://wiki.archlinux.org/title/Archiso) for information. Or follow the introductionary videos and articles by Erik Dubois on the Carli project, if you are GNU/Linux savvy the [Carli-1](https://www.arcolinuxiso.com/carli-1/) series of videos should provide you with all the information you need to get started.
