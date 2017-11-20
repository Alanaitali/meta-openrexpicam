## meta-openrexpicam for IMX6 Openrex Basic (Solo):

Creation of an Openrex Basic meta to use the Raspberry PI Camera v2.

# How to create an image for Yocto Project 2.0

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

## Prerequisites

First we need to get the command repo

```
sudo aptitude install repo
sudo aptitude update
sudo aptitude upgrade
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

Create the manifest filee

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
sudo dd if=build-openrex/tmp/deploy/images/imx6s-openrex/core-image-base-imx6q-openrex.sdcard of=/dev/sdb
umount /dev/YourSDCard
```

## 7) Boot the OpenRex

Now plug your SD card in the OpenRex and it will boot on your Yocto image.

## Built with

* [Yocto 2.0](https://www.yoctoproject.org/downloads/core/jethro20) - The tool used to create our image

## Built for

* [OpenRex](http://www.imx6rex.com/open-rex/) - Development board used

## Authors

* **Alan Ait-Ali** - *Contributor* - [His Github](https://github.com/Alanaitali)
* **Martin Laporte** - *Contributor* - [His Github](https://github.com/Zoyolin)
* **Clément Ailloud** - *Contributor* - [His Github](https://github.com/clement-ailloud)
* **Romain Petit** - *Contributor* - [His Github](https://github.com/petit-romain)

## Acknowledgments

* **FEDEVEL** - *For their Yocto 2.0 image tutorial* - [Tutorial](https://github.com/FEDEVEL/meta-openrex/)
