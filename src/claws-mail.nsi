!addincludedir "${TOP_SRCDIR}/po"
!include "config.nsi"

!define PACKAGE "claws-mail"
!define VERSION "${_VERSION}"
!define VERSION_NO_REL "${_VERSION_NO_REL}"
!define GIT_REVISION "${_GIT_REVISION}"
!define PROD_VERSION "${_VERSION_NO_REL}.${_REL}"
!define RELEASE "${_REL}"
!define PRETTY_PACKAGE "Claws Mail"
!define PRETTY_PACKAGE_SHORT "ClawsMail"
!define COMPANY "claws-mail.org"
!define WEBSITE "http://www.claws-mail.org"
!define COPYRIGHT "Copyright (C) 1999-2015 Hiroyuki Yamamoto and the Claws Mail team"
!define DESCRIPTION "Claws Mail for Windows"

# Admin privileges are required for installation
RequestExecutionLevel admin

# Directories where the compiled components are installed
!define ipdir "playground/install/pkgs"
!define bpdir "playground/build"

SetCompressor /SOLID lzma

# We use Memento to remember past installation choices.
!include "Memento.nsh"
!define MEMENTO_REGISTRY_ROOT HKLM
!define MEMENTO_REGISTRY_KEY \
  Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRETTY_PACKAGE_SHORT}

!include "MUI.nsh"

!define MUI_LANGDLL_REGISTRY_ROOT "HKLM"
!define MUI_LANGDLL_REGISTRY_KEY "Software\${PRETTY_PACKAGE_SHORT}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"
!define MUI_LANGDLL_INFO "Please choose a language for the setup."

!include "functions.nsi"

Name "${PRETTY_PACKAGE}"
OutFile "${PACKAGE}-${VERSION_NO_REL}${GIT_REVISION}-${RELEASE}.exe"

!include "x64.nsh"

# Default 32-bit here, we override for 64-bit in .onInit
InstallDir "$PROGRAMFILES\${PRETTY_PACKAGE}"

# Add version information to the file properties.
VIProductVersion "${PROD_VERSION}"
VIAddVersionKey "ProductName" "${PACKAGE} (${VERSION})"
VIAddVersionKey "Comments" \
"${PRETTY_PACKAGE_SHORT} is Free Software; you can redistribute it \
and/or modify it under the terms of the GNU General Public License. \
You should have received a copy of the GNU General Public License \
along with this software; if not, write to the Free Software \
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, \
MA 02110-1301, USA"
VIAddVersionKey "CompanyName" "${COMPANY}"
VIAddVersionKey "LegalTrademarks" ""
VIAddVersionKey "LegalCopyright" "${COPYRIGHT}"
VIAddVersionKey "FileDescription" "${DESCRIPTION}"
VIAddVersionKey "FileVersion" "${PROD_VERSION}"

### Installer interface settings

# Do not automatically jump to the finish page, to allow the user to
# check the install log.
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_UNFINISHPAGE_NOAUTOCLOSE

# Images used
ReserveFile "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-header-install-150x57.bmp"
ReserveFile "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-wizard-install-164x314.bmp"

!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP \
  "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-header-install-150x57.bmp"
!define MUI_HEADERIMAGE_UNBITMAP \
  "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-header-uninstall-150x57.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP \
  "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-wizard-install-164x314.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP \
  "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-wizard-uninstall-164x314.bmp"

# Icons used for installer and uninstaller
!define MUI_ICON "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-install.ico"
!define MUI_UNICON "${TOP_SRCDIR}/doc/logo/claws-mail-nsis-uninstall.ico"

### Welcome page text
!define MUI_WELCOMEPAGE_TITLE "$(T_WelcomePageTitle)"
!define WELCOMEPAGE_TEXT "\
	$(T_About)\r\n\r\n\
	$_CLICK\r\n\r\n\r\n\r\n \
	$(T_AboutVersion)\r\n \
	$(T_AboutFileVersion)\r\n \
	$(T_AboutReleaseDate)"

!define MUI_WELCOMEPAGE_TEXT "${WELCOMEPAGE_TEXT}"

### License page
!insertmacro MUI_PAGE_WELCOME

#!define MUI_LICENSEPAGE_BUTTON "$(^NextBtn)"
!define MUI_PAGE_HEADER_SUBTEXT "$(T_GPLHeader)"
!define MUI_LICENSEPAGE_TEXT_BOTTOM "$(T_GPLShort)"
!insertmacro MUI_PAGE_LICENSE "license.blurb"

### Install directory page
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE CheckExistingVersion
!insertmacro MUI_PAGE_DIRECTORY

Page custom CustomPageOptions

Page custom CustomPageDefaultClient

### Start Menu page
Var STARTMENU_FOLDER
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKLM"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\${PRETTY_PACKAGE_SHORT}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"

!insertmacro MUI_PAGE_STARTMENU Application $STARTMENU_FOLDER

### Install Files page
!insertmacro MUI_PAGE_INSTFILES

### Finish page
!define MUI_FINISHPAGE_LINK "$(T_MoreInfo)"
!define MUI_FINISHPAGE_LINK_LOCATION "${WEBSITE}"
!insertmacro MUI_PAGE_FINISH

### Uninstaller pages
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

### Language support.  This has to be done after defining the pages, but
### before defining the translation strings.  Confusing.
!insertmacro MUI_LANGUAGE "English"
#!define PO_HEADER
#!include "../po/catalogs.nsi"
#!undef PO_HEADER

#!insertmacro MUI_RESERVEFILE_LANGDLL
#!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

!include "sections-installer.nsi"

!include "sections-uninstaller.nsi"

### Last, include the strings
# ...first English...
!include "strings.nsi"
# ...then for all other languages
#!include "../po/catalogs.nsi"

Function .onInit
	${If} ${RunningX64}
		SetRegView 64
		StrCpy $INSTDIR "$PROGRAMFILES64\AppName"
	${EndIf}

  SetOutPath $TEMP

	StrCpy $LANGUAGE ${LANG_ENGLISH}
#	!define MUI_LANGDLL_ALWAYSSHOW
#  !insertmacro MUI_LANGDLL_DISPLAY

  # We can't use TOP_SRCDIR dir as the name of the file needs to be
  # the same while building and running the installer.  Thus we
  # generate the file from a template.
	ReserveFile "installer-options.ini"
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "installer-options.ini"
	ReserveFile "installer-setdefaultclient.ini"
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "installer-setdefaultclient.ini"

  ${MementoSectionRestore}
FunctionEnd

