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
        patches/pixman-0.32.6/01-no-tests.patch \
        patches/claws-mail-3.17.7/01-etpan-sasl-plugin-path.patch \
        patches/enchant-1.6.0/01-no-tests.patch \
        patches/enchant-1.6.0/99-autogen.sh.patch \
        patches/libsoup-2.60.3/01-no-docs-no-tests.patch \
        patches/glib-2.56.4/01-socket.patch \
        patches/glib-2.56.4/02-broken-ip-mreq-source-struct.patch \
        patches/glib-2.56.4/03-no-tests.patch \
        patches/webkitgtk-2.4.11/05-print-size.patch \
        patches/webkitgtk-2.4.11/01-std-threads.patch \
        patches/webkitgtk-2.4.11/04-LLIntAssembly-hack.patch \
        patches/webkitgtk-2.4.11/03-missing-RenderBox-include.patch \
        patches/webkitgtk-2.4.11/02-no-class-size-check.patch \
        patches/fontconfig-2.13.92/01-no-fluff.patch \
        patches/zlib-1.2.11/01-no-strip.patch \
        patches/icu4c-58_3-src/02-float128-clang.patch \
        patches/icu4c-58_3-src/01-libnames.patch \
        patches/icu4c-58_3-src/99-build.patch \
        patches/icu4c-58_3-src/03-no-xlocale.patch \
        patches/w32pth-2.0.5/99-autogen.sh.patch \
        patches/w32pth-2.0.5/01-def-fix.patch \
        patches/gdk-pixbuf-2.36.12/01-fix-build.patch \
        patches/gdk-pixbuf-2.36.12/02-no-tests.patch \
        patches/libical-2.0.0/01-gmtime_r.patch \
        patches/glib-networking-2.54.1/01-giomoduledir.patch \
        patches/regex-20090805/01-no-large-offsets.patch \
        patches/libetpan-1.7/send_wouldblock.patch \
        patches/libetpan-1.7/ipv6.patch \
        patches/libetpan-1.7/notests.patch \
        patches/libetpan-1.7/sasl_set_path.patch \
        patches/libetpan-1.7/mingw-closesocket-include.patch \
        patches/libetpan-1.7/no-imap-flags-crashfix.patch \
        patches/libiconv-1.14/01-aliases2_lookup-no-inline.patch \
        patches/crypt-1.1/01-build-dll.patch \
        patches/harfbuzz-2.6.7/01-no-tests-utils-docs.patch \
        patches/gtk+-2.24.32/00-fix-private-defs.patch \
        patches/gtk+-2.24.32/01-no-tests-demos.patch \
        patches/cyrus-sasl-2.1.27/01-md5-typedef.patch \
        patches/cyrus-sasl-2.1.27/02-tchar.patch \
        patches/cyrus-sasl-2.1.27/03-exports.patch \
        patches/cyrus-sasl-2.1.27/04-paths-relocation.patch \
        patches/cyrus-sasl-2.1.27/99-reautomagic.patch \
        patches/cairo-1.10.2/03-fix-ffs.patch \
        patches/cairo-1.10.2/99-libtoolize.patch \
        patches/cairo-1.10.2/02-reset-clip-region.patch \
        patches/cairo-1.10.2/01-fix-A1-surfaces.patch \
        patches/gumbo-parser-0.10.1/99-autotools.patch \
        patches/ytnef-1.9.3/01-malloc.patch \
        patches/ytnef-1.9.3/02-no-undefined.patch \
        patches/ytnef-1.9.3/99-autotools.patch \
        patches/atk-2.36.0/01-cross-build.patch \
        patches/atk-2.36.0/02-meson-build.patch
