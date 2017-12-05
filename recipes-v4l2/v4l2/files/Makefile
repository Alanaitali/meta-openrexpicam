# bitbake -c populate sdk
# dans 				: ${repo}/fsl-community-bsp/build-imx6rex.com/tmp/deploy/sdk/
# pour moi 		: repo=/home/diag/Documents/cours/Projet Thales/workspaceThales_l/YOCTO/
# Executer  		: ./poky-glibc-x86_64-meta-toolchain-cortexa9hf-vfp-neon-toolchain-2.0.3.sh
# source  			: . /opt/poky/2.0.3/environment-setup-cortexa9hf-vfp-neon-poky-linux-gnueabi
# \_ou					:	. Thales cross v4l2
BUILD_DIR=/home/diag/workspaceThales/YOCTO/fsl-community-bsp/build-imx6rex.com
IMX6S_DIR=$BUILD_DIR/tmp/work/imx6s_openrex-poky-linux-gnueabi
# cross-toolchain
# CC						: arm-poky-linux-gnueabi-gcc -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/opt/poky/2.0.3/sysroots/cortexa9hf-vfp-neon-poky-linux-gnueabi
# dossier où se trouve linux/init.h
DIRLINUX=$IMX6S_DIR/linux-openrex/3.14-r0/git/include
# dossier où se trouve linux/posix_typescd.h
DIRLINUX2=$IMX6S_DIR/u-boot-openrex/v2015.10+gitAUTOINC+7d8ddd7de7-r0/git/include
# dossier où se trouve asm/cache.h
DIRASM=$IMX6S_DIR/u-boot-openrex/v2015.10+gitAUTOINC+7d8ddd7de7-r0/git/arch/arm/include
# dossier où se trouve asm/bitsperlong.h
DIRASM2=$IMX6S_DIR/linux-openrex/3.14-r0/build/arch/arm/include/generated
# dossier où se trouve asm/posix_types.h
DIRASM3=$IMX6S_DIR/u-boot-openrex/v2015.10+gitAUTOINC+7d8ddd7de7-r0/git/arch/arm/include/
# commande gcc : $CC imx219.c -I$DIRLINUX -I$DIRASM

obj-m := imx219.o

SRC := $(shell pwd)

#COMPILATION PAR : arm-poky-linux-gnueabi-gcc
INC_DIR=$(DIRLINUX):$(DIRASM)
CFLAGS=-c											#do not run linker
CFLAGS=$CFLAGS -I$(INC_DIR)	 	#add includes directories

#COMPILATION PAR : make
MAKE=make
MFLAGS=-C 											#do not run linker


all: imx219.o

%.o: %.c $(DEPS)
    $(CC) -o $@ $< $(CFLAGS)

all:
	$(MAKE) -C $(INC_DIR_MAKE) M=$(SRC)
	$(MAKE) -C M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
	rm -f Module.markers Module.symvers modules.order
	rm -rf .tmp_versions Modules.symvers
	$( MAKE ) - C /lib/modules/ $( shell uname -r)/build M = $( PWD ) clean
