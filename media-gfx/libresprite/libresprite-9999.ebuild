# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake desktop git-r3

DESCRIPTION="Free multi-platform database tool"
HOMEPAGE="https://libresprite.github.io/"
EGIT_REPO_URI="https://github.com/LibreSprite/LibreSprite"
EGIT_SUBMODULES=( '*' )
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="dev-util/cmake
	dev-util/ninja
	x11-libs/libX11
	x11-libs/libXcursor"
BDEPEND=""

src_install() {
cmake_src_install
doicon -s 256 "${S}"/desktop/icons/hicolor/256x256/apps/libresprite.png
make_desktop_entry "${PN}" "LibreSprite" "${PN}" "Graphics;"
}
