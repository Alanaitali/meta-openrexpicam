## meta-openrexpicam for IMX6 Openrex Basic (Solo):

Creation of an Openrex Basic meta to use the Raspberry PI Camera v2

# How to create an image for Yocto Project 2.0

Follow instructions below to create an Yocto Projet Jethro image

## Prerequisites

First we need to get the command repo

```
sudo aptitude install repo
sudo aptitude update
sudo aptitude upgrade
```

or by downloading it

```
mkdir bin
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > bin/repo
chmod a+x bin/repo
PATH=${PATH}:bin
```

Then create our work directory

```
mkdir fsl-community-bsp && cd fsl-community-bsp
```

## 1) Get YOCTO project from Freescale

Download Yocto project using this command

```
repo init -u https://github.com/Freescale/fsl-community-bsp-platform -b jethro
```

## 2) Create the manifest file


Create manifest directory

```
mkdir -p .repo/local_manifests/
```

Create the manifest file

```
cat > .repo/local_manifests/imx6openrex.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <remote fetch="git://github.com/FEDEVEL" name="fedevel"/>
    <project remote="fedevel" revision="jethro" name="meta-openrex" path="sources/meta-openrex">
        <copyfile src="openrex-setup.sh" dest="openrex-setup.sh"/>
	</project>
</manifest>
EOF
```

## 3) Download all repositories needed

```
repo sync
```

## 4) Add OpenRex meta layer

```
source openrex-setup.sh
```

## 5) Setup and build console image

```
MACHINE=imx6s-openrex source setup-environment build-openrex
MACHINE=imx6s-openrex bitbake core-image-base
```

## 6) Mount to the SD card

```
umount /dev/YourSDCard
gunzip -c build-openrex/tmp/deploy/images/imx6s-openrex/core-image-base-imx6s-openrex.sdcard.gz > build-openrex/tmp/deploy/images/imx6s-openrex/core-image-base-imx6s-openrex.sdcard
sudo dd if=build-openrex/tmp/deploy/images/imx6s-openrex/core-image-base-imx6q-openrex.sdcard of=/dev/YourSDCard
umount /dev/YourSDCard
```

# How to create an image for Yocto Project 2.1

Follow the instruction below to create an Yocto Projet Krogoth image

## Prerequisites

First we need to get the command repo with package

```
sudo aptitude install repo
sudo aptitude update
sudo aptitude upgrade
```

or by downloading it

```
mkdir bin
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > bin/repo
chmod a+x bin/repo
PATH=${PATH}:bin
```

Then create our work directory

```
mkdir fsl-community-bsp && cd fsl-community-bsp
```

## 1) Get YOCTO project from Freescale

Download Yocto project using this command

```
repo init -u git://git.freescale.com/imx/fsl-arm-yocto-bsp.git -b imx-4.1-krogoth
```

## 2) Create the manifest file


Create manifest directory

```
mkdir -p .repo/local_manifests/
```

Create the manifest file

```
cat > .repo/local_manifests/imx6rex.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <remote fetch="git://github.com/Voipac" name="voipac"/>
    <project remote="voipac" revision="master" name="meta-fsl-arm-voipac" path="sources/meta-fsl-arm-voipac">
        <copyfile src="voipac-setup.sh" dest="voipac-setup.sh"/>
    </project>
</manifest>
EOF
```

## 3) Download all repositories needed

```
repo sync
```

## 4) Add OpenRex meta layer

```
source voipac-setup.sh
```

## 5) Setup and build console image

```
MACHINE=imx6-openrexbasic source setup-environment build-dir
MACHINE=imx6-openrexbasic bitbake core-image-base
```

## 6) Mount to the SD card

```
umount /dev/YourSDCard
gunzip -c build-dir/tmp/deploy/images/imx6-openrexbasic/core-image-base-imx6-openrexbasic.sdcard.gz > build-openrex/tmp/deploy/images/imx6-openrexbasic/core-image-base-imx6-openrexbasic.sdcard
sudo dd if=build-openrex/tmp/deploy/images/imx6-openrexbasic/core-image-base-imx6-openrexbasic.sdcard of=/dev/YourSDCard
umount /dev/YourSDCard
```

## 7) Set Bootmmc

You will get an error like : Error "bootmmc" not defined, to fix this issue use the command below

```
setenv bootmmc "run findfdt; mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else run netboot; fi;\0"; saveenv; reset;
```

## Boot the OpenRex

Now plug your SD card in the OpenRex and it will boot on your Yocto image.

## Built with

* [Yocto 2.0 Jethro](https://www.yoctoproject.org/downloads/core/jethro20) - Tool used to create our image
* [Yocto 2.1 Krogoth](https://www.yoctoproject.org/downloads/core/krogoth21) - Tool used to create our image
* [Ubuntu 16.04](https://www.ubuntu.com/) - Host and build machine OS

## Built for

* [OpenRex](http://www.imx6rex.com/open-rex/) - Development board used

## Authors

* **Alan Ait-Ali** - *Contributor* - [His Github](https://github.com/Alanaitali)
* **Martin Laporte** - *Contributor* - [His Github](https://github.com/Zoyolin)
* **Clément Ailloud** - *Contributor* - [His Github](https://github.com/clement-ailloud)
* **Romain Petit** - *Contributor* - [His Github](https://github.com/petit-romain)

## Acknowledgments

* **FEDEVEL** - *For their Yocto 2.0 image tutorial* - [Tutorial](https://github.com/FEDEVEL/meta-openrex/)
* **Voipac** - *For their Yocto 2.1 image tutorial* - [Tutorial](http://wiki.voipac.com/xwiki/bin/view/imx6+tinyrex/yocto)
