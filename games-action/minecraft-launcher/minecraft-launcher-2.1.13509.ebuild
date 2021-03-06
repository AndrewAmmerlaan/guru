# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg

DESCRIPTION="An open-world game whose gameplay revolves around breaking and placing blocks"
HOMEPAGE="https://mojang.com/"
SRC_URI="https://launcher.mojang.com/download/linux/x86_64/minecraft-launcher_${PV}.tar.gz -> ${P}.tar.gz
	https://launcher.mojang.com/download/minecraft-launcher.svg"

KEYWORDS="~amd64 ~x86"
LICENSE="Mojang"
SLOT="2"

RESTRICT="bindist mirror"

RDEPEND="gnome-base/gconf
	sys-apps/dbus
	x11-apps/xrandr
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrender
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-libs/xcb-util
	>=x11-libs/gtk+-2.24.32-r1
	media-libs/openal
	virtual/opengl
	virtual/jre:1.8"

S="${WORKDIR}/${PN}"

src_install() {
	dodir /opt/${PN}
	insinto /opt/${PN}/
	doins -r .

	fperms +x /opt/${PN}/${PN}

	dosym ../${PN}/${PN} /opt/bin/${PN}

	doicon -s scalable "${DISTDIR}/${PN}.svg"
	make_desktop_entry ${PN} "Minecraft" ${PN} Game
}
