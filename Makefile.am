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

SUBDIRS = doc packages src

# find patches -type f | sort | sed 's/$/ \\/' | sed 's/^/             /'

EXTRA_DIST = autogen.sh \
        doc/license-page doc/GPLv3 \
        patches/libetpan-1.6/ipv6.patch \
        patches/libetpan-1.6/sasl_set_path.patch \
        patches/libetpan-1.6/mingw-closesocket-include.patch \
        patches/libetpan-1.6/ipv6-wsock.patch \
        patches/libsoup-2.40.3/01-no-docs-no-tests.patch \
        patches/glib-2.49.2/03-wchar64.patch \
        patches/glib-2.49.2/01-socket.patch \
        patches/glib-2.49.2/02-folder-icons.patch \
        patches/enchant-1.6.0/01-no-tests.patch \
        patches/enchant-1.6.0/99-autogen.sh.patch \
        patches/glib-networking-2.48.2/01-giomoduledir.patch \
        patches/w32pth-2.0.5/99-autogen.sh.patch \
        patches/w32pth-2.0.5/01-def-fix.patch \
        patches/regex-20090805/01-no-large-offsets.patch \
        patches/libetpan-1.7/ipv6.patch \
        patches/libetpan-1.7/notests.patch \
        patches/libetpan-1.7/sasl_set_path.patch \
        patches/libetpan-1.7/mingw-closesocket-include.patch \
				patches/libical-2.0.0/01-gmtime_r.patch \
        patches/libiconv-1.14/01-aliases2_lookup-no-inline.patch \
        patches/crypt-1.1/01-build-dll.patch \
        patches/webkit-1.3.10/01-fixes.patch \
        patches/webkit-1.3.10/02-print-size.patch \
        patches/webkit-1.3.10/03-maketokenizer-flex2.60.patch \
        patches/webkit-1.3.10/04-GType-redefined.patch \
        patches/gnutls-3.5.2/01-no-endservent.patch \
        patches/cyrus-sasl-2.1.26/14-MinGW-w64-add-LIBSASL_API-to-function-definitions.patch \
        patches/cyrus-sasl-2.1.26/10-MinGW-w64-already-has-getopt.patch \
        patches/cyrus-sasl-2.1.26/03-fix-plugins.patch \
        patches/cyrus-sasl-2.1.26/19-paths-relocation.patch \
        patches/cyrus-sasl-2.1.26/12-MinGW-w64-uses-ws2_32-not-socket.patch \
        patches/cyrus-sasl-2.1.26/06-fix-sqlite-search.patch \
        patches/cyrus-sasl-2.1.26/01-no-undefined.patch \
        patches/cyrus-sasl-2.1.26/07-fix-pkgconfig.patch \
        patches/cyrus-sasl-2.1.26/20-makemd5.patch \
        patches/cyrus-sasl-2.1.26/08-cyrus-sasl-2.1.26-size_t.patch \
        patches/cyrus-sasl-2.1.26/15-MinGW-w64-define-LIBSASL_EXPORTS_eq_1-for-sasldb.patch \
        patches/cyrus-sasl-2.1.26/05-remove-warnings.patch \
        patches/cyrus-sasl-2.1.26/16-MinGW-w64-define-WIN32_LEAN_AND_MEAN-avoiding-handle_t-redef.patch \
        patches/cyrus-sasl-2.1.26/09-cyrus-sasl-2.1.26-msys2.patch \
        patches/cyrus-sasl-2.1.26/02-exeext.patch \
        patches/cyrus-sasl-2.1.26/11-MinGW-w64-add-disable-win32-reg-option.patch \
        patches/cyrus-sasl-2.1.26/17-MinGW-w64-define-S_IRUSR-and-S_IWUSR.patch \
        patches/cyrus-sasl-2.1.26/13-plugins-COMPAT_OBJS_REAL.patch \
        patches/cyrus-sasl-2.1.26/18-MinGW-w64-use-windlopen.c-not-dlopen.c.patch \
        patches/cyrus-sasl-2.1.26/99-reautomagic.patch \
        patches/cyrus-sasl-2.1.26/04-manpage-paths.patch \
        patches/gtk+-2.24.31/00-fix-private-defs.patch \
        patches/claws-mail-3.14.1/01-etpan-sasl-plugin-path.patch
