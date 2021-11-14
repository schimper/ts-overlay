# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-3 )
inherit desktop flag-o-matic
DESCRIPTION="A drawing editor for creating figures in PDF format."
HOMEPAGE="https://ipe.otfried.org/"
SRC_URI="https://github.com/otfried/ipe/releases/download/v${PV}/${PN}-${PV}-src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}
        media-fonts/urw-fonts
	media-gfx/libspiro
	media-libs/freetype:2
	media-libs/libjpeg-turbo
	media-libs/libpng
	sci-libs/gsl:=
	sys-libs/zlib
	x11-libs/cairo
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-lang/lua:5.3"
RDEPEND="${DEPEND}
|| ( app-text/texlive-core net-misc/curl )"
BDEPEND="virtual/pkgconfig"

S="${WORKDIR}/${P}/src"

src_compile() {
              emake \
                    IPEPREFIX="${EPREFIX}/usr/local" \
                    IPEDOCDIR="${EPREFIX}/usr/share/doc/${PF}/html"
}

src_install() {
	emake install \
		IPEPREFIX="${EPREFIX}/usr/local" \
		IPEDOCDIR="${EPREFIX}/usr/share/doc/${PF}/html" \
		INSTALL_ROOT="${ED}"
	dodoc ../{news,readme}.txt
	make_desktop_entry ipe Ipe ipe
}