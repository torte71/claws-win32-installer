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
				patches/claws-mail-3.11.1/01-mingw.patch \
				patches/claws-mail-3.11.1/02-ldap-opt.patch \
				patches/claws-mail-3.11.1/03-rssyl.patch \
				patches/claws-mail-3.11.1/04-no-link.patch \
				patches/claws-mail-3.11.1/05-ldflags.patch \
				patches/claws-mail-3.11.1/06-pthread.patch \
				patches/claws-mail-3.11.1/07-g_stat.patch \
				patches/claws-mail-3.11.1/08-libravatar-prefs_common.patch \
				patches/claws-mail-3.11.1/09-fancy-defs.patch \
        patches/dirmngr-1.1.1/dirmngr-pth.patch \
        patches/glib-2.41.0/01-socket.patch \
        patches/glib-2.41.0/03-remove-rand_s.patch \
        patches/gnupg2-2.0.27/0001-Enable-wildcard-expansion-with-mingw-w64.patch \
        patches/gnupg2-2.0.27/0002-Let-wchar_to_native-convert-to-console-codepage.patch \
        patches/gnupg2-2.0.27/0003-gpgtar-Fix-extracting-files-with-size-512.patch \
        patches/gnupg2-2.0.27/0005-Fix-gpgtar-8-bit-encoding-handling-on-Win32.patch \
        patches/gnutls-2.12.23/01-openssl-wincrypt.patch \
        patches/gnutls-2.12.23/02-cve-2013-2116.patch \
        patches/gnutls-2.12.23/03-cve-2014-1959.patch \
        patches/gnutls-2.12.23/04-cve-2014-0092.patch \
        patches/gnutls-2.12.23/05-cve-2014-3466.patch \
        patches/gnutls-2.12.23/fix-gcrypt-private-api-usage.patch \
        patches/gnutls-2.12.23/gnulib-mingw-w64-fix.patch \
        patches/gnutls-2.12.23/omit-doc.patch \
				patches/libetpan-1.6/mingw-closesocket-include.patch \
        patches/libtasn1-2.14/gnulib-mingw-w64-fix.patch \
				patches/w32pth-2.0.5/01-def-fix.patch \
				patches/webkit-1.3.10/01-fixes.patch
