# Makefile.am - Installer for GnuPG 4 Windows Makefile.
# Copyright (C) 2005, 2008, 2012 g10 Code GmbH
#
# This file is part of GPG4Win.
#
# GPG4Win is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# GPG4Win is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/>.

ACLOCAL_AMFLAGS = -I m4
AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
DISTCHECK_CONFIGURE_FLAGS = --host=i686-w64-mingw32

SUBDIRS = doc packages po src

# find patches -type f | sort | sed 's/$/ \\/' | sed 's/^/             /'

EXTRA_DIST = autogen.sh \
        doc/license-page doc/GPLv3 \
				patches/libetpan-1.6/mingw-closesocket-include.patch \
				patches/libetpan-1.6/ipv6.patch \
				patches/libetpan-1.6/ipv6-wsock.patch \
				patches/libtasn1-2.14/gnulib-mingw-w64-fix.patch \
				patches/w32pth-2.0.5/01-def-fix.patch \
				patches/dirmngr-1.1.1/dirmngr-pth.patch \
				patches/webkit-1.3.10/01-fixes.patch \
				patches/webkit-1.3.10/02-print-size.patch \
				patches/glib-2.45.2/01-socket.patch \
				patches/glib-2.45.2/02-folder-icons.patch \
				patches/gnupg2-2.0.28/0001-Enable-wildcard-expansion-with-mingw-w64.patch \
				patches/gnupg2-2.0.28/0002-Let-wchar_to_native-convert-to-console-codepage.patch \
				patches/gnupg2-2.0.28/0005-Fix-gpgtar-8-bit-encoding-handling-on-Win32.patch \
				patches/glib-networking-2.45.1/01-giomoduledir.patch \
				patches/cairo-1.10.2/01-fix-A1-surfaces.patch \
				patches/cairo-1.10.2/02-reset-clip-region.patch \
				patches/cairo-1.10.2/03-fix-ffs.patch \
				patches/claws-mail-3.12.0/managesieve-defs.patch \
				patches/claws-mail-3.12.0/01-bug3475-dragndrop.patch \
				patches/claws-mail-3.12.0/02-bug2115-dragndrop-percent.patch \
				patches/claws-mail-3.12.0/03-bug3454-glib-funcs.patch \
				patches/claws-mail-3.12.0/v6.patch \
				patches/claws-mail-3.12.0/v6-configure.patch \
				patches/claws-mail-3.12.0/ipv6-imap-cachedir.patch

