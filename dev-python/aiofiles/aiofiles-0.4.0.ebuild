# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="File support for asyncio"
HOMEPAGE="https://github.com/Tinche/aiofiles"
SRC_URI="https://github.com/Tinche/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="test? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
