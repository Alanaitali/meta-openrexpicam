FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append_imx6s-openrex += " \
	file://defconfig \
	file://0001-add-device-tree.patch \
	file://0001-add-driver.patch \
	file://0001-add-linux_fwnode.h.patch \
	file://0001-add-v4l2-fwnode.patch \
	file://0002-add-v4l2-mediabus.patch \
	file://0001-duplicate-pm_runtime-from-v4.12.8.patch \
"
