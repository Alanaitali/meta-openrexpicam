## meta-openrexpicam for IMX6 Openrex Basic (Solo):

Creation of an Openrex Basic meta to use the Raspberry PI Camera v2

# How to create an image for Yocto Project 2.1

Follow the instructions below to create an Yocto Projet Krogoth image

## Prerequisites

First we need to get the command repo with package

```
$: sudo aptitude install repo
$: sudo aptitude update
$: sudo aptitude upgrade
```

or by downloading it

```
$: mkdir bin
$: curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > bin/repo
$: chmod a+x bin/repo
$: PATH=${PATH}:bin
```

Then create our work directory

```
$: mkdir fsl-community-bsp && cd fsl-community-bsp
```

## 1) Get our YOCTO project 

Download Yocto project using this command :

```
$: repo init -u git@github.com:petit-romain/fsl-community-bsp-platform.git
```

## 2) Download all repositories needed

```
$: repo sync
```

## 3) Source and build our custom image

```
$: DISTRO=poky MACHINE=imx6-openrexbasic source setup-environment build-dir
$: bitbake openrexpicam-base-image
```

## 4) Mount to the SD card

```
$: umount /dev/YourSDCard
$: gunzip -c build-dir/tmp/deploy/images/imx6-openrexbasic/core-image-base-imx6-openrexbasic.sdcard.gz > build-openrex/tmp/deploy/images/imx6-openrexbasic/core-image-base-imx6-openrexbasic.sdcard
$: sudo dd if=build-openrex/tmp/deploy/images/imx6-openrexbasic/core-image-base-imx6-openrexbasic.sdcard of=/dev/YourSDCard
$: umount /dev/YourSDCard
```

## 5) Set Bootmmc

If you have an error like : Error "bootmmc" not defined, fix this issue by typing the command below after having stopped the card boot :

```
setenv bootmmc "run findfdt; mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else run netboot; fi;\0"; saveenv; reset;
```

## 6) Boot on the OpenRex

Now plug your SD card in the OpenRex and it will boot on our Yocto image.

## Built with

* [Yocto 2.1 Krogoth](https://www.yoctoproject.org/downloads/core/krogoth21) - Tool used to create our image
* [fsl-community-bsp-base](https://github.com/petit-romain/fsl-community-bsp-base) - Our bsp-base repository
* [fsl-community-bsp-platform](https://github.com/petit-romain/fsl-community-bsp-platform) - Our bsp-platform repository
* [Ubuntu 16.04](https://www.ubuntu.com/) - Host and build machine OS

## Built for

* [OpenRex](http://www.imx6rex.com/open-rex/) - Development board used

## Authors

* **Alan Ait-Ali** - *Contributor* - [His Github](https://github.com/Alanaitali)
* **Martin Laporte** - *Contributor* - [His Github](https://github.com/Zoyolin)
* **Clément Ailloud** - *Contributor* - [His Github](https://github.com/clement-ailloud)
* **Romain Petit** - *Contributor* - [His Github](https://github.com/petit-romain)

## Acknowledgments

* **Voipac** - *For their Yocto 2.1 image tutorial* - [Tutorial](http://wiki.voipac.com/xwiki/bin/view/imx6+tinyrex/yocto)
