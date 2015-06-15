# inst-sections.nsi - Installer for GPG4Win sections.  -*- coding: latin-1; -*-
# Copyright (C) 2005, 2006, 2007, 2008, 2009 g10 Code GmbH
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


# Sections

!include "inst-gpg4win.nsi"

# The order of installation must be the same as the build order.  You
# can use tsort on the info in configure.ac, or just check out
# gpg4win_build_list in config.nsi.  The order determines also the
# order in the packages selection dialog.

!ifdef HAVE_PKG_ADNS
!include "inst-adns.nsi"
!endif
!ifdef HAVE_PKG_BZIP2
!include "inst-bzip2.nsi"
!endif
!ifdef HAVE_PKG_CRYPT
!include "inst-crypt.nsi"
!endif
!ifdef HAVE_PKG_LIBGSASL
!include "inst-libgsasl.nsi"
!endif
!ifdef HAVE_PKG_LIBICONV
!include "inst-libiconv.nsi"
!endif
!ifdef HAVE_PKG_LIBTASN1
!include "inst-libtasn1.nsi"
!endif
!ifdef HAVE_PKG_PKGCONFIG
!include "inst-pkgconfig.nsi"
!endif
!ifdef HAVE_PKG_REGEX
!include "inst-regex.nsi"
!endif
!ifdef HAVE_PKG_W32PTH
!include "inst-w32pth.nsi"
!endif
!ifdef HAVE_PKG_ZLIB
!include "inst-zlib.nsi"
!endif
!ifdef HAVE_PKG_GETTEXT
!include "inst-gettext.nsi"
!endif
!ifdef HAVE_PKG_LIBPNG
!include "inst-libpng.nsi"
!endif
!ifdef HAVE_PKG_ENCHANT
!include "inst-enchant.nsi"
!endif
!ifdef HAVE_PKG_LIBETPAN
!include "inst-libetpan.nsi"
!endif
!ifdef HAVE_PKG_LIBASSUAN
!include "inst-libassuan.nsi"
!endif
!ifdef HAVE_PKG_LIBGPG_ERROR
!include "inst-libgpg-error.nsi"
!endif
!ifdef HAVE_PKG_LIBFFI
!include "inst-libffi.nsi"
!endif
!ifdef HAVE_PKG_GLIB
!include "inst-glib.nsi"
!endif
!ifdef HAVE_PKG_LIBKSBA
!include "inst-libksba.nsi"
!endif
!ifdef HAVE_PKG_LIBGCRYPT
!include "inst-libgcrypt.nsi"
!endif
!ifdef HAVE_PKG_EXPAT
!include "inst-expat.nsi"
!endif
!ifdef HAVE_PKG_FREETYPE
!include "inst-freetype.nsi"
!endif
!ifdef HAVE_PKG_FONTCONFIG
!include "inst-fontconfig.nsi"
!endif
!ifdef HAVE_PKG_CAIRO
!include "inst-cairo.nsi"
!endif
!ifdef HAVE_PKG_PANGO
!include "inst-pango.nsi"
!endif
!ifdef HAVE_PKG_ATK
!include "inst-atk.nsi"
!endif
!ifdef HAVE_PKG_DIRMNGR
!include "inst-dirmngr.nsi"
!endif
!ifdef HAVE_PKG_GDK_PIXBUF
!include "inst-gdk-pixbuf.nsi"
!endif
!ifdef HAVE_PKG_GTK_
!include "inst-gtk+.nsi"
!endif
!ifdef HAVE_PKG_GNUTLS
!include "inst-gnutls.nsi"
!endif
!ifdef HAVE_PKG_CURL
!include "inst-curl.nsi"
!endif
!ifdef HAVE_PKG_LIBXML2
!include "inst-libxml2.nsi"
!endif
!ifdef HAVE_PKG_PINENTRY
!include "inst-pinentry.nsi"
!endif
!ifdef HAVE_PKG_GPGME
!include "inst-gpgme.nsi"
!endif
!ifdef HAVE_PKG_WEBKIT
!include "inst-webkit.nsi"
!endif
!ifdef HAVE_PKG_JPEG
!include "inst-jpeg.nsi"
!endif
!ifdef HAVE_PKG_GLIB_NETWORKING
!include "inst-glib-networking.nsi"
!endif
!ifdef HAVE_PKG_LIBSOUP
!include "inst-libsoup.nsi"
!endif
!ifdef HAVE_PKG_GMP
!include "inst-gmp.nsi"
!endif
!ifdef HAVE_PKG_NETTLE
!include "inst-nettle.nsi"
!endif

# These are displayed in the selection dialog.

!ifdef HAVE_PKG_CLAWS_MAIL
!include "inst-claws-mail.nsi"
!endif
!ifdef HAVE_PKG_GNUPG2
!include "inst-gnupg2.nsi"
!endif
!ifdef HAVE_PKG_GPA
!include "inst-gpa.nsi"
!endif

!include "inst-final.nsi"

# We have to invoke the uninstallers in reverse order!

!ifdef HAVE_PKG_GPA
!include "uninst-gpa.nsi"
!endif
!ifdef HAVE_PKG_GNUPG2
!include "uninst-gnupg2.nsi"
!endif
!ifdef HAVE_PKG_CLAWS_MAIL
!include "uninst-claws-mail.nsi"
!endif

!ifdef HAVE_PKG_NETTLE
!include "uninst-nettle.nsi"
!endif
!ifdef HAVE_PKG_GMP
!include "uninst-gmp.nsi"
!endif
!ifdef HAVE_PKG_LIBSOUP
!include "uninst-libsoup.nsi"
!endif
!ifdef HAVE_PKG_GLIB_NETWORKING
!include "uninst-glib-networking.nsi"
!endif
!ifdef HAVE_PKG_JPEG
!include "uninst-jpeg.nsi"
!endif
!ifdef HAVE_PKG_WEBKIT
!include "uninst-webkit.nsi"
!endif
!ifdef HAVE_PKG_GPGME
!include "uninst-gpgme.nsi"
!endif
!ifdef HAVE_PKG_PINENTRY
!include "uninst-pinentry.nsi"
!endif
!ifdef HAVE_PKG_LIBXML2
!include "uninst-libxml2.nsi"
!endif
!ifdef HAVE_PKG_CURL
!include "uninst-curl.nsi"
!endif
!ifdef HAVE_PKG_GNUTLS
!include "uninst-gnutls.nsi"
!endif
!ifdef HAVE_PKG_GTK_
!include "uninst-gtk+.nsi"
!endif
!ifdef HAVE_PKG_GDK_PIXBUF
!include "uninst-gdk-pixbuf.nsi"
!endif
!ifdef HAVE_PKG_DIRMNGR
!include "uninst-dirmngr.nsi"
!endif
!ifdef HAVE_PKG_ATK
!include "uninst-atk.nsi"
!endif
!ifdef HAVE_PKG_PANGO
!include "uninst-pango.nsi"
!endif
!ifdef HAVE_PKG_CAIRO
!include "uninst-cairo.nsi"
!endif
!ifdef HAVE_PKG_FONTCONFIG
!include "uninst-fontconfig.nsi"
!endif
!ifdef HAVE_PKG_FREETYPE
!include "uninst-freetype.nsi"
!endif
!ifdef HAVE_PKG_EXPAT
!include "uninst-expat.nsi"
!endif
!ifdef HAVE_PKG_LIBGCRYPT
!include "uninst-libgcrypt.nsi"
!endif
!ifdef HAVE_PKG_LIBKSBA
!include "uninst-libksba.nsi"
!endif
!ifdef HAVE_PKG_GLIB
!include "uninst-glib.nsi"
!endif
!ifdef HAVE_PKG_LIBFFI
!include "uninst-libffi.nsi"
!endif
!ifdef HAVE_PKG_LIBGPG_ERROR
!include "uninst-libgpg-error.nsi"
!endif
!ifdef HAVE_PKG_LIBASSUAN
!include "uninst-libassuan.nsi"
!endif
!ifdef HAVE_PKG_LIBETPAN
!include "uninst-libetpan.nsi"
!endif
!ifdef HAVE_PKG_LIBPNG
!include "uninst-libpng.nsi"
!endif
!ifdef HAVE_PKG_ENCHANT
!include "uninst-enchant.nsi"
!endif
!ifdef HAVE_PKG_GETTEXT
!include "uninst-gettext.nsi"
!endif
!ifdef HAVE_PKG_ZLIB
!include "uninst-zlib.nsi"
!endif
!ifdef HAVE_PKG_W32PTH
!include "uninst-w32pth.nsi"
!endif
!ifdef HAVE_PKG_REGEX
!include "uninst-regex.nsi"
!endif
!ifdef HAVE_PKG_PKGCONFIG
!include "uninst-pkgconfig.nsi"
!endif
!ifdef HAVE_PKG_LIBTASN1
!include "uninst-libtasn1.nsi"
!endif
!ifdef HAVE_PKG_LIBICONV
!include "uninst-libiconv.nsi"
!endif
!ifdef HAVE_PKG_LIBGSASL
!include "uninst-libgsasl.nsi"
!endif
!ifdef HAVE_PKG_CRYPT
!include "uninst-crypt.nsi"
!endif
!ifdef HAVE_PKG_BZIP2
!include "uninst-bzip2.nsi"
!endif
!ifdef HAVE_PKG_ADNS
!include "uninst-adns.nsi"
!endif

!include "uninst-gpg4win.nsi"


# Dependency Management

${MementoSectionDone}

!include "Sections.nsh"


Function CalcDefaults

# The defaults for the installer-options.ini file.
g4wihelp::config_fetch_bool "inst_start_menu"
StrCmp $R0 "" +2
!insertmacro MUI_INSTALLOPTIONS_WRITE "installer-options.ini" \
	"Field 2" "State" $R0

g4wihelp::config_fetch_bool "inst_desktop"
StrCmp $R0 "" +2
!insertmacro MUI_INSTALLOPTIONS_WRITE "installer-options.ini" \
	"Field 3" "State" $R0

g4wihelp::config_fetch_bool "inst_quick_launch_bar"
StrCmp $R0 "" +2
!insertmacro MUI_INSTALLOPTIONS_WRITE "installer-options.ini" \
	"Field 4" "State" $R0



!ifdef HAVE_PKG_GPA
  g4wihelp::config_fetch_bool "inst_gpa"
  StrCmp $R0 "1" 0 calc_defaults_gpa_not_one
   !insertmacro SelectSection ${SEC_gpa}
   Goto calc_defaults_gpa_done
  calc_defaults_gpa_not_one:
  StrCmp $R0 "0" 0 calc_defaults_gpa_done
   !insertmacro UnselectSection ${SEC_gpa}
calc_defaults_gpa_done:
!endif

!ifdef HAVE_PKG_CLAWS_MAIL
  g4wihelp::config_fetch_bool "inst_claws_mail"
  StrCmp $R0 "1" 0 calc_defaults_claws_mail_not_one
   !insertmacro SelectSection ${SEC_claws_mail}
   Goto calc_defaults_claws_mail_done
  calc_defaults_claws_mail_not_one:
  StrCmp $R0 "0" 0 calc_defaults_claws_mail_done
   !insertmacro UnselectSection ${SEC_claws_mail}
calc_defaults_claws_mail_done:
!endif

FunctionEnd


Function CalcDepends
  # This section could very well be autogenerated from the
  # information in configure.ac.  Note that it doesn't hurt to have
  # stuff here for packages that we don't include.

  # First clear all indirect dependencies.
!ifdef HAVE_PKG_LIBICONV
  !insertmacro UnselectSection ${SEC_libiconv}
!endif
!ifdef HAVE_PKG_GETTEXT
  !insertmacro UnselectSection ${SEC_gettext}
!endif
!ifdef HAVE_PKG_ZLIB
  !insertmacro UnselectSection ${SEC_zlib}
!endif
!ifdef HAVE_PKG_CRYPT
  !insertmacro UnselectSection ${SEC_crypt}
!endif
!ifdef HAVE_PKG_REGEX
  !insertmacro UnselectSection ${SEC_regex}
!endif
!ifdef HAVE_PKG_LIBPNG
  !insertmacro UnselectSection ${SEC_libpng}
!endif
!ifdef HAVE_PKG_ENCHANT
  !insertmacro UnselectSection ${SEC_enchant}
!endif
!ifdef HAVE_PKG_PKGCONFIG
  !insertmacro UnselectSection ${SEC_pkgconfig}
!endif
!ifdef HAVE_PKG_GLIB
  !insertmacro UnselectSection ${SEC_glib}
!endif
!ifdef HAVE_PKG_ATK
  !insertmacro UnselectSection ${SEC_atk}
!endif
!ifdef HAVE_PKG_PANGO
  !insertmacro UnselectSection ${SEC_pango}
!endif
!ifdef HAVE_PKG_EXPAT
  !insertmacro UnselectSection ${SEC_expat}
!endif
!ifdef HAVE_PKG_FREETYPE
  !insertmacro UnselectSection ${SEC_freetype}
!endif
!ifdef HAVE_PKG_FONTCONFIG
  !insertmacro UnselectSection ${SEC_fontconfig}
!endif
!ifdef HAVE_PKG_CAIRO
  !insertmacro UnselectSection ${SEC_cairo}
!endif
!ifdef HAVE_PKG_GTK_
  !insertmacro UnselectSection ${SEC_gtk_}
!endif
!ifdef HAVE_PKG_BZIP2
  !insertmacro UnselectSection ${SEC_bzip2}
!endif
!ifdef HAVE_PKG_ADNS
  !insertmacro UnselectSection ${SEC_adns}
!endif
!ifdef HAVE_PKG_LIBGPG_ERROR
  !insertmacro UnselectSection ${SEC_libgpg_error}
!endif
!ifdef HAVE_PKG_LIBGCRYPT
  !insertmacro UnselectSection ${SEC_libgcrypt}
!endif
!ifdef HAVE_PKG_LIBKSBA
  !insertmacro UnselectSection ${SEC_libksba}
!endif
!ifdef HAVE_PKG_W32PTH
  !insertmacro UnselectSection ${SEC_w32pth}
!endif
!ifdef HAVE_PKG_LIBASSUAN
  !insertmacro UnselectSection ${SEC_libassuan}
!endif
!ifdef HAVE_PKG_DIRMNGR
  !insertmacro UnselectSection ${SEC_dirmngr}
!endif
!ifdef HAVE_PKG_PINENTRY
  !insertmacro UnselectSection ${SEC_pinentry}
!endif
!ifdef HAVE_PKG_GPGME
  !insertmacro UnselectSection ${SEC_gpgme}
!endif
!ifdef HAVE_PKG_LIBGSASL
  !insertmacro UnselectSection ${SEC_libgsasl}
!endif
!ifdef HAVE_PKG_LIBTASN1
  !insertmacro UnselectSection ${SEC_libtasn1}
!endif
!ifdef HAVE_PKG_GNUTLS
  !insertmacro UnselectSection ${SEC_gnutls}
!endif
!ifdef HAVE_PKG_CURL
  !insertmacro UnselectSection ${SEC_curl}
!endif
!ifdef HAVE_PKG_LIBXML2
  !insertmacro UnselectSection ${SEC_libxml2}
!endif

  # Always install gnupg2.  This is also ensured by putting
  # these packages in the RO section and enabling them by default, but
  # it doesn't harm to add it explicitely here as well.

  !insertmacro SelectSection ${SEC_claws_mail}
  !insertmacro SelectSection ${SEC_gnupg2}
  !insertmacro SelectSection ${SEC_gpa}

  # Then enable all dependencies, mostly in reverse build list order!
  # An exception are the claws plugins, which are build after claws,
  # but are installed as a dependency of claws.

  # First the explicitely installed packages.

!ifdef HAVE_PKG_GNUPG2
  !insertmacro SectionFlagIsSet ${SEC_gnupg2} ${SF_SELECTED} have_gnupg2 skip_gnupg2
  have_gnupg2:
  !insertmacro SelectSection ${SEC_libiconv}
  !insertmacro SelectSection ${SEC_libgcrypt}
  !insertmacro SelectSection ${SEC_libksba}
  !insertmacro SelectSection ${SEC_libassuan}
  !insertmacro SelectSection ${SEC_libgpg_error}
  !insertmacro SelectSection ${SEC_w32pth}
  !insertmacro SelectSection ${SEC_zlib}
  !insertmacro SelectSection ${SEC_adns}
  !insertmacro SelectSection ${SEC_pinentry}
  !insertmacro SelectSection ${SEC_curl}
  !insertmacro SelectSection ${SEC_dirmngr}
  # Because we need pinentry, we also need to install GTK+
  !insertmacro SelectSection ${SEC_zlib}
  !insertmacro SelectSection ${SEC_gtk_}
  !insertmacro SelectSection ${SEC_libpng}
  !insertmacro SelectSection ${SEC_glib}
  skip_gnupg2:
!endif

!ifdef HAVE_PKG_GPA
  !insertmacro SectionFlagIsSet ${SEC_gpa} ${SF_SELECTED} have_gpa skip_gpa
  have_gpa:
  !insertmacro SelectSection ${SEC_libiconv}
  !insertmacro SelectSection ${SEC_gettext}
  !insertmacro SelectSection ${SEC_zlib}
  !insertmacro SelectSection ${SEC_gtk_}
  !insertmacro SelectSection ${SEC_libpng}
  !insertmacro SelectSection ${SEC_glib}
  !insertmacro SelectSection ${SEC_gpgme}
  skip_gpa:
!endif

!ifdef HAVE_PKG_CLAWS_MAIL
  !insertmacro SectionFlagIsSet ${SEC_claws_mail} ${SF_SELECTED} have_claws_mail skip_claws_mail
  have_claws_mail:
  !insertmacro SelectSection ${SEC_libiconv}
  !insertmacro SelectSection ${SEC_gettext}
  !insertmacro SelectSection ${SEC_zlib}
  !insertmacro SelectSection ${SEC_gtk_}
  !insertmacro SelectSection ${SEC_libpng}
  !insertmacro SelectSection ${SEC_enchant}
  !insertmacro SelectSection ${SEC_glib}
  !insertmacro SelectSection ${SEC_gpgme}
  !insertmacro SelectSection ${SEC_crypt}
  !insertmacro SelectSection ${SEC_regex}
  !insertmacro SelectSection ${SEC_libetpan}
  !insertmacro SelectSection ${SEC_gnutls}
  !insertmacro SelectSection ${SEC_libxml2}
  # These are not build dependencies, but we always want to install
  # all plugins.
  skip_claws_mail:
!endif

  # Now the implicitely installed packages.

!ifdef HAVE_PKG_LIBXML2
  !insertmacro SectionFlagIsSet ${SEC_libxml2} ${SF_SELECTED} have_libxml2 skip_libxml2
  have_libxml2:
  !insertmacro SelectSection ${SEC_zlib}
  skip_libxml2:
!endif

!ifdef HAVE_PKG_CURL
  !insertmacro SectionFlagIsSet ${SEC_curl} ${SF_SELECTED} have_curl skip_curl
  have_curl:
  !insertmacro SelectSection ${SEC_zlib}
  !insertmacro SelectSection ${SEC_gnutls}
  skip_curl:
!endif

!ifdef HAVE_PKG_LIBETPAN
  !insertmacro SectionFlagIsSet ${SEC_libetpan} ${SF_SELECTED} have_libetpan skip_libetpan
  have_libetpan:
  !insertmacro SelectSection ${SEC_gnutls}
  skip_libetpan:
!endif

!ifdef HAVE_PKG_GNUTLS
  !insertmacro SectionFlagIsSet ${SEC_gnutls} ${SF_SELECTED} have_gnutls skip_gnutls
  have_gnutls:
  !insertmacro SelectSection ${SEC_libgsasl}
  !insertmacro SelectSection ${SEC_libtasn1}
  skip_gnutls:
!endif

  # Package "libtasn1" has no dependencies.
  # Package "libgsasl" has no dependencies.

!ifdef HAVE_PKG_GPGME
  !insertmacro SectionFlagIsSet ${SEC_gpgme} \
		${SF_SELECTED} have_gpgme skip_gpgme
  have_gpgme:
  # GPGME does not depend on gnupg2.  Do this in the
  # actual application instead.
  !insertmacro SelectSection ${SEC_libgpg_error}
   skip_gpgme:
!endif

!ifdef HAVE_PKG_PINENTRY
  !insertmacro SectionFlagIsSet ${SEC_pinentry} \
		${SF_SELECTED} have_pinentry skip_pinentry
  have_pinentry:
  !insertmacro SelectSection ${SEC_libiconv}
  !insertmacro SelectSection ${SEC_gtk_}
   skip_pinentry:
!endif

!ifdef HAVE_PKG_DIRMNGR
  !insertmacro SectionFlagIsSet ${SEC_dirmngr} ${SF_SELECTED} have_dirmngr skip_dirmngr
  have_dirmngr:
  !insertmacro SelectSection ${SEC_libgpg_error}
  !insertmacro SelectSection ${SEC_libgcrypt}
  !insertmacro SelectSection ${SEC_libassuan}
  !insertmacro SelectSection ${SEC_libksba}
  !insertmacro SelectSection ${SEC_w32pth}
  skip_dirmngr:
!endif

!ifdef HAVE_PKG_LIBASSUAN
  !insertmacro SectionFlagIsSet ${SEC_libassuan} ${SF_SELECTED} have_libassuan skip_libassuan
  have_libassuan:
  !insertmacro SelectSection ${SEC_libgpg_error}
  !insertmacro SelectSection ${SEC_w32pth}
  skip_libassuan:
!endif

  # Package "w32pth" has no dependencies.

!ifdef HAVE_PKG_LIBKSBA
  !insertmacro SectionFlagIsSet ${SEC_libksba} ${SF_SELECTED} have_libksba skip_libksba
  have_libksba:
  !insertmacro SelectSection ${SEC_libgpg_error}
  skip_libksba:
!endif

!ifdef HAVE_PKG_LIBGPG_ERROR
  !insertmacro SectionFlagIsSet ${SEC_libgpg_error} ${SF_SELECTED} have_libgpg_error skip_libgpg_error
  have_libgpg_error:
  !insertmacro SelectSection ${SEC_libiconv}
  !insertmacro SelectSection ${SEC_gettext}
  skip_libgpg_error:
!endif

  # Package "adns" has no dependencies.
  # Package "bzip2" has no dependencies.

!ifdef HAVE_PKG_GTK_
  !insertmacro SectionFlagIsSet ${SEC_gtk_} \
		${SF_SELECTED} have_gtk_ skip_gtk_
  have_gtk_:
  !insertmacro SelectSection ${SEC_libiconv}
  !insertmacro SelectSection ${SEC_gettext}
  !insertmacro SelectSection ${SEC_pkgconfig}
  !insertmacro SelectSection ${SEC_atk}
  !insertmacro SelectSection ${SEC_pango}
  !insertmacro SelectSection ${SEC_glib}
  !insertmacro SelectSection ${SEC_cairo}
  skip_gtk_:
!endif

!ifdef HAVE_PKG_CAIRO
  !insertmacro SectionFlagIsSet ${SEC_cairo} \
		${SF_SELECTED} have_cairo skip_cairo
  have_cairo:
  !insertmacro SelectSection ${SEC_glib}
  !insertmacro SelectSection ${SEC_pkgconfig}
  !insertmacro SelectSection ${SEC_expat}
  !insertmacro SelectSection ${SEC_freetype}
  !insertmacro SelectSection ${SEC_fontconfig}
  skip_cairo:
!endif

!ifdef HAVE_PKG_FONTCONFIG
  !insertmacro SectionFlagIsSet ${SEC_fontconfig} \
		${SF_SELECTED} have_fontconfig skip_fontconfig
  have_fontconfig:
  !insertmacro SelectSection ${SEC_pkgconfig}
  !insertmacro SelectSection ${SEC_freetype}
  skip_fontconfig:
!endif

!ifdef HAVE_PKG_FREETYPE
  !insertmacro SectionFlagIsSet ${SEC_freetype} \
		${SF_SELECTED} have_freetype skip_freetype
  have_freetype:
  !insertmacro SelectSection ${SEC_pkgconfig}
  !insertmacro SelectSection ${SEC_expat}
  skip_freetype:
!endif

# Package "expat" has no dependencies.

!ifdef HAVE_PKG_PANGO
  !insertmacro SectionFlagIsSet ${SEC_pango} \
		${SF_SELECTED} have_pango skip_pango
  have_pango:
  !insertmacro SelectSection ${SEC_glib}
  !insertmacro SelectSection ${SEC_pkgconfig}
  skip_pango:
!endif

!ifdef HAVE_PKG_ATK
  !insertmacro SectionFlagIsSet ${SEC_atk} \
		${SF_SELECTED} have_atk skip_atk
  have_atk:
  !insertmacro SelectSection ${SEC_glib}
  !insertmacro SelectSection ${SEC_pkgconfig}
  skip_atk:
!endif

!ifdef HAVE_PKG_GLIB
  !insertmacro SectionFlagIsSet ${SEC_glib} \
		${SF_SELECTED} have_glib skip_glib
  have_glib:
  !insertmacro SelectSection ${SEC_libiconv}
  !insertmacro SelectSection ${SEC_gettext}
  !insertmacro SelectSection ${SEC_pkgconfig}
  skip_glib:
!endif

  # Package "pkgconfig" has no dependencies.

!ifdef HAVE_PKG_LIBPNG
  !insertmacro SectionFlagIsSet ${SEC_libpng} \
		${SF_SELECTED} have_libpng skip_libpng
  have_libpng:
  !insertmacro SelectSection ${SEC_pkgconfig}
  skip_libpng:
!endif

!ifdef HAVE_PKG_ENCHANT
  !insertmacro SectionFlagIsSet ${SEC_enchant} \
		${SF_SELECTED} have_enchant skip_enchant
  have_enchant:
  !insertmacro SelectSection ${SEC_pkgconfig}
  skip_enchant:
!endif

  # Package "regex" has no dependencies.
  # Package "crypt" has no dependencies.
  # Package "zlib" has no dependencies.

!ifdef HAVE_PKG_GETTEXT
  !insertmacro SectionFlagIsSet ${SEC_gettext} \
		${SF_SELECTED} have_gettext skip_gettext
  have_gettext:
  !insertmacro SelectSection ${SEC_libiconv}
  skip_gettext:
!endif

  # Package "libiconv" has no dependencies.

FunctionEnd


Function .onInit
  Call G4wRunOnce

  SetOutPath $TEMP
!ifdef SOURCES
  File /oname=gpgspltmp.bmp "${TOP_SRCDIR}/doc/logo/gpg4win-logo-400px.bmp"
  # We play the tune only for the source installer
  File /oname=gpgspltmp.wav "${TOP_SRCDIR}/src/gpg4win-splash.wav"
  g4wihelp::playsound $TEMP\gpgspltmp.wav
  g4wihelp::showsplash 2500 $TEMP\gpgspltmp.bmp

  Delete $TEMP\gpgspltmp.bmp
  # Note that we delete gpgspltmp.wav in .onInst{Failed,Success}
!endif

  # Enable this to force a language selection dialog on every run (the
  # preferred language is the default).  Otherwise, the preferred
  # language is stored in the registry, and the installer does not ask
  # on upgrades.
!ifdef DEBUG
!define MUI_LANGDLL_ALWAYSSHOW
!endif
  !insertmacro MUI_LANGDLL_DISPLAY

  # We can't use TOP_SRCDIR dir as the name of the file needs to be
  # the same while building and running the installer.  Thus we
  # generate the file from a template.
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "installer-options.ini"

  ${MementoSectionRestore}
  Call CalcDefaults
  Call CalcDepends
  Call CheckOtherGnuPGApps
FunctionEnd


Function un.onInit
  # Remove the language preference.
  !insertmacro MUI_UNGETLANGUAGE
FunctionEnd


Function .onInstFailed
  Delete $TEMP\gpgspltmp.wav
FunctionEnd

Function .onInstSuccess
  ${MementoSectionSave}
  Delete $TEMP\gpgspltmp.wav
FunctionEnd

Function .onSelChange
  Call CalcDepends
FunctionEnd


# This must be in a central place.  Urgs.

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!ifdef HAVE_PKG_GNUPG2
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_gnupg2} $(DESC_SEC_gnupg2)
!endif
!ifdef HAVE_PKG_GPA
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_gpa} $(DESC_SEC_gpa)
!endif
!ifdef HAVE_PKG_CLAWS_MAIL
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_claws_mail} $(DESC_SEC_claws_mail)
!endif
!insertmacro MUI_FUNCTION_DESCRIPTION_END


# This also must be in a central place.  Also Urgs.

Section "-startmenu"

  # NOT SetOutPath.
  StrCpy $OUTDIR "%HOMEDRIVE%%HOMEPATH%"

!ifdef HAVE_STARTMENU
  # Make sure that the context of the automatic variables has been set to
  # the "all users" shell folder.  This guarantees that the menu gets written
  # for all users.  We have already checked that we are running as Admin; or
  # we printed a warning that installation will not succeed.
  SetShellVarContext all

  # Check if the start menu entries where requested.
  !insertmacro MUI_INSTALLOPTIONS_READ $R0 "installer-options.ini" \
	"Field 2" "State"
  IntCmp $R0 0 no_start_menu

!insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    # Delete the old stuff.
    Delete "$SMPROGRAMS\$STARTMENU_FOLDER\*"

    CreateDirectory "$SMPROGRAMS\$STARTMENU_FOLDER"

!ifdef HAVE_PKG_GPA
    SectionGetFlags ${SEC_gpa} $R0
    IntOp $R0 $R0 & ${SF_SELECTED}
    IntCmp $R0 ${SF_SELECTED} 0 no_gpa_menu
    CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\GPA.lnk" \
	"$INSTDIR\gpa.exe" \
        "" "" "" SW_SHOWNORMAL "" $(DESC_Menu_gpa)
  no_gpa_menu:
!endif

!ifdef HAVE_PKG_CLAWS_MAIL
    SectionGetFlags ${SEC_claws_mail} $R0
    IntOp $R0 $R0 & ${SF_SELECTED}
    IntCmp $R0 ${SF_SELECTED} 0 no_claws_mail_menu
    CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Claws-Mail.lnk" \
	"$INSTDIR\claws-mail.exe" \
        "" "" "" SW_SHOWNORMAL "" $(DESC_Menu_claws_mail)
    CreateShortCut \
        "$SMPROGRAMS\$STARTMENU_FOLDER\$(DESC_Menu_manuals)\Claws-Mail Manual.lnk" \
	"$INSTDIR\claws-mail-manual.pdf" \
	"" "" "" SW_SHOWNORMAL "" $(DESC_Menu_claws_mail_pdf)
  no_claws_mail_menu:
!endif

# No more uninstall link because Windows has its own feature to call
#  the uninstaller.
#    CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Uninstall.lnk" \
#	"$INSTDIR\${PACKAGE}-uninstall.exe"
!insertmacro MUI_STARTMENU_WRITE_END

 no_start_menu:



  # Check if the desktop entries where requested.
  !insertmacro MUI_INSTALLOPTIONS_READ $R0 "installer-options.ini" \
	"Field 3" "State"
  IntCmp $R0 0 no_desktop

  # Delete the old stuff, also old names of previous versions.
  Delete "$DESKTOP\WinPT.lnk"
  Delete "$DESKTOP\GPA.lnk"
  Delete "$DESKTOP\Claws-Mail.lnk"
  Delete "$DESKTOP\Claws-Mail Manual.lnk"
  Delete "$DESKTOP\GPGee Manual.lnk"
  Delete "$DESKTOP\GnuPG FAQ.lnk"
  Delete "$DESKTOP\Gpg4Win README.lnk"
  Delete "$DESKTOP\$(DESC_Desktop_manuals)\Claws-Mail Manual.lnk"
  Delete "$DESKTOP\$(DESC_Desktop_manuals)\GPGee Manual.lnk"
  Delete "$DESKTOP\$(DESC_Desktop_manuals)\GnuPG FAQ.lnk"

  CreateDirectory "$DESKTOP\$(DESC_Desktop_manuals)"

!ifdef HAVE_PKG_GPA
    SectionGetFlags ${SEC_gpa} $R0
    IntOp $R0 $R0 & ${SF_SELECTED}
    IntCmp $R0 ${SF_SELECTED} 0 no_gpa_desktop
    CreateShortCut "$DESKTOP\GPA.lnk" \
	"$INSTDIR\gpa.exe" \
        "" "" "" SW_SHOWNORMAL "" $(DESC_Menu_gpa)
  no_gpa_desktop:
!endif

!ifdef HAVE_PKG_CLAWS_MAIL
    SectionGetFlags ${SEC_claws_mail} $R0
    IntOp $R0 $R0 & ${SF_SELECTED}
    IntCmp $R0 ${SF_SELECTED} 0 no_claws_mail_desktop
    CreateShortCut "$DESKTOP\Claws-Mail.lnk" \
	"$INSTDIR\claws-mail.exe" \
        "" "" "" SW_SHOWNORMAL "" $(DESC_Menu_claws_mail)
    CreateShortCut \
        "$DESKTOP\$(DESC_Desktop_manuals)\Claws-Mail Manual.lnk" \
	"$INSTDIR\claws-mail-manual.pdf" \
	"" "" "" SW_SHOWNORMAL "" $(DESC_Menu_claws_mail_pdf)
  no_claws_mail_desktop:
!endif

no_desktop:


  # Check if the quick launch bar entries where requested.
  !insertmacro MUI_INSTALLOPTIONS_READ $R0 "installer-options.ini" \
	"Field 4" "State"
  IntCmp $R0 0 no_quick_launch
  StrCmp $QUICKLAUNCH $TEMP no_quick_launch

  # Delete old Quick Launch Bar links.
  Delete "$QUICKLAUNCH\WinPT.lnk"
  Delete "$QUICKLAUNCH\GPA.lnk"
  Delete "$QUICKLAUNCH\Claws-Mail.lnk"
  Delete "$QUICKLAUNCH\GPGee Manual.lnk"
  Delete "$QUICKLAUNCH\GnuPG FAQ.lnk"
  Delete "$QUICKLAUNCH\Gpg4Win README.lnk"

!ifdef HAVE_PKG_GPA
    SectionGetFlags ${SEC_gpa} $R0
    IntOp $R0 $R0 & ${SF_SELECTED}
    IntCmp $R0 ${SF_SELECTED} 0 no_gpa_quicklaunch
    CreateShortCut "$QUICKLAUNCH\GPA.lnk" \
	"$INSTDIR\gpa.exe" \
        "" "" "" SW_SHOWNORMAL "" $(DESC_Menu_gpa)
  no_gpa_quicklaunch:
!endif

!ifdef HAVE_PKG_CLAWS_MAIL
    SectionGetFlags ${SEC_claws_mail} $R0
    IntOp $R0 $R0 & ${SF_SELECTED}
    IntCmp $R0 ${SF_SELECTED} 0 no_claws_mail_quicklaunch
    CreateShortCut "$QUICKLAUNCH\Claws-Mail.lnk" \
	"$INSTDIR\claws-mail.exe" \
        "" "" "" SW_SHOWNORMAL "" $(DESC_Menu_claws_mail)
  no_claws_mail_quicklaunch:
!endif


no_quick_launch:


!endif
SectionEnd


# FIXME: Now write desktop and quick launch bar.
# Don't forget to delete the corr. entries in installer-finish. Uninstall.
