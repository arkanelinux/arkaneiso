<table style="border: 0px">
	<tr>
		<td style="border: 0px">
			<center>
				<picture>
				  <img src="https://raw.githubusercontent.com/arkanelinux/artwork/main/arkanelinux-logo/1200x1200/arkanelinux-logo.png" alt="Arkane linux" align="center" height="250">
				</picture>
			</center>
		</td>
	</tr>
	<tr style="background-color: white">
		<td style="border: 0px">
			<h1 align="center">Arkane Linux</h1>
			<h3 align="center" style="text-decoration: none">Archiso disk image building configuration</h3>
		</td>
	</tr>
</table>

---
<br>
<br>

## Getting Arkane Linux
Arkane Linux provides ISO images over at the [Arkane Linux download page](https://download.arkanelinux.org/).

## Building the ISO
### 1. Install the build tools
```
sudo pacman -S archiso
```
### 2. Pull the repository
```
git clone https://github.com/arkanelinux/arkaneiso.git
```
### 3. Build
```
cd arkaneiso
sudo mkarchiso -v -w workdir/ -o out/ .
```
Once the building process is finished you can find the ISO image inside of the `./out` directory.
### 4. Rebuilding the ISO
When building a second time you will have to remove the `./out` and `./workdir` directories.
```
sudo rm -rf ./out ./workdir
```

## Development
Contributions, in any form, be it code or ideas are always welcome!
### Getting started as a contributor
Refer to the ArchWiki page on [Archiso](https://wiki.archlinux.org/title/Archiso) for information. Or follow the introductionary videos and articles by Erik Dubois on the Carli project, if you are GNU/Linux savvy the [Carli-1](https://www.arcolinuxiso.com/carli-1/) series of videos should provide you with all the information you need to get started.
