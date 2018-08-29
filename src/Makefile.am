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


EXTRA_DIST = pkg-config claws-mail.nsi \
				config.site config.nsi.in \
				functions.nsi strings.nsi \
				gnupg-uninst.nsi \
				sections-installer.nsi sections-uninstaller.nsi \
				installer-options.ini installer-setdefaultclient.ini \
        libiconv.def libintl.def \
				mingw.condition_variable.h mingw.mutex.h mingw.thread.h \
        Memento.nsh Toolchain-mingw32.cmake.in

SUBDIRS = dictionaries

# Need to clean the dll because we bypassed automake.
#CLEANFILES = g4wihelp.dll versioninfo.txt \
#             NEWS.tmp COMPONENTS-list.tmp \
#	     license.blurb cdversioninfo.tmp \
#	     gpgwrap.exe gpgwrap-2.exe

# Supported source packages.
cm_spkgs = glib libffi gdk-pixbuf gtk+ expat \
		libgpg-error gpgme libpng enchant atk fontconfig freetype \
		libtasn1 opencdk gnutls curl libxml2 libxslt sqlite-autoconf \
		jpeg glib-networking libsoup libwebp webkitgtk gmp nettle \
		harfbuzz pango pixman cairo libetpan claws-mail \
		libgcrypt libassuan cyrus-sasl icu4c ytnef \
		w32pth regex libiconv gettext libical

# Extra options to configure for individual packages.
# We can use $(idir) here for the installation prefix.

cm_pkg_harfbuzz_make_args = -j$(NUMPROC)
cm_pkg_freetype_make_args = -j$(NUMPROC)
cm_pkg_fontconfig_make_args = -j$(NUMPROC)
cm_pkg_pango_make_args = -j$(NUMPROC)
cm_pkg_atk_make_args = -j$(NUMPROC)
cm_pkg_gdk_pixbuf_make_args = -j$(NUMPROC)
cm_pkg_glib_make_args = -j$(NUMPROC)
cm_pkg_gtk__make_args = -j$(NUMPROC)
cm_pkg_libgpg_error_make_args = -j$(NUMPROC)
cm_pkg_gpgme_make_args = -j$(NUMPROC)
cm_pkg_expat_make_args = -j$(NUMPROC)
cm_pkg_libpng_make_args = -j$(NUMPROC)
cm_pkg_enchant_make_args = -j$(NUMPROC)
cm_pkg_libtasn1_make_args = -j$(NUMPROC)
cm_pkg_opencdk_make_args = -j$(NUMPROC)
cm_pkg_curl_make_args = -j$(NUMPROC)
cm_pkg_libxslt_make_args = -j$(NUMPROC)
cm_pkg_libxml2_make_args = -j$(NUMPROC)
cm_pkg_libetpan_make_args = -j$(NUMPROC)
cm_pkg_claws_mail_make_args = -j$(NUMPROC)
cm_pkg_libassuan_make_args = -j$(NUMPROC)
cm_pkg_libgcrypt_make_args = -j$(NUMPROC)
cm_pkg_w32pth_make_args = -j$(NUMPROC)
cm_pkg_jpeg_make_args = -j$(NUMPROC)
cm_pkg_glib_networking_make_args = -j$(NUMPROC)
cm_pkg_sqlite_autoconf_make_args = -j$(NUMPROC)
cm_pkg_libsoup_make_args = -j$(NUMPROC)
cm_pkg_libwebp_make_args = -j$(NUMPROC)
cm_pkg_icu4c_make_args = -j$(NUMPROC)
cm_pkg_webkitgtk_make_args = -j$(NUMPROC)
cm_pkg_gmp_make_args = -j$(NUMPROC)
cm_pkg_nettle_make_args = -j$(NUMPROC)
cm_pkg_pixman_make_args = -j$(NUMPROC)
cm_pkg_cairo_make_args = -j$(NUMPROC)
cm_pkg_cyrus_sasl_make_args = -j$(NUMPROC)
cm_pkg_libical_make_args = -j$(NUMPROC)
cm_pkg_ytnef_make_args = -j$(NUMPROC)

cm_pkg_libical_cmake = yes

cm_pkg_libiconv_configure = \
	--enable-shared=yes --enable-static=no

cm_pkg_gettext_configure = \
  --with-lib-prefix=$(idir) --with-libiconv-prefix=$(idir) \
  CPPFLAGS=-I$(idir)/include CFLAGS=-O2 LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_gettext_ex_configure = \
  --with-lib-prefix=$(ex_idir) --with-libiconv-prefix=$(ex_idir) \
  CPPFLAGS=-I$(ex_idir)/include CFLAGS=-O2 LDFLAGS=\"-L$(ex_idir)/lib\"

# We only need gettext-runtime and there is sadly no top level
# configure option for this
cm_pkg_gettext_make_dir = gettext-runtime
cm_pkg_gettext_make_dir_inst = gettext-runtime
cm_pkg_gettext_ex_make_dir = gettext-runtime
cm_pkg_gettext_ex_make_dir_inst = gettext-runtime

cm_pkg_glib_configure = \
	--disable-gtk-doc-html \
	--with-pcre=internal \
  CPPFLAGS=-I$(idir)/include \
	LDFLAGS=\"-L$(idir)/lib\" \
	CCC=$(host)-g++
#cm_pkg_glib_extracflags = -march=i486

cm_pkg_gdk_pixbuf_configure = \
  --with-lib-prefix=$(idir) --with-libiconv-prefix=$(idir) \
  --with-included-loaders=yes \
	--with-gdiplus \
	--without-libjasper \
	--disable-gtk-doc-html \
	--disable-glibtest \
  CPPFLAGS=-I$(idir)/include LDFLAGS=\"-L$(idir)/lib\"

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
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_freetype_configure = \
	--with-png --without-bzip2 --with-zlib \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_fontconfig_configure = \
	--enable-iconv --disable-docs \
	--enable-libxml2 \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_pango_configure = \
	--disable-gtk-doc-html --disable-glibtest --disable-doc-cross-references \
	--with-included-modules=yes \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_atk_configure = \
	--disable-gtk-doc-html --disable-glibtest \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_pixman_configure = \
	--enable-libpng --disable-sse2 \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_cairo_configure = \
	--enable-win32 --enable-win32-font \
	--enable-ft --enable-fc \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

# We would like to use --with-libiconv-prefix and
# --with-libintl-prefix, but these don't work with the cheesy
# non-"libfoo.la" versions of iconv and gettext that we are using.
#cm_pkg_libgpg_error_configure = \
#  --with-libiconv-prefix=$(idir) --with-libintl-prefix=$(idir)
cm_pkg_libgpg_error_configure = --silent \
	--disable-doc \
  --enable-static \
  CPPFLAGS=-I$(idir)/include LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_libgpg_error_ex_configure = --silent \
  CPPFLAGS=-I$(idir)/include LDFLAGS=\"-L$(idir)/lib\" \
  --enable-static

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

cm_pkg_libassuan_configure =  --silent --enable-static

# Using gpgsm with VirtualBox on AES-NI hardware crashes gpg-agent.
# However, the Libgcrypt's regression tests work just fine.  I don't
# have a windows instance on AES-NI, thus I can't currently debug
# this. As a workaround we disable AES-NI for now.
cm_pkg_libgcrypt_configure = \
  --with-gpg-error-prefix=$(idir) \
	--disable-tests \
  --disable-aesni-support

cm_pkg_libpng_configure = \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_enchant_configure = \
	--enable-ispell \
	--enable-myspell \
	--enable-aspell \
	--disable-voikko \
	--disable-uspell \
	--disable-hspell \
	--disable-zemberek \
	CPPFLAGS=\"-I$(idir)/include \
	-UENCHANT_GLOBAL_MODULE_DIR \
	-UENCHANT_GLOBAL_ORDERING \
	-UENCHANT_MYSPELL_DICT_DIR \
	-UENCHANT_USPELL_DICT_DIR\" \
	LDFLAGS=\"-L$(idir)/lib\"

# The LDFLAGS is needed for -lintl for glib.
cm_pkg_gpgme_configure = --silent \
  --with-gpg-error-prefix=$(idir) --enable-static \
  `test -n "@HAVE_PKG_GLIB@" && echo "--enable-w32-glib"` \
  --disable-w32-qt LDFLAGS=\"-L$(idir)/lib\"

# We want to build with libgcrypt
# We can't use pkcs11 tue to tto much additional dependencies.
cm_pkg_gnutls_configure = \
  --disable-cxx \
  --with-libgcrypt \
  --without-p11-kit \
	--with-included-unistring \
	--disable-gtk-doc-html \
	--disable-tests \
	--disable-doc \
	--disable-tools \
  --with-libtasn1-prefix=$(idir) \
  --with-libgcrypt-prefix=$(idir) \
	CPPFLAGS=\"-I$(idir)/include\" LDFLAGS=\"-L$(idir)/lib\"

cm_pkg_gmp_configure = \
  --disable-static \
	--enable-shared \
	--disable-cxx

cm_pkg_nettle_configure = \
  --enable-public-key \
	CPPFLAGS=\"-I$(idir)/include\" \
	LDFLAGS=\"-L$(idir)/lib\"

# In 2.12.21 gnutls_openssl is not linked to libtasn1, thus we use
# this hack to here.  (Using the included minitasn does work either
# due to a missing soruce file.)
cm_pkg_gnutls_make_args = \
   LTLIBTASN1=-ltasn1


cm_pkg_curl_configure = \
  --with-gnutls --with-winssl --with-winidn\
	--without-ca-bundle --without-ca-path \
	--with-libiconv-prefix=$(idir) \
  CPPFLAGS=\"-I$(idir)/include\" LIBS=\"-L$(idir)/lib\"

cm_pkg_libxml2_configure = \
  --enable-shared --without-python --with-iconv=$(idir)

cm_pkg_libxslt_configure = \
	--enable-shared --without-python

cm_pkg_expat_configure = \
	--without-docbook

cm_pkg_cyrus_sasl_configure = \
	--without-openssl --disable-ldapd --without-saslauthd \
	--without-pwcheck --without-des --without-authdaemond \
	--enable-cram --enable-digest \
	--enable-plain --enable-anon --enable-login \
	--disable-static --enable-shared \
	CPPFLAGS=\"-I$(idir)/include\" LIBS=\"-L$(idir)/lib\"

cm_pkg_libetpan_configure = --with-gnutls --enable-threads \
	--enable-ipv6 \
  CPPFLAGS=\"-I$(idir)/include\" \
  LDFLAGS=\"-L$(idir)/lib\" LIBS=\"-lpthread\"

# -D_POSIX_C_SOURCE is there so that time.h from mingw64-4.x
# actually gives us gmtime_r() and localtime_r() prototype declarations
cm_pkg_claws_mail_configure = \
  --with-lib-prefix=$(idir) --with-libiconv-prefix=$(idir) \
  --with-gpg-error-prefix=$(idir) --with-gpgme-prefix=$(idir) \
  --enable-pthread --enable-gnutls \
  --enable-libetpan --disable-dbus --disable-valgrind --enable-ipv6 \
  --disable-jpilot --disable-startup-notification \
  --disable-spamassassin-plugin --disable-bogofilter-plugin \
  --enable-fancy-plugin --disable-geolocation-plugin \
  --disable-acpi_notifier-plugin --disable-clamd-plugin \
  --disable-perl-plugin --disable-python-plugin --disable-demo-plugin \
  --disable-newmail-plugin --disable-mailmbox-plugin \
	--disable-dillo-plugin --enable-tnef_parse-plugin \
	--with-password-encryption=gnutls \
	CFLAGS=\"-O2 \" \
	CPPFLAGS=\"-O2 -I$(idir)/include -D_POSIX_C_SOURCE\" \
	LDFLAGS=\"-L$(idir)/lib\" LIBS=\"-lexpat\"

cm_pkg_jpeg_configure = \
							--with-libiconv-prefix=$(idir)

cm_pkg_sqlite_autoconf_configure = \
	--disable-static-shell

cm_pkg_glib_networking_configure = \
  --disable-glibtest \
	--without-libproxy \
	--without-gnome-proxy \
	--with-gnutls \
	--without-pkcs11 \
	LDFLAGS=\"-L$(idir)/lib\" \
	CPPFLAGS=\"-I$(idir)/include\"

cm_pkg_libsoup_configure = \
	--without-gnome \
	--without-apache-httpd \
	--without-gssapi \
	CPPFLAGS=\"-I$(idir)/include\" LIBS=\"-L$(idir)/lib\"

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
               CFLAGS=\"-I$(idir)/include -O2 -mms-bitfields\" \
               CXXFLAGS=\"-I$(idir)/include -O2 -std=gnu++98 -mms-bitfields -fexceptions\" \
               CPPFLAGS=\"-I$(idir)/include -O2 -mms-bitfields -Wno-expansion-to-defined\" \
         CC=$(CC) LIBS=\"-L$(idir)/lib\"

cm_pkg_libical_cmake_args = \
											 -DCMAKE_TOOLCHAIN_FILE=$(tsdir)/src/Toolchain-mingw32.cmake

# This is not anymore needed sinces 3.8.0 already builds a PDF version.
# define cm_pkg_claws_mail_post_install
# (for i in de en ; do \
#     (cd $$$${pkgidir}/share/doc/claws-mail/manual/$$$${i}; \
#     ps2pdf claws-mail-manual.ps); \
#  done)
# endef


# Supported make-only source packages.
cm_mpkgs = bzip2 zlib crypt

# Extra options for the make invocations for individual packages.
# make_flags is used for building, make_args_inst is used for installing.
cm_pkg_bzip2_make_args = -j$(NUMPROC) \
  CC=$(CC) AR=$(AR) RANLIB=$(RANLIB)

cm_pkg_bzip2_make_args_inst = \
  PREFIX=$$$${pkgidir} CC=$(CC) AR=$(AR) RANLIB=$(RANLIB)

cm_pkg_crypt_make_args = -j$(NUMPROC) \
  CC=$(CC) AR=$(AR)

cm_pkg_crypt_make_args_inst = \
  prefix=$$$${pkgidir}

cm_pkg_zlib_make_args = -j$(NUMPROC) \
  -fwin32/Makefile.gcc PREFIX=$(host)- IMPLIB=libz.dll.a

cm_pkg_zlib_make_args_inst = -fwin32/Makefile.gcc install \
	BINARY_PATH=$$$${pkgidir}/bin INCLUDE_PATH=$$$${pkgidir}/include \
	LIBRARY_PATH=$$$${pkgidir}/lib SHARED_MODE=1 IMPLIB=libz.dll.a

# Supported binary packages.
cm_bpkgs = pkgconfig bsfilter

# libiconv needs some special magic to generate a usable import
# library.
# define cm_pkg_libiconv_post_install
# (cp $(srcdir)/libiconv.def $$$${pkgidir}/lib;		\
# cd $$$${pkgidir}/lib;					\
# $(DLLTOOL) --output-lib libiconv.dll.a --def libiconv.def)
# endef

# libiconv needs some special magic to generate a usable import
# library.  Note that we include some internal symbols that are not
# actually part of the DLL.  They are needed by the AM_GNU_GETTEXT
# configure test, but not used otherwise.
# define cm_pkg_gettext_post_install
# (cp $(srcdir)/libintl.def $$$${pkgidir}/lib;		\
# cd $$$${pkgidir}/lib;					\
# $(DLLTOOL) --output-lib libintl.dll.a --def libintl.def)
# endef


# Zlib needs some special magic to generate a libtool file.
# We also install the pc file here.
define cm_pkg_zlib_post_install
(mkdir $$$${pkgidir}/lib/pkgconfig || true;             \
cp $(abs_srcdir)/zlib.pc $$$${pkgidir}/lib/pkgconfig/;  \
cd $$$${pkgidir};					\
echo "# Generated by libtool" > lib/libz.la		\
echo "dlname='../bin/zlib1.dll'" >> lib/libz.la;	\
echo "library_names='libz.dll.a'" >> lib/libz.la;	\
echo "old_library='libz.a'" >> lib/libz.la;		\
echo "dependency_libs=''" >> lib/libz.la;		\
echo "current=1" >> lib/libz.la;			\
echo "age=2" >> lib/libz.la;				\
echo "revision=5" >> lib/libz.la;			\
echo "installed=yes" >> lib/libz.la;			\
echo "shouldnotlink=no" >> lib/libz.la;			\
echo "dlopen=''" >> lib/libz.la;			\
echo "dlpreopen=''" >> lib/libz.la;			\
echo "libdir=\"$$$${pkgidir}/lib\"" >> lib/libz.la)
endef

# To make sure that we link against the static versions we need
# remove the import libs from crypt
#define cm_pkg_crypt_post_install
#(cd $$$${pkgidir}/lib && rm libcrypt.dll.a libcrypt.lib)
#endef

# We need to fix the prefix in the various packages using pkgconfig,
# or we can't substitute it properly in our pkg-config wrapper.
# glib also installs an empty charset.alias for mingw which creates
# a stow conflict with the one from iconv.
define cm_pkg_glib_post_install
 (cd $$$${pkgidir};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`; \
 rm $$$${pkgidir}/lib/charset.alias)
endef

define cm_pkg_libffi_post_install
 (cd $$$${pkgidir};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_gdk_pixbuf_post_install
 (cd $$$${pkgidir};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_atk_post_install
 (cd $$$${pkgidir_dev};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_freetype_post_install
 (cd $$$${pkgidir_dev};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_fontconfig_post_install
 (cd $$$${pkgidir_dev};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_cairo_post_install
 (cd $$$${pkgidir_dev};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_pango_post_install
 (cd $$$${pkgidir_dev};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_gtk__post_install
 (cd $$$${pkgidir_dev};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_libpng_post_install
 (cd $$$${pkgidir};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_enchant_post_install
 (cd $$$${pkgidir};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_libtasn1_post_install
 (cd $$$${pkgidir};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

define cm_pkg_gnutls_post_install
 (cd $$$${pkgidir};							\
 perl -pi -e 's/^prefix=.*$$$$/prefix=\/usr/' `find . -name \*.pc`)
endef

#define cm_pkg_libiconv_post_install
#(cp $(srcdir)/libiconv.def $$$${pkgidir}/lib;		\
#cd $$$${pkgidir}/lib;					\
#$(DLLTOOL) --output-lib libiconv.dll.a --def libiconv.def)
#endef

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
	$(SHA1SUM) $(pkg_files) </dev/null > versioninfo.tmp
	set -e; \
	( while read a b; do echo "$$a $$(basename $$b)"; \
            done < versioninfo.tmp \
          | sort -k2 -sf | tac | uniq -f1 ; \
          echo '=========== SHA-1 checksum ============= == package ==' \
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
