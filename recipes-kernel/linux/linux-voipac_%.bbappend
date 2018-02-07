FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append_imx6-openrexbasic += " \
	file://0001-imx219-Kconfig.patch \
	file://0001-imx219-makefile.patch \
	file://0001-ordonnement-de-la-s-quence-d-appel-registres.patch \
	file://0001-add-imx219-devicetree.patch \
	file://def.config \
"
