DESCRIPTION = "Basic image openrexpicam"
LICENSE = "MIT"

inherit core-image

IMAGE_FEATURES += " package-management"

IMAGE_INSTALL += " \
	gstreamer \
	i2c-tools \
	gstreamer1.0-plugins-imx \
	gst1.0-fsl-plugin \
	v4l-utils \
  	psplash \
	imx-test \
"



