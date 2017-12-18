DESCRIPTION = "Basic image openrexpicam"
LICENSE = "MIT"

inherit core-image

IMAGE_FEATURES += " package-management"

IMAGE_INSTALL += " \
    psplash \
"

export IMAGE_BASENAME = "openrexpicam-base-image"