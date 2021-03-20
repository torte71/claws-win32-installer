# Makefile.am - Windows Installer for Claws Mail
# Copyright (C) 2005, 2008, 2012 g10 Code GmbH
# Copyright (C) 2015, 2016 the Claws Mail team
#
# This file is part of Claws-Mail.
#
# Claws Mail is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# Claws Mail is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/>.

ACLOCAL_AMFLAGS = -I m4
AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
DISTCHECK_CONFIGURE_FLAGS = --host=i686-w64-mingw32

DISTCLEANFILES = stamp-autogen-1stpass

SUBDIRS = doc packages po src

# find patches -type f | sort | sed 's/$/ \\/' | sed 's/^/             /'

EXTRA_DIST = autogen.sh \
             configure.ac.template \
             doc/license-page doc/GPLv3 \
             patches/atk-2.36.0/01-meson-build.patch \
             patches/bzip2-1.0.8/01-g10-bzlib_h.patch \
             patches/bzip2-1.0.8/02-g10-Makefile.patch \
             patches/claws-mail/01-etpan-sasl-plugin-path.patch \
             patches/claws-mail/05-define-WIN32-for-litehtml.patch \
             patches/cyrus-sasl-2.1.27/01-md5-typedef.patch \
             patches/cyrus-sasl-2.1.27/02-tchar.patch \
             patches/cyrus-sasl-2.1.27/03-exports.patch \
             patches/cyrus-sasl-2.1.27/04-paths-relocation.patch \
             patches/cyrus-sasl-2.1.27/99-reautomagic.patch \
             patches/enchant-2.2.15/01-fix-relocation.patch \
             patches/fontconfig-2.13.93/01-no-fluff.patch \
             patches/gumbo-parser-0.10.1/99-autotools.patch \
             patches/harfbuzz-2.6.7/01-no-tests-utils-docs.patch \
             patches/hunspell-1.7.0/99-autoreconf.patch \
             patches/icu4c-58_3-src/01-libnames.patch \
             patches/icu4c-58_3-src/02-float128-clang.patch \
             patches/icu4c-58_3-src/03-no-xlocale.patch \
             patches/icu4c-58_3-src/99-build.patch \
             patches/libetpan-1.9.4/01-no-tests.patch \
             patches/libetpan-1.9.4/02-wsaewouldblock.patch \
             patches/libetpan-1.9.4/03-sasl-set-path.patch \
             patches/libetpan-1.9.4/04-closesocket.patch \
             patches/libetpan-1.9.4/05-no-unnecessary-linkage.patch \
             patches/libetpan-1.9.4/99-autogen.patch \
             patches/pango-1.47.0/01-no-tests.patch \
             patches/pixman-0.40.0/01-no-tests.patch \
             patches/regex-20090805/01-no-large-offsets.patch \
             patches/w32pth-2.0.5/01-def-fix.patch \
             patches/w32pth-2.0.5/99-autogen.sh.patch \
             patches/ytnef-1.9.3/01-malloc.patch \
             patches/ytnef-1.9.3/02-no-undefined.patch \
             patches/ytnef-1.9.3/99-autotools.patch \
             patches/zlib-1.2.11/01-no-strip.patch
