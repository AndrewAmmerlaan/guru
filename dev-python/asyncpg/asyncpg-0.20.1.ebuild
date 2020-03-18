# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} pypy3 )

inherit distutils-r1

DESCRIPTION="A fast PostgreSQL Database Client Library for Python/asyncio."
HOMEPAGE="https://github.com/MagicStack/asyncpg"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="dev-python/cython[${PYTHON_USEDEP}]"

DEPEND="test? ( dev-python/pycodestyle[${PYTHON_USEDEP}]
                dev-python/flake8[${PYTHON_USEDEP}]
                dev-python/uvloop[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest