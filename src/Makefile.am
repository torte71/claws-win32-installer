# Makefile.am - Windows Installer for Claws Mail
# Copyright (C) 2005, 2006, 2007, 2008, 2009 g10 Code GmbH
# Copyright (C) 2015, 2016 the Claws Mail team
#
# This file is part of Claws Mail.
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


EXTRA_DIST = claws-mail.nsi \
	config.site config.nsi.in \
	functions.nsi strings.nsi \
	gnupg-uninst.nsi \
	sections-installer.nsi sections-uninstaller.nsi \
	installer-options.ini installer-setdefaultclient.ini \
	mingw.condition_variable.h mingw.mutex.h mingw.thread.h \
	Memento.nsh Toolchain-mingw32.cmake.in meson-cross.txt.in

SUBDIRS = dictionaries

# Need to clean the dll because we bypassed automake.
#CLEANFILES = g4wihelp.dll versioninfo.txt \
#             NEWS.tmp COMPONENTS-list.tmp \
#             license.blurb cdversioninfo.tmp \
#             gpgwrap.exe gpgwrap-2.exe

# Supported source packages.
cm_spkgs = glib libffi gdk-pixbuf gtk+ expat \
		libgpg-error gpgme libpng enchant atk fontconfig freetype \
		libtasn1 gnutls curl libxml2 libxslt sqlite-autoconf \
		jpeg glib-networking libsoup libwebp webkitgtk gmp nettle \
		harfbuzz fribidi pango pixman cairo libetpan claws-mail \
		libassuan cyrus-sasl icu4c ytnef libpsl hunspell \
		w32pth regex libiconv gettext libical gumbo-parser

# Extra options to configure for individual packages.
# We can use $(idir) here for the installation prefix.

cm_pkg_harfbuzz_make_args = -j$(NUMPROC)
cm_pkg_freetype_make_args = -j$(NUMPROC)
cm_pkg_fontconfig_make_args = -j$(NUMPROC)
cm_pkg_gtk__make_args = -j$(NUMPROC)
cm_pkg_libgpg_error_make_args = -j$(NUMPROC)
cm_pkg_gpgme_make_args = -j$(NUMPROC)
cm_pkg_expat_make_args = -j$(NUMPROC)
cm_pkg_libpng_make_args = -j$(NUMPROC)
cm_pkg_enchant_make_args = -j$(NUMPROC)
cm_pkg_hunspell_make_args = -j$(NUMPROC)
cm_pkg_libtasn1_make_args = -j$(NUMPROC)
cm_pkg_curl_make_args = -j$(NUMPROC)
cm_pkg_libxslt_make_args = -j$(NUMPROC)
cm_pkg_libxml2_make_args = -j$(NUMPROC)
cm_pkg_libetpan_make_args = -j$(NUMPROC)
cm_pkg_claws_mail_make_args = -j$(NUMPROC)
cm_pkg_libassuan_make_args = -j$(NUMPROC)
cm_pkg_w32pth_make_args = -j$(NUMPROC)
cm_pkg_jpeg_make_args = -j$(NUMPROC)
cm_pkg_sqlite_autoconf_make_args = -j$(NUMPROC)
cm_pkg_libwebp_make_args = -j$(NUMPROC)
cm_pkg_icu4c_make_args = -j$(NUMPROC)
cm_pkg_webkitgtk_make_args = -j$(NUMPROC)
cm_pkg_gmp_make_args = -j$(NUMPROC)
cm_pkg_nettle_make_args = -j$(NUMPROC)
cm_pkg_cairo_make_args = -j$(NUMPROC)
cm_pkg_cyrus_sasl_make_args = -j$(NUMPROC)
cm_pkg_libical_make_args = -j$(NUMPROC)
cm_pkg_ytnef_make_args = -j$(NUMPROC)
cm_pkg_gumbo_parser_make_args = -j$(NUMPROC)
cm_pkg_libffi_make_args = -j$(NUMPROC)
cm_pkg_gnutls_make_args = -j$(NUMPROC)
cm_pkg_libiconv_make_args = -j$(NUMPROC)
cm_pkg_regex_make_args = -j$(NUMPROC)
cm_pkg_gettext_make_args = -j$(NUMPROC)

cm_pkg_libical_cmake = yes

cm_pkg_atk_meson = yes
cm_pkg_glib_meson = yes
cm_pkg_pixman_meson = yes
cm_pkg_glib_networking_meson = yes
cm_pkg_gdk_pixbuf_meson = yes
cm_pkg_fribidi_meson = yes
cm_pkg_pango_meson = yes
cm_pkg_libsoup_meson = yes
cm_pkg_libpsl_meson = yes

cm_pkg_libiconv_configure = \
	--enable-shared=yes --enable-static=no

cm_pkg_gettext_configure = \
	--with-lib-prefix=$(idir) \
	CPPFLAGS=-I$(idir)/include LDFLAGS=\"-L$(idir)/lib\"

# We only need gettext-runtime and there is sadly no top level
# configure option for this
cm_pkg_gettext_make_dir = gettext-runtime
cm_pkg_gettext_make_dir_inst = gettext-runtime

cm_pkg_glib_configure = -Dinternal_pcre=true
cm_pkg_glib_meson_cppflags = -I$(idir)/include
cm_pkg_glib_meson_ldflags = -L$(idir)/lib

cm_pkg_gdk_pixbuf_configure = \
	-Dx11=false \
	-Drelocatable=true \
	-Dbuiltin_loaders=all \
	-Dnative_windows_loaders=true \
	-Dgir=false \
	-Dinstalled_tests=false \
	-Dman=false
cm_pkg_gdk_pixbuf_meson_cppflags = -I$(idir)/include
cm_pkg_gdk_pixbuf_meson_ldflags = -L$(idir)/lib

cm_pkg_gtk__configure = \
	--with-gdktarget=win32 \
	--with-included-immodules \
	--disable-cups \
	--disable-gtk-doc \
	--disable-static \
	--disable-glibtest \
	CPPFLAGS=-I$(idir)/include LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_harfbuzz_configure = \
	--disable-gtk-doc-html \
	--with-glib \
	--with-gobject \
	--with-fontconfig \
	--with-freetype \
	--with-cairo \
	--with-icu=yes \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\" LIBS=\"-lpthread\"

cm_pkg_freetype_configure = \
	--with-png --without-bzip2 --with-zlib \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_fontconfig_configure = \
	--enable-iconv --disable-docs \
	--enable-libxml2 \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_fribidi_configure = -Ddocs=false -Dtests=false

cm_pkg_pango_configure = \
	-Dcairo=enabled \
	-Dfontconfig=enabled \
	-Dfreetype=enabled \
	-Dgtk_doc=false \
	-Dintrospection=false
cm_pkg_pango_meson_ldflags = -L$(idir)/lib

cm_pkg_atk_configure = -Dintrospection=false
cm_pkg_atk_meson_cppflags = -I$(idir)/include
cm_pkg_atk_meson_ldflags = -L$(idir)/lib

cm_pkg_pixman_meson_cppflags = -I$(idir)/include
cm_pkg_pixman_meson_ldflags = -L$(idir)/lib

cm_pkg_cairo_configure = \
	--enable-win32 --enable-win32-font \
	--enable-ft --enable-fc \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_libgpg_error_configure = \
	--disable-doc \
	--enable-static \
	CPPFLAGS=-I$(idir)/include LDFLAGS=\"-L$(idir)/lib\"

# We convert the PO files to UTF-8.  FIXME: This should be done in
# libgpg-error proper.
#define cm_pkg_libgpg_error_post_install
#(for i in `$(tsdir)/src/potomo --get-linguas $$$${pkgsdir}/po` ; do \
#   rm $$$${pkgidir}/share/locale/$$$${i}/LC_MESSAGES/libgpg-error.mo \
#       2>/dev/null|| true; \
#   $(tsdir)/src/potomo $$$${pkgsdir}/po/$$$${i}.po \
#             $$$${pkgidir}/share/locale/$$$${i}/LC_MESSAGES/libgpg-error.mo; \
# done)
#endef

cm_pkg_libassuan_configure =  --enable-static

cm_pkg_libpng_configure = \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_enchant_configure = \
	--enable-relocatable \
	--with-hunspell \
	--without-nuspell \
	--without-aspell \
	--without-hspell \
	--without-voikko \
	--without-applespell \
	--without-zemberek \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_hunspell_configure = \
	--disable-rpath

# The LDFLAGS is needed for -lintl for glib.
cm_pkg_gpgme_configure = \
	--enable-static \
	--enable-w32-glib \
	LDFLAGS=\"-L$(idir)/lib\"

# We can't use pkcs11 due to too much additional dependencies.
cm_pkg_gnutls_configure = \
	--disable-cxx \
	--without-p11-kit \
	--without-included-libtasn1 \
	--with-included-unistring \
	--disable-gtk-doc-html \
	--disable-tests \
	--disable-doc \
	--disable-tools \
	CPPFLAGS=\"-I$(idir)/include\" LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_gmp_configure = \
	--disable-static \
	--enable-shared \
	--disable-cxx

cm_pkg_nettle_configure = \
	--enable-public-key \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_curl_configure = \
	--with-gnutls --with-winssl --with-winidn\
	--without-ca-bundle --without-ca-path \
	CPPFLAGS=\"-I$(idir)/include\" LIBS=\"-L$(idir)/lib\"

cm_pkg_libxml2_configure = \
	--enable-shared --without-python --with-iconv=$(idir)

cm_pkg_libxslt_configure = \
	--enable-shared --without-python

cm_pkg_expat_configure = \
	--without-docbook

cm_pkg_cyrus_sasl_configure = \
	--without-openssl --disable-ldapdb --without-saslauthd \
	--without-pwcheck --without-des --without-authdaemond \
	--enable-cram --enable-digest \
	--enable-plain --enable-anon --enable-login \
	--disable-static --enable-shared --disable-sample \
	CPPFLAGS=\"-I$(idir)/include\" LIBS=\"-L$(idir)/lib\"

cm_pkg_libetpan_configure = --with-gnutls --enable-threads \
	--enable-ipv6 \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\" LIBS=\"-lpthread\"

# -D_POSIX_C_SOURCE is there so that time.h from mingw64-4.x
# actually gives us gmtime_r() and localtime_r() prototype declarations
cm_pkg_claws_mail_configure = \
	--enable-silent-rules \
	--with-lib-prefix=$(idir) \
	--enable-pthread --enable-gnutls \
	--enable-libetpan --disable-dbus --disable-valgrind --enable-ipv6 \
	--disable-jpilot --disable-startup-notification \
	--disable-spamassassin-plugin --disable-bogofilter-plugin \
	--enable-fancy-plugin \
	--disable-acpi_notifier-plugin --disable-clamd-plugin \
	--disable-perl-plugin --disable-python-plugin --disable-demo-plugin \
	--disable-newmail-plugin --disable-mailmbox-plugin \
	--disable-dillo-plugin --enable-tnef_parse-plugin \
	--with-password-encryption=gnutls \
	CPPFLAGS=\"-I$(idir)/include -D_POSIX_C_SOURCE -DLITEHTML_UTF8\" \
	LDFLAGS=\"-L$(idir)/lib\" LIBS=\"-lexpat\"

cm_pkg_sqlite_autoconf_configure = \
	--disable-static-shell

cm_pkg_glib_networking_configure = -Dgnutls=enabled -Dopenssl=disabled -Dlibproxy=disabled -Dgnome_proxy=disabled
cm_pkg_glib_networking_meson_cppflags = -I$(idir)/include
cm_pkg_glib_networking_meson_ldflags = -L$(idir)/lib

cm_pkg_libpsl_meson_cppflags = -I$(idir)/include

cm_pkg_libsoup_configure = \
	-Dgnome=false \
	-Dgssapi=disabled \
	-Dtests=false \
	-Dsysprof=disabled \
	-Dtls_check=false \
	-Dintrospection=disabled
cm_pkg_libsoup_meson_cppflags = -I$(idir)/include
cm_pkg_libsoup_meson_ldflags = -L$(idir)/lib

cm_pkg_libwebp_configure = \
	LDFLAGS=\"-L$(idir)/lib\" \
	CPPFLAGS=\"-I$(idir)/include\"

cm_pkg_webkitgtk_configure = \
	--disable-webkit2 \
	--enable-webkit1 \
	--with-gtk=2.0 \
	--disable-x11-target \
	--disable-wayland-target \
	--enable-win32-target \
	--disable-spellcheck \
	--disable-credential-storage \
	--disable-gtk-doc-html \
	--disable-svg-fonts \
	--disable-jit \
	--disable-video \
	--disable-web-audio \
	--disable-battery-status \
	--disable-geolocation \
	--disable-coverage \
	--disable-glx \
	--disable-egl \
	--disable-gles2 \
	--disable-gamepad \
	--disable-webgl \
	--disable-glibtest \
	--disable-debug \
	--disable-accelerated-compositing \
	--enable-silent-rules \
	CPPFLAGS=\"-I$(idir)/include -Wno-expansion-to-defined\" \
	CC=$(CC) LIBS=\"-L$(idir)/lib\"
# -ggdb causes an ICE with gcc-8.3 / webkit-2.4.11
cm_pkg_webkitgtk_cflags = \
	-O2 -pipe -mms-bitfields
cm_pkg_webkitgtk_cxxflags = \
	-O2 -pipe -mms-bitfields -std=gnu++98 -fexceptions

cm_pkg_libical_configure = \
	-DICAL_BUILD_DOCS=OFF \
	-DICAL_GLIB=OFF \
	-DLIBICAL_BUILD_TESTING=OFF

cm_pkg_gumbo_parser_configure = \
	LDFLAGS=\"-L$(idir)/lib\" \
	CPPFLAGS=\"-I$(idir)/include\"

# This is not anymore needed sinces 3.8.0 already builds a PDF version.
# define cm_pkg_claws_mail_post_install
# (for i in de en ; do \
#     (cd $$$${pkgidir}/share/doc/claws-mail/manual/$$$${i}; \
#     ps2pdf claws-mail-manual.ps); \
#  done)
# endef


# Supported make-only source packages.
cm_mpkgs = bzip2 zlib

# Extra options for the make invocations for individual packages.
# make_flags is used for building, make_args_inst is used for installing.
cm_pkg_bzip2_make_args = -j$(NUMPROC) \
	CC=$(CC) AR=$(AR) RANLIB=$(RANLIB)

cm_pkg_bzip2_make_args_inst = \
	PREFIX=$$$${pkgidir} CC=$(CC) AR=$(AR) RANLIB=$(RANLIB)

cm_pkg_zlib_make_args = -j$(NUMPROC) \
	-fwin32/Makefile.gcc PREFIX=$(host)-

cm_pkg_zlib_make_args_inst = -fwin32/Makefile.gcc install \
	prefix=$$$${pkgidir} \
	BINARY_PATH=$$$${pkgidir}/bin INCLUDE_PATH=$$$${pkgidir}/include \
	LIBRARY_PATH=$$$${pkgidir}/lib SHARED_MODE=1

# Supported binary packages.
cm_bpkgs = bsfilter

# Now do the bunch of the work.  This is a bunch of dirty magic to
# integrate our special makefile into automake, while not actually
# including it (make should include it).  This is in turn necessary
# because automake can't deal with the elegant magic in the actual
# Makefile.

define INCLUDE_BY_MAKE
include $(1)
endef

$(eval $(call INCLUDE_BY_MAKE,claws-mail.mk))

# Prepare the versioninfo file.  The pipeline extracts the last
# occurrence of a package with the same name, sorts the entries and
# writes the file with DOS line endings.  This helps to avoid
# duplicate entries in case one package has been rebuild (which is
# common when developing a new version).
versioninfo.txt:
	$(SHA256SUM) $(pkg_files) </dev/null > versioninfo.tmp
	set -e; \
	( while read a b; do echo "$$a $$(basename $$b)"; \
            done < versioninfo.tmp \
          | sort -k2 -sf | tac | uniq -f1 ; \
          echo '=========== SHA-256 checksum ============= == package ==' \
         ) | tac | awk '{printf "%s\r\n", $$0}' > versioninfo.txt
	-rm versioninfo.tmp

NEWS.tmp : $(top_srcdir)/NEWS
	 awk '/^#/ {next} /^\(de\)/ {skip=1;next} /^[^[:space:]]/ {skip=0} \
             !skip { sub(/^\(en\)/,"   *"); print }' \
             <$(top_srcdir)/NEWS >NEWS.tmp

COMPONENTS-list.tmp : $(top_srcdir)/NEWS
	awk '/^~~~~~~~~~~~/ { ok++; next} ok==1 {print "    "$$0}' \
            < $(top_srcdir)/NEWS > COMPONENTS-list.tmp


# For some nut-crazy reason someone thought it would be a great idea
# if makensis changed to the directory of the source file at startup.
# So we have to pull a couple of strings to correct this.
claws-mail-$(VERSION).exe: claws-mail.nsi stamps/stamp-final \
	                license.blurb versioninfo.txt
	$(MAKENSIS) -V3 -DBUILD_DIR=`pwd` -DTOP_SRCDIR=$(top_srcdir) \
           -DSRCDIR=$(srcdir) $(EXTRA_MAKENSIS_FLAGS) $(srcdir)/claws-mail.nsi

claws-mail-$(VERSION).wix: claws-mail.nsi stamps/stamp-final \
			versioninfo.txt
	perl make-msi.pl --guids $(srcdir)/make-msi.guids \
		--manifest claws-mail-$(VERSION).files \
		-DBUILD_DIR=. -DTOP_SRCDIR=$(top_srcdir) \
		-DSRCDIR=$(srcdir) $(srcdir)/claws-mail.nsi > $@

.PHONY: msi
msi: claws-mail-$(VERSION).wix


stamps/stamp-dist-self: versioninfo.txt
	(set -e; cd ..; make dist-bzip2)
	touch stamps/stamp-dist-self

#claws-mail-src-$(VERSION).exe: claws-mail-src.nsi \
#	stamps/stamp-final \
#	stamps/stamp-dist-self \
#	license.blurb
#	$(MAKENSIS) -V3 -DBUILD_DIR=`pwd` -DTOP_SRCDIR=$(top_srcdir) \
#	  -DSRCDIR=$(srcdir) $(EXTRA_MAKENSIS_FLAGS) $(srcdir)/claws-mail-src.nsi

license.blurb: $(top_srcdir)/doc/license-page $(top_srcdir)/doc/GPLv3
	cat $(top_srcdir)/doc/license-page $(top_srcdir)/doc/GPLv3 >$@


if BUILD_SOURCE_INSTALLER
all_src = claws-mail-src-$(VERSION).exe
else
all_src =
endif

all_full = claws-mail-$(VERSION).exe

#all-local: $(all_full) $(all_src)
all-local: $(all_full)

clean-local:
	rm -f claws-mail-$(VERSION).exe claws-mail-src-$(VERSION).exe

distclean-local:
	rm -rf stamps playground *.dll-x
