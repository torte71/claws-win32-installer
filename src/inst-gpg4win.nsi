# inst-gpg4win.nsi - Hidden section for common files. -*- coding: latin-1; -*-
# Copyright (C) 2006 g10 Code GmbH
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


# This is the very first section installed.
Section "-gpg4win" SEC_gpg4win
!ifdef SOURCES
  SetOutPath "$INSTDIR"
  File "${BUILD_DIR}/../claws-mail-${VERSION}.tar.bz2"
!else
  SetOutPath "$INSTDIR\share\gpg4win"

  File "${BUILD_DIR}/versioninfo.txt"

  # Write a version file.
  DetailPrint "Opening VERSION file for writing"
  FileOpen $0 "$INSTDIR\VERSION" w
  FileWrite $0 "${PACKAGE}$\r$\n"
  FileWrite $0 "${VERSION}$\r$\n"
  FileClose $0
  DetailPrint "VERSION closed"

  # Register the install directory for the GnuPG suite.
  WriteRegStr HKLM "Software\GNU\Claws Mail" "Install Directory" $INSTDIR
  DetailPrint "Saved install directory in the registry"

  # Also write it to be recalled on new installation.  Currently
  # disabled.
  # WriteRegStr HKLM "Software\GNU\${PRETTY_PACKAGE_SHORT}" "Install Directory" $INSTDIR

  # We used to determine the language using a Registry entry.
  # Although we don't want to delete the user's Lang Registry Setting
  # because he might have have selected a different language than his
  # default.  We delete the global Lang of the installation.
  DeleteRegValue HKLM "Software\GNU\Claws Mail" "Lang"
  DetailPrint "Deleted obsolete Lang entry"

  # This old key is required for GPGee.  Please do not use in new
  # applications.
  # Note: We don't use it anymore so that gpgme decides what gpg to use
  #       For the new gpg4win we actually use gpg2.exe.
  #       To cope with old installations we actually remove this value.
  #       However we can only remove the HKLM version not those set by
  #       the user under HKCU.
  #WriteRegStr HKLM "Software\GNU\Claws Mail" "gpgProgram" "$INSTDIR\gpg.exe"
  DeleteRegValue HKLM "Software\GNU\Claws Mail" "gpgProgram"
  DetailPrint "Deleted obsolete gpgProgram value"

  # Add the public directory to the PATH
  Push "$INSTDIR\pub"
  Call AddToPath
  DetailPrint "Added pub directory to PATH"

  # Install gpg4win included tools
  SetOutPath "$INSTDIR"
  File "${BUILD_DIR}/sha1sum.exe"
  File "${BUILD_DIR}/sha256sum.exe"
  File "${BUILD_DIR}/md5sum.exe"
  File "${BUILD_DIR}/mkportable.exe"

  SetOutPath "$INSTDIR\pub"
  # Install the mingw32 runtime libraries.  They are stored in the
  # build directory with a different suffix, so that makensis does not
  # list sumbol names.
  File /oname=libstdc++-6.dll     "${BUILD_DIR}/libstdc++-6.dll-x"
  File /oname=libgcc_s_sjlj-1.dll "${BUILD_DIR}/libgcc_s_sjlj-1.dll-x"
  File /oname=libwinpthread-1.dll "${BUILD_DIR}/libwinpthread-1.dll-x"

!endif

SectionEnd
