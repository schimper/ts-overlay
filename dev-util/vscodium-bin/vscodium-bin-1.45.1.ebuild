# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils desktop

DESCRIPTION="Free/Libre Open Source Software Binaries of VSCode"
HOMEPAGE="https://github.com/VSCodium/vscodium"
SRC_URI="https://github.com/VSCodium/vscodium/releases/download/1.45.1/VSCodium-linux-x64-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	      local dir="/opt/${PN}-${PV}"
	      insinto "${dir}"
	      doins -r *
	      fperms 755 "${dir}"/codium
	      dosym "${dir}"/codium /usr/bin/codium
	      newicon "resources/app/resources/linux/code.png" "${PN}.png"
	      make_desktop_entry "codium" "VSCodium" "${PN}" "Development"
}
