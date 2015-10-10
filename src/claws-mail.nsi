!addincludedir "${TOP_SRCDIR}/po"
!include "config.nsi"

!define PACKAGE "${_PACKAGE}"
!define VERSION "${_VERSION}"
!define PROD_VERSION "${_BUILD_FILEVERSION}.${_REL}"
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

!include "functions.nsi"

Name "${PRETTY_PACKAGE}"
OutFile "${PACKAGE}-${VERSION}-${RELEASE}.exe"

# Add version information to the file properties.
InstallDir "$PROGRAMFILES\${PRETTY_PACKAGE}"
VIProductVersion "${VERSION}.${RELEASE}"
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
#!insertmacro MUI_UNPAGE_WELCOME
#!insertmacro MUI_UNPAGE_CONFIRM
#!insertmacro MUI_UNPAGE_INSTFILES
#!insertmacro MUI_UNPAGE_FINISH

### Language support.  This has to be done after defining the pages, but
### before defining the translation strings.  Confusing.
!insertmacro MUI_LANGUAGE "English"
!define PO_HEADER
!include "../po/catalogs.nsi"
!undef PO_HEADER

!include "sections-installer.nsi"

!include "sections-uninstaller.nsi"

# Last, include the strings
!include "strings.nsi"

