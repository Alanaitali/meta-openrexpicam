# Recipe created by recipetool
# This is the basis of a recipe and may need further editing in order to be fully functional.
# (Feel free to remove these comments when editing.)
#
# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
# your responsibility to verify that the values are complete and correct.
#
# NOTE: multiple licenses have been detected; if that is correct you should separate
# these in the LICENSE value using & if the multiple licenses all apply, or | if there
# is a choice between the multiple licenses. If in doubt, check the accompanying
# documentation to determine which situation is applicable.
LICENSE = "Unknown"
LIC_FILES_CHKSUM = "file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0 \
                    file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
                    file://COPYING.libdvbv5;md5=28fb0f8e5cecc8a7a1a88008019dc3d0 \
                    file://lib/libv4l1/libv4l1-kernelcode-license.txt;md5=94ffa3f5ac6ac610c78af326444b3e71"

# No information for SRC_URI yet (only an external source tree was specified)
SRC_URI = ""

# NOTE: the following prog dependencies are unknown, ignoring: moc-qt5 moc uic-qt5 uic rcc-qt5 rcc
DEPENDS = "udev"
# NOTE: if this software is not capable of being built in a separate build directory
# from the source, you should replace autotools with autotools-brokensep in the
# inherit line
inherit pkgconfig gettext autotools

# Specify any options you want to pass to the configure script using EXTRA_OECONF:
EXTRA_OECONF = ""

