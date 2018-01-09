FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append_imx6s-openrex += " \
	file://0001-solution-2.patch \
	file://defconfig \
"
