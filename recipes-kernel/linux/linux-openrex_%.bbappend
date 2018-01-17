FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append_imx6s-openrex += " \
	file://0001-add-imx219.c.patch \
	file://0001-add-makefile-et-kconfig.patch \
	file://defconfig \
	file://0001-add-devicetree.patch \
"
