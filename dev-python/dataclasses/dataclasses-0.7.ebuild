# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

DESCRIPTION="A backport of the dataclasses module for Python 3.6"
HOMEPAGE="https://github.com/ericvsmith/dataclasses"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86 "
SLOT="0"

distutils_enable_tests pytest
