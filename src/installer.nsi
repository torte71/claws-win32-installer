# installer.nsi - Installer for GnuPG 4 Windows.    -*- coding: latin-1; -*-
# Copyright (C) 2005, 2007 g10 Code GmbH
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

# No servicable parts beyond this line.  Stay clear :)

!ifdef REQUIRE_W32_NSIS
!ifdef PACKAGE_LIBRARY
!include "Library.nsh"
!endif
!else
!macro InstallLib libtype shared install localfile destfile tempbasedir
  File "${localfile}"
!macroend
!endif

!include "WinMessages.nsh"

# Define for the registry key to change the environment.  The
# commented one may be used if the setting should affect only the
# current user.
!define Regkey_for_Env \
    'HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"'
# !define Regkey_for_Env 'HKCU "Environment"'


# We use Memento to remember past installation choices.
!include Memento.nsh
!define MEMENTO_REGISTRY_ROOT HKLM
!define MEMENTO_REGISTRY_KEY \
  Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRETTY_PACKAGE_SHORT}


# We use the modern UI.
!include "MUI.nsh"

# We need to know wether we are installing to 64 bit.
!include "x64.nsh"

# Set the package name.  Note that this name should not be sufficed
#  with the version because this would get displayed in the start menu.
Name "${PRETTY_PACKAGE}"


OutFile "${PACKAGE}-${VERSION}-${_REL}.exe"

# Set the installation directory.
!ifndef INSTALL_DIR
!define INSTALL_DIR "${PACKAGE}"
!endif
InstallDir "$PROGRAMFILES\GNU\${INSTALL_DIR}"


# Add version information to the file properties.
VIProductVersion "${PROD_VERSION}.${REL}"
VIAddVersionKey "ProductName" "${PRETTY_PACKAGE_SHORT} (${VERSION})"
!ifdef LICENSE_GPL
VIAddVersionKey "Comments" \
   "${PRETTY_PACKAGE_SHORT} is Free Software; you can redistribute it  \
    and/or modify it under the terms of the GNU General Public License.  \
    You should have received a copy of the GNU General Public License  \
    along with this software; if not, write to the Free Software  \
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,  \
    MA 02110-1301, USA"
!else
VIAddVersionKey "Comments" \
   "${PRETTY_PACKAGE_SHORT} is Free Software; you can redistribute it  \
    and/or modify it under the terms of the GNU Lesser General Public  \
    License. You should have received a copy of the GNU Lesser General  \
    Public License along with this software; if not, write to the Free  \
    Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,  \
    MA 02110-1301, USA"
!endif
VIAddVersionKey "CompanyName" "${COMPANY}"
VIAddVersionKey "LegalTrademarks" ""
VIAddVersionKey "LegalCopyright" "${COPYRIGHT}"
VIAddVersionKey "FileDescription" "${DESCRIPTION}"
VIAddVersionKey "FileVersion" "${PROD_VERSION}"

# Interface Settings

# !define MUI_ABORTWARNING
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_UNFINISHPAGE_NOAUTOCLOSE

!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP \
  "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-header-install-150x57.bmp"
!define MUI_HEADERIMAGE_UNBITMAP \
  "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-header-uninstall-150x57.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP \
  "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-wizard-install-164x314.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP \
  "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-wizard-uninstall-164x314.bmp"
!define MUI_ICON "${TOP_SRCDIR}/doc/logo/gpg4win-nsis-install.ico"
!define MUI_UNICON "${TOP_SRCDIR}/doc/logo/gpg4win-nsis-uninstall.ico"

# Remember the installer language

!define MUI_LANGDLL_REGISTRY_ROOT "HKLM"
!define MUI_LANGDLL_REGISTRY_KEY "Software\GNU\${PRETTY_PACKAGE_SHORT}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"

# No Umlaute, please!
!define MUI_LANGDLL_INFO "Please choose a language for the setup."

# The list of wizard pages.

!define MUI_WELCOMEPAGE_TITLE "${WELCOME_TITLE_STR}"
!define MUI_WELCOMEPAGE_TEXT "${ABOUT_STR}"

!insertmacro MUI_PAGE_WELCOME

!define MUI_LICENSEPAGE_BUTTON "$(^NextBtn)"
!define MUI_PAGE_HEADER_SUBTEXT "$(T_GPLHeader)"
!define MUI_LICENSEPAGE_TEXT_BOTTOM "$(T_GPLShort)"
!insertmacro MUI_PAGE_LICENSE "license.blurb"

!define MUI_PAGE_CUSTOMFUNCTION_SHOW PrintNonAdminWarning
#!insertmacro MUI_PAGE_COMPONENTS

!define MUI_PAGE_CUSTOMFUNCTION_LEAVE CheckExistingVersion
!insertmacro MUI_PAGE_DIRECTORY

!ifdef HAVE_STARTMENU

Page custom CustomPageOptions

Var STARTMENU_FOLDER

!define MUI_PAGE_CUSTOMFUNCTION_PRE CheckIfStartMenuWanted
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKLM"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\GNU\${PRETTY_PACKAGE_SHORT}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"

!insertmacro MUI_PAGE_STARTMENU Application $STARTMENU_FOLDER

!endif

!insertmacro MUI_PAGE_INSTFILES

# Finish page
#!define MUI_FINISHPAGE_RUN
#!define MUI_FINISHPAGE_RUN_FUNCTION RunOnFinish
#!define MUI_FINISHPAGE_RUN_TEXT "$(T_RunKeyManager)"
#!define MUI_FINISHPAGE_RUN_NOTCHECKED
!define MUI_FINISHPAGE_LINK "$(T_MoreInfo)"
!define MUI_FINISHPAGE_LINK_LOCATION "$(T_MoreInfoURL)"
!insertmacro MUI_PAGE_FINISH


# Uninstaller pages.

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

#Page license
#Page components
#Page directory
#Page instfiles
#UninstPage uninstConfirm
#UninstPage instfiles


# Language support.  This has to be done after defining the pages, but
# before defining the translation strings.  Confusing.

# Enable this to not filter languages for the current code page.  Note
# that languages which are then not filtered out may not be displayed
# correctly in the Windows version the user is using.  Not recommended,
# but can be useful for testing.
!ifdef DEBUG
!define MUI_LANGDLL_ALLLANGUAGES
!endif

!insertmacro MUI_LANGUAGE "English"
!define PO_HEADER
!include "../po/catalogs.nsi"
!undef PO_HEADER

!ifdef SOURCES
ReserveFile "${TOP_SRCDIR}\doc\logo\gpg4win-logo-400px.bmp"
!endif
ReserveFile "${TOP_SRCDIR}\COPYING"
ReserveFile "installer-options.ini"
ReserveFile "${TOP_SRCDIR}\doc\logo\claws-mail-nsis-wizard-install-164x314.bmp"

# Language support

LangString T_LangCode ${LANG_ENGLISH} "en"

# Startup page
LangString T_GPLHeader ${LANG_ENGLISH} \
  "This software is licensed under the terms of the GNU General Public \
   License (GPL)."

LangString T_GPLShort ${LANG_ENGLISH} \
  "In short: You are allowed to run this software for any purpose. \
   You may distribute it as long as you give the recipients the same \
   rights you have received."

LangString T_RunKeyManager ${LANG_ENGLISH} \
   "Run the key manager"

LangString T_MoreInfo ${LANG_ENGLISH} \
   "Click here for the project's homepage"
LangString T_MoreInfoURL ${LANG_ENGLISH} "${WEBSITE}"

LangString T_NoKeyManager ${LANG_ENGLISH} \
   "No key manager has been installed, thus we can't run one now."

# Used as subdirectory name in Start Menu.

LangString DESC_Menu_manuals ${LANG_ENGLISH} \
   "Documentation"

LangString DESC_Menu_uninstall ${LANG_ENGLISH} \
   "Uninstall"

# Used as subdirectory name on Desktop.
LangString DESC_Desktop_manuals ${LANG_ENGLISH} \
   "Gpg4win Documentation"


# Functions

#
# Control function for the Custom page to select special
# install options.
#
Function CustomPageOptions
  !insertmacro MUI_HEADER_TEXT "$(T_InstallOptions)" "$(T_InstallOptLinks)"

  # Note that the default selection is done in the ini file.
  !insertmacro MUI_INSTALLOPTIONS_WRITE "installer-options.ini" \
	"Field 1" "Text"  "$(T_InstOptLabelA)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "installer-options.ini" \
	"Field 2" "Text"  "$(T_InstOptFieldA)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "installer-options.ini" \
	"Field 3" "Text"  "$(T_InstOptFieldB)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "installer-options.ini" \
	"Field 4" "Text"  "$(T_InstOptFieldC)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "installer-options.ini" \
	"Field 5" "Text"  "$(T_InstOptLabelB)"

  !insertmacro MUI_INSTALLOPTIONS_DISPLAY "installer-options.ini"
FunctionEnd

# Check whether gpg4win has already been installed.  This is called as
# a leave function from the directory page.  A call to abort will get
# back to the directory selection.
Function CheckExistingVersion
  ClearErrors
  FileOpen $0 "$INSTDIR\VERSION" r
  IfErrors nexttest
  FileRead $0 $R0
  FileRead $0 $R1
  FileClose $0

  Push $R1
  Call TrimNewLines
  Pop $R1

  # Extract major version.
  StrCpy $0 $R1 2
  StrCmp $0 "1." 0 secondtest
    MessageBox MB_YESNO "$(T_FoundExistingOldVersion)" IDYES leave
    Abort

 secondtest:
  MessageBox MB_YESNO "$(T_FoundExistingVersion)" IDYES leave
  Abort

 nexttest:
  ClearErrors
  ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRETTY_PACKAGE_SHORT}" "DisplayVersion"
  IfErrors leave 0
     MessageBox MB_YESNO "$(T_FoundExistingVersionB)" IDYES leave
     Abort

 leave:
FunctionEnd

# PrintNonAdminWarning

# Check whether the current user is in the Administrator group or an
# OS version without the need for an Administrator is in use.  Print a
# diagnostic if this is not the case and abort installation.
Function PrintNonAdminWarning

  ClearErrors
  UserInfo::GetName
  IfErrors leave
  Pop $0
  UserInfo::GetAccountType
  Pop $1
  StrCmp $1 "Admin" leave +1
  MessageBox MB_OK "$(T_AdminNeeded)"
  Quit

 leave:
FunctionEnd


# Check whether the start menu is actually wanted.

Function CheckIfStartMenuWanted
  !insertmacro MUI_INSTALLOPTIONS_READ $R0 "installer-options.ini" \
	"Field 2" "State"
  IntCmp $R0 1 +2
    Abort
FunctionEnd


#-----------------------------------------------
# Strings pertaining to the install options page
#-----------------------------------------------

# Installation options title
LangString T_InstallOptions ${LANG_ENGLISH} "Install Options"

# Installation options subtitle 1
LangString T_InstallOptLinks ${LANG_ENGLISH} "Start links"

LangString T_InstOptLabelA  ${LANG_ENGLISH} \
     "Please select where Claws Mail shall install links:"

LangString T_InstOptLabelB  ${LANG_ENGLISH} \
     "(Only programs will be linked into the quick launch bar.)"

LangString T_InstOptFieldA  ${LANG_ENGLISH} \
     "Start Menu"

LangString T_InstOptFieldB  ${LANG_ENGLISH} \
     "Desktop"

LangString T_InstOptFieldC  ${LANG_ENGLISH} \
     "Quick Launch Bar"

#------------------------------------------------
# String pertaining to the existing version check
#------------------------------------------------
LangString T_FoundExistingVersion ${LANG_ENGLISH} \
     "Version $R1 has already been installed.  $\r$\n\
      Do you want to overwrite it with version ${VERSION}?"
LangString T_FoundExistingOldVersion ${LANG_ENGLISH} \
     "An old version $R1 has already been installed.  It is \
      strongly recommended to deinstall previous versions on \
      major upgrades. $\r$\n\
      Do you want to continue installing Claws Mail ${VERSION} anyway?"
LangString T_FoundExistingVersionB ${LANG_ENGLISH} \
     "A version of Claws Mail has already been installed on the system. \
      There will be no problem installing and thus overwriting this \
      Version. $\r$\n\
       $\r$\n\
      Do you want to continue installing Claws Mail?"


#---------------------------------------------
# From the old installation checking functions
#---------------------------------------------

# From Function PrintNonAdminWarning
LangString T_AdminNeeded ${LANG_ENGLISH} \
   "Warning: Administrator permissions required for a successful installation"

# FIXME: The GetAfterChar function comes from the NSIS wiki.
Function un.GetAfterChar
  Exch $0 ; chop char
  Exch
  Exch $1 ; input string
  Push $2
  Push $3
  StrCpy $2 0
  loop:
    IntOp $2 $2 - 1
    StrCpy $3 $1 1 $2
    StrCmp $3 "" 0 +3
      StrCpy $0 ""
      Goto exit2
    StrCmp $3 $0 exit1
    Goto loop
  exit1:
    IntOp $2 $2 + 1
    StrCpy $0 $1 "" $2
  exit2:
    Pop $3
    Pop $2
    Pop $1
    Exch $0 ; output
FunctionEnd


Function un.SourceDelete
  Push "/"
  Call un.GetAfterChar
  Pop $R0
  Delete "$INSTDIR\$R0"
FunctionEnd


# StrStr  - taken from the NSIS reference
# input, top of stack = string to search for
#        top of stack-1 = string to search in
# output, top of stack (replaces with the portion of the string remaining)
# modifies no other variables.
#
# Usage:
#   Push "this is a long ass string"
#   Push "ass"
#   Call StrStr
#   Pop $R0
#  ($R0 at this point is "ass string")
#
!macro StrStr un
Function ${un}StrStr
   Exch $R1 # st=haystack,old$R1, $R1=needle
   Exch     # st=old$R1,haystack
   Exch $R2 # st=old$R1,old$R2, $R2=haystack
   Push $R3
   Push $R4
   Push $R5
   StrLen $R3 $R1
   StrCpy $R4 0
   # $R1=needle
   # $R2=haystack
   # $R3=len(needle)
   # $R4=cnt
   # $R5=tmp
   loop:
     StrCpy $R5 $R2 $R3 $R4
     StrCmp $R5 $R1 done
     StrCmp $R5 "" done
     IntOp $R4 $R4 + 1
     Goto loop
 done:
   StrCpy $R1 $R2 "" $R4
   Pop $R5
   Pop $R4
   Pop $R3
   Pop $R2
   Exch $R1
FunctionEnd
!macroend
!insertmacro StrStr ""
!insertmacro StrStr "un."


# TrimNewlines  - taken from the NSIS reference
# input, top of stack  (e.g. whatever$\r$\n)
# output, top of stack (replaces, with e.g. whatever)
# modifies no other variables.
Function TrimNewlines
   Exch $R0
   Push $R1
   Push $R2
   StrCpy $R1 0

 loop:
   IntOp $R1 $R1 - 1
   StrCpy $R2 $R0 1 $R1
   StrCmp $R2 "$\r" loop
   StrCmp $R2 "$\n" loop
   IntOp $R1 $R1 + 1
   IntCmp $R1 0 no_trim_needed
   StrCpy $R0 $R0 $R1

 no_trim_needed:
   Pop $R2
   Pop $R1
   Exch $R0
FunctionEnd


# RemoveFromPath - Remove a given dir from the path
#     Input: head of the stack
Function un.RemoveFromPath
  Exch $0
  g4wihelp::path_remove "$0"
  StrCmp $R5 "0" remove_from_path_done
  SendMessage ${HWND_BROADCAST} ${WM_WININICHANGE} 0 "STR:Environment" /TIMEOUT=5000
  remove_from_path_done:
  Pop $0
FunctionEnd


