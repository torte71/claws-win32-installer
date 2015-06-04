# gpg4win-src.nsi - Installer for GPG4Win sources.   -*- coding: latin-1; -*-
# Copyright (C) 2005, 2007 g10 Code GmbH
#
# This file is part of Gpg4win.
#
# Gpg4win is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# Gpg4win is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA

!cd "${BUILD_DIR}"
!addincludedir "${TOP_SRCDIR}"
!addincludedir "${TOP_SRCDIR}/po"
!addincludedir "${SRCDIR}"
!addplugindir "${BUILD_DIR}"
!include "config.nsi"

# We need StrRep.
!include "StrFunc.nsh"

# The package name and version.  PRETTY_PACKAGE is a user visible name
# only while PACKAGE is useful for filenames etc.  PROD_VERSION is the
# product version and needs to be in the format "MAJ.MIN.MIC.BUILDNR".
# NOTE: Please keep the capitalization of PRETTY_PACKAGE_SHORT as it is
# used as registry key.
!define PACKAGE "${_PACKAGE}-src"
!define PRETTY_PACKAGE "Claws Mail Sources"
!define PRETTY_PACKAGE_SHORT "ClawsMailSrc"
!define VERSION "${_VERSION}"
!define PROD_VERSION "${_BUILD_FILEVERSION}"
!define COMPANY "claws-mail.org"
!define WEBSITE "http://www.claws-mail.org"
!define COPYRIGHT "Copyright (C) 1999-2015 Hiroyuki Yamamoto and the Claws Mail team"
!define DESCRIPTION "Claws Mail for Windows"

!define INSTALL_DIR "Claws Mail\Source"

!define WELCOME_TITLE_STR "$(T_WelcomeTitleGpg4winSrc)"

!define ABOUT_STR "$(T_AboutGpg4winSrc) \
	\r\n\r\n$_CLICK \r\n\r\n\r\n\r\n\r\n \
        $(T_AboutGpg4winSrcVersion) \r\n \
        $(T_AboutGpg4winSrcFileVersion) \r\n\r\n \
        $(T_AboutGpg4winSrcReleaseDate)"

# The copyright license of the package.  Define only one of these.
!define LICENSE_GPL
# !define LICENSE_LGPL


# The installation directory.
!define ipdir "playground/install/pkgs"
!define exipdir "playground/install-ex/pkgs"
!define bpdir "playground/build"

# For source packages we use the standard zip method because it takes
# ages to compress a large archive of already packed sources.
SetCompressor zlib

# Now include the generic parts.
!include "installer.nsi"


# Now include all the sections.
!define SOURCES
!include "inst-sections.nsi"

# The WelcomeTitle is displayed on the first page.
LangString T_WelcomeTitleGpg4winSrc ${LANG_ENGLISH} \
 "Welcome to the installation of the Claws Mail sources"

# The About string as displayed on the first page.
LangString T_AboutGpg4winSrc ${LANG_ENGLISH} \
 "Claws Mail is a installer package for Windows for EMail and \
  file encryption using the core component GnuPG for Windows. \
  Both relevant cryptography standards are supported, OpenPGP \
  and S/MIME. Claws Mail and the software included with Claws Mail \
  are Free Software."

LangString T_AboutGpg4winSrcVersion ${LANG_ENGLISH} \
 "This is Claws Mail version ${VERSION}"

LangString T_AboutGpg4winSrcFileVersion ${LANG_ENGLISH} \
 "file version ${PROD_VERSION}"

LangString T_AboutGpg4winSrcReleaseDate ${LANG_ENGLISH} \
 "release date ${_BUILD_ISODATE}"

# At long last, include all the translations.
!include "../po/catalogs.nsi"

# Now include the generic parts to end the installation.
!include "installer-finish.nsi"
