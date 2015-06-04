# gpg4win.nsi - Installer for GnuPG 4 Windows.        -*- coding: latin-1; -*-
# Copyright (C) 2005, 2007, 2008 g10 Code GmbH
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
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA

!cd "${BUILD_DIR}"
!addincludedir "${TOP_SRCDIR}"
!addincludedir "${TOP_SRCDIR}/po"
!addincludedir "${SRCDIR}"
!addplugindir "${BUILD_DIR}"
!include "config.nsi"

# The package name and version.  PRETTY_PACKAGE is a user visible name
# only while PACKAGE is useful for filenames etc.  PROD_VERSION is the
# product version and needs to be in the format "MAJ.MIN.MIC.BUILDNR".
# NOTE: Please keep the capitalization of PRETTY_PACKAGE_SHORT as it is
# used as registry key.
!define PACKAGE "${_PACKAGE}"
!define PRETTY_PACKAGE "Claws Mail"
!define PRETTY_PACKAGE_SHORT "ClawsMail"
!define VERSION "${_VERSION}"
!define PROD_VERSION "${_BUILD_FILEVERSION}"
!define COMPANY "claws-mail.org"
!define WEBSITE "http://www.claws-mail.org"
!define COPYRIGHT "Copyright (C) 1999-2015 Hiroyuki Yamamoto and the Claws Mail team"
!define DESCRIPTION "Claws Mail for Windows"

!define INSTALL_DIR "Claws Mail"

!define WELCOME_TITLE_STR "$(T_WelcomeTitleGpg4win)"

!define ABOUT_STR "$(T_AboutGpg4win) \
	\r\n\r\n$_CLICK \r\n\r\n\r\n\r\n\r\n \
	$(T_AboutGpg4winVersion) \r\n \
        $(T_AboutGpg4winFileVersion) \r\n\r\n \
	$(T_AboutGpg4winReleaseDate)"

# The copyright license of the package.  Define only one of these.
!define LICENSE_GPL
# !define LICENSE_LGPL


# Define this if we require an NSIS running on Windows.  This is
# necessary if you want to handle DLLs properly.
# !define REQUIRE_W32_NSIS


# Define if in debug mode.
!ifdef GPG4WIN_DEBUG
!define DEBUG
!endif

# Most of the included software has implicit requirements for at least
# NT4 if not even higher.  To be sure require at least Windows XP.
# Fixme: Enable if we have makensis 2.50
#TargetMinimalOS 5.1

# Admin privileges are required for installation
RequestExecutionLevel admin

# The installation directory.
!define ipdir "playground/install/pkgs"
!define exipdir "playground/install/pkgs"
!define bpdir "playground/build"

# Select the best compression algorithm available.  The dictionary
# size is the default (8 MB).
!ifndef DISABLE_LZMA
!ifndef SOURCES
SetCompressor /SOLID lzma
# SetCompressorDictSize 8
!endif
!endif

# Now include the generic parts.
!define HAVE_STARTMENU
!include "installer.nsi"


# Now include the sections.
!define BINARIES
!include "inst-sections.nsi"

# The WelcomeTitle is displayed on the first page.
LangString T_WelcomeTitleGpg4win ${LANG_ENGLISH} \
  "Welcome to the installation of Claws Mail"

# The About string as displayed on the first page.
LangString T_AboutGpg4win ${LANG_ENGLISH} \
 "Claws Mail is an email client (and news reader), based on GTK+, featuring\r\n\
    Quick response\r\n\
    Graceful, and sophisticated interface\r\n\
    Easy configuration, intuitive operation\r\n\
    Abundant features\r\n\
    Extensibility\r\n\
    Robustness and stability.\r\n\
It is Free Software, released under the GNU GPL v3 or later."

LangString T_AboutGpg4winVersion ${LANG_ENGLISH} \
 "This is Claws Mail version ${VERSION}"

LangString T_AboutGpg4winFileVersion ${LANG_ENGLISH} \
 "file version ${PROD_VERSION}"

LangString T_AboutGpg4winReleaseDate ${LANG_ENGLISH} \
 "release date ${_BUILD_ISODATE}"

# At long last, include all the translations.
!include "../po/catalogs.nsi"

# Now include the generic parts to end the installation.
!include "installer-finish.nsi"
