FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append_imx6-openrexbasic += " \
	file://0001-imx219-Kconfig.patch \
"
