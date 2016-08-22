# If Claws Mail is already installed, set $INSTDIR from the current
# install location, stored in registry.
# This is needed so that the install directory page offers correct
# value, for people who chose a non-default install location.
#
# This function should be called from .onInit
Function CheckInstallDirectory
	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRETTY_PACKAGE_SHORT}" "InstallLocation"
	IfErrors continue setinstdir
		Abort

	setinstdir:
		StrCpy $INSTDIR $0

	continue:

FunctionEnd

# Check whether Claws Mail has already been installed.  This is called as
# a leave function from the directory page.  A call to abort will get
# back to the directory selection.
#
# TODO: We should read "Software\Microsoft\Windows\CurrentVersion\Uninstall
# \${PRETTY_PACKAGE_SHORT}\InstallLocation" registry key, and read the
# VERSION file from that directory.
# For now, we just check if we're upgrading from 3.12.0, which is considered
# incompatible (different paths, gnupg2 included, etc.), so we'll suggest
# to uninstall that version manually first.
Function CheckExistingVersion
  ClearErrors
  FileOpen $0 "$INSTDIR\VERSION" r
  IfErrors nexttest
  FileRead $0 $R0
  FileRead $0 $R1
  FileClose $0

  Push $R1
#  Call TrimNewLines
  Pop $R1

  # Extract major version.
  StrCpy $0 $R1 4
  StrCmp $0 "3.12" 0 secondtest
    MessageBox MB_YESNO "$(T_FoundGnupg)" IDYES leave
    Abort

 secondtest:
  MessageBox MB_YESNO "$(T_FoundExistingVersion)" IDYES leave
  Abort

 nexttest:
  ClearErrors
  ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRETTY_PACKAGE_SHORT}" "URLInfoAbout"
  IfErrors leave urltest
  	Abort

 urltest:
  StrCmp $0 "http://www.gpg4win.org/" 0 leave
		MessageBox MB_YESNO "$(T_FoundGnupg)" IDYES leave
		Abort

 leave:

# Call UninstallGnupg
FunctionEnd

#Function UninstallGnupg
#	IfFileExists $INSTDIR\gpg2.exe 0 leave
#	MessageBox MB_YESNO "$(T_FoundGnupg)" IDYES uninstall IDNO leave
#	uninstall:
#		!insertmacro SelectSection ${SEC_GnupgUninst}
#	leave:
#FunctionEnd

# Control function for the Custom page to select special
# install options.
# TODO: rewrite to use nsDialogs instead
!include "InstallOptions.nsh"
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

Function CustomPageDefaultClient
	!insertmacro MUI_HEADER_TEXT "$(T_SetDefaultClientHeader)" ""

	!insertmacro MUI_INSTALLOPTIONS_WRITE "installer-setdefaultclient.ini" \
	"Field 1" "Text" "$(T_SetDefaultClient)"

	!insertmacro MUI_INSTALLOPTIONS_DISPLAY "installer-setdefaultclient.ini"
FunctionEnd

# Macro to set "prefix" variable to correct package's install dir.
!macro SetPrefix pkgname
!ifdef prefix
!undef prefix
!endif
!define prefix ${ipdir}/${pkgname}-${cm_pkg_${pkgname}_version}
!macroend

# Macro to set "prefix" variable to correct package's install dir.
# Use this second macro if package name contains a character not
# allowed in a NSIS variable, e.g.:
# !insertmacro SetPrefix2 pkg_name pkg-name
!macro SetPrefix2 pkgname pkgdirname
!ifdef prefix
!undef prefix
!endif
!define prefix ${ipdir}/${pkgdirname}-${cm_pkg_${pkgname}_version}
!macroend

Function .onInstSuccess
  ${MementoSectionSave}
FunctionEnd
