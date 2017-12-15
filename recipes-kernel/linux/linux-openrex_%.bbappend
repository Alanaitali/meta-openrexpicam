FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://imx6s-openrex/defconfig \
            file://imx6s-openrex/0001-add-source-and-dts.patch \
            "
