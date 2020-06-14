# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils desktop

DESCRIPTION="Free multi-platform database tool"
HOMEPAGE="https://github.com/dbeaver/dbeaver"
SRC_URI="https://github.com/dbeaver/dbeaver/releases/download/${PV}/dbeaver-ce-${PV}-linux.gtk.x86_64.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND=">=dev-java/openjdk-8.252_p09:*"
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}/dbeaver"

src_install() {
	      local dir="/opt/${PN}-${PV}"
	      insinto "${dir}"
	      doins -r *
	      fperms 755 "${dir}"/dbeaver
	      dosym "${dir}"/dbeaver /usr/bin/dbeaver
	      newicon "icon.xpm" "${PN}.png"
	      make_desktop_entry "${PN}" "DBeaver CE ${PV}" "${PN}" "Development;IDE;"
}