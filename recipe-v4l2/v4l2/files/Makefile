#bitbake -c populate sdk
#dans 				: ${repo}/fsl-community-bsp/build-imx6rex.com/tmp/deploy/sdk/
#pour moi 		: repo=/home/diag/Documents/cours/Projet Thales/workspaceThales_l/YOCTO/
#Executer  		: ./poky-glibc-x86_64-meta-toolchain-cortexa9hf-vfp-neon-toolchain-2.0.3.sh
#source  			: . /opt/poky/2.0.3/environment-setup-cortexa9hf-vfp-neon-poky-linux-gnueabi
#BASEDIR			:
#CC						: $CC imx219.c -I$BASEDIR/build-imx6rex.com/tmp/work-shared/imx6s-openrex/kernel-source/include

#commande gcc : $CC imx219.c -I$BASEDIR/build-imx6rex.com/tmp/work-shared/imx6s-openrex/kernel-source/include

obj-m := imx219.o
#CC=
SRC := $(shell pwd)
BUILD_DIR = /home/diag/workspaceThales/YOCTO/fsl-community-bsp/build-imx6rex.com
INC_DIR = $(BUILD_DIR)/tmp/work-shared/imx6s-openrex/kernel-source/include/linux
CFLAGS=-c -Wall -I$(INC_DIR)
DEPS = split.h

all: imx219.o

%.o: %.cpp $(DEPS)
    $(CC) -o $@ $< $(CFLAGS)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
	rm -f Module.markers Module.symvers modules.order
	rm -rf .tmp_versions Modules.symvers
