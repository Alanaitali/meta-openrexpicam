AUTHOR = "Chomoly"
SUMMARY = "A low-level driver for IMX219 sensors"
LICENSE = "GPL"
LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"

inherit module

SRC_URI = "file://Makefile \
           file://camera.h \
           file://imx219.c \
           file://COPYING  \
          "

S = "${WORKDIR}"

# The inherit of module.bbclass will automatically name module packages with
# "kernel-module-" prefix as required by the oe-core build environment.
