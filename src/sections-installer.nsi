### Start of the installer section
${MementoSection} "-Claws-Mail" SEC_claws_mail

SetOutPath "$INSTDIR"

# Install the mingw32 runtime libraries.  They are stored in the
# build directory with a different suffix, so that makensis does not
# list sumbol names.
File /oname=libstdc++-6.dll     "${BUILD_DIR}/libstdc++-6.dll-x"
File /oname=libgcc_s_sjlj-1.dll "${BUILD_DIR}/libgcc_s_sjlj-1.dll-x"
File /oname=libwinpthread-1.dll "${BUILD_DIR}/libwinpthread-1.dll-x"

### Now install files for each software component

#######################################
### bzip2
# Nothing to install, as we link statically

#######################################
### crypt
# Nothing to install, as we link statically

#######################################
### libgsasl
!insertmacro SetPrefix libgsasl
File ${prefix}/bin/libgsasl-7.dll

#######################################
### libiconv
!insertmacro SetPrefix libiconv
ClearErrors
SetOverwrite try
File "${prefix}/bin/libiconv-2.dll"
SetOverwrite on
ifErrors 0 +3
	File /oname=libiconv-2.dll.tmp "${prefix}/bin/libiconv-2.dll"
	Rename /REBOOTOK libiconv-2.dll.tmp libiconv-2.dll

SetOutPath "$INSTDIR\lib"
File "${prefix}/lib/charset.alias"
SetOutPath "$INSTDIR"

#######################################
### libtasn1
!insertmacro SetPrefix libtasn1
File ${prefix}/bin/libtasn1-6.dll

#######################################
### pkgconfig
# Nothing here.

#######################################
### regex
!insertmacro SetPrefix regex
File ${prefix}/bin/libregex-1.dll

#######################################
### w32pth
!insertmacro SetPrefix w32pth
ClearErrors
SetOverwrite try
File "${prefix}/bin/libw32pth-0.dll"
SetOverwrite lastused
ifErrors 0 +3
	File /oname=libw32pth-0.dll.tmp "${prefix}/bin/libw32pth-0.dll"
	Rename /REBOOTOK libw32pth-0.dll.tmp libw32pth-0.dll

#######################################
### zlib
!insertmacro SetPrefix zlib
File ${prefix}/bin/zlib1.dll

#######################################
### bsfilter
!insertmacro SetPrefix bsfilter
File ${prefix}/bin/bsfilterw.exe
File ${prefix}/bin/bsfilter.exe

#######################################
### gettext
!insertmacro SetPrefix gettext
File ${prefix}/bin/libintl-8.dll
File /oname=intl.dll ${prefix}/bin/libintl-8.dll

#######################################
### libpng
!insertmacro SetPrefix libpng
File ${prefix}/bin/libpng14-14.dll

#######################################
### enchant
!insertmacro SetPrefix enchant
File ${prefix}/bin/libenchant-1.dll
SetOutPath "$INSTDIR\lib\enchant"
File ${prefix}/lib/enchant/libenchant_myspell.dll

SetShellVarContext all
SetOutPath "$INSTDIR\share\enchant\myspell"
File dictionaries/en_US.aff
File dictionaries/en_US.dic
File dictionaries/de.aff
File dictionaries/de.dic
File dictionaries/fr.aff
File dictionaries/fr.dic
SetOutPath "$INSTDIR"

#######################################
### libetpan
!insertmacro SetPrefix libetpan
File ${prefix}/bin/libetpan-17.dll

#######################################
### libassuan
!insertmacro SetPrefix libassuan
ClearErrors
SetOverwrite try
File "${prefix}/bin/libassuan-0.dll"
SetOverwrite lastused
ifErrors 0 +3
	File /oname=libassuan-0.dll.tmp "${prefix}/bin/libassuan-0.dll"
	Rename /REBOOTOK libassuan-0.dll.tmp libassuan-0.dll

SetOutPath "$INSTDIR\lib"
File /oname=libgpg-assuan.imp "${prefix}/lib/libassuan.dll.a"

SetOutPath "$INSTDIR\include"
File "${prefix}/include/assuan.h"

SetOutPath "$INSTDIR"

#######################################
### libgpg-error
!insertmacro SetPrefix2 libgpg_error libgpg-error
ClearErrors
SetOverwrite try
File "${prefix}/bin/libgpg-error-0.dll"
SetOverwrite lastused
ifErrors 0 +3
	File /oname=libgpg-error-0.dll.tmp "${prefix}/bin/libgpg-error-0.dll"
	Rename /REBOOTOK libgpg-error-0.dll.tmp libgpg-error-0.dll

SetOutPath "$INSTDIR\share\locale\de\LC_MESSAGES"
File ${prefix}/share/locale/de/LC_MESSAGES/libgpg-error.mo
SetOutPath "$INSTDIR\share\locale\pl\LC_MESSAGES"
File ${prefix}/share/locale/pl/LC_MESSAGES/libgpg-error.mo
SetOutPath "$INSTDIR\share\locale\ro\LC_MESSAGES"
File ${prefix}/share/locale/ro/LC_MESSAGES/libgpg-error.mo
SetOutPath "$INSTDIR\share\locale\fr\LC_MESSAGES"
File ${prefix}/share/locale/fr/LC_MESSAGES/libgpg-error.mo

SetOutPath "$INSTDIR"
File ${prefix}/bin/gpg-error.exe

SetOutPath "$INSTDIR\lib"
File /oname=libgpg-error.imp "${prefix}/lib/libgpg-error.dll.a"

SetOutPath "$INSTDIR\include"
File "${prefix}/include/gpg-error.h"

SetOutPath "$INSTDIR"

#######################################
### libffi
!insertmacro SetPrefix libffi
File ${prefix}/bin/libffi-6.dll

#######################################
### glib
!insertmacro SetPrefix glib
File ${prefix}/bin/gspawn-win32-helper.exe
File ${prefix}/bin/gspawn-win32-helper-console.exe
File ${prefix}/bin/libglib-2.0-0.dll
File ${prefix}/bin/libgmodule-2.0-0.dll
File ${prefix}/bin/libgobject-2.0-0.dll
File ${prefix}/bin/libgthread-2.0-0.dll
File ${prefix}/bin/libgio-2.0-0.dll

File ${prefix}/bin/gdbus.exe
File ${prefix}/bin/gio-querymodules.exe
File ${prefix}/bin/glib-compile-resources.exe
File ${prefix}/bin/glib-compile-schemas.exe
File ${prefix}/bin/glib-genmarshal.exe
File ${prefix}/bin/gobject-query.exe
File ${prefix}/bin/gresource.exe
File ${prefix}/bin/gsettings.exe
File ${prefix}/bin/gspawn-win32-helper-console.exe
File ${prefix}/bin/gspawn-win32-helper.exe

SetOutPath "$INSTDIR\share\glib-2.0\schemas"
File ${prefix}/share/glib-2.0/schemas/gschema.dtd

SetOutPath "$INSTDIR\share\locale\de\LC_MESSAGES"
File ${prefix}/share/locale/de/LC_MESSAGES/glib20.mo

SetOutPath "$INSTDIR\share\locale\ar\LC_MESSAGES"
File ${prefix}/share/locale/ar/LC_MESSAGES/glib20.mo

SetOutPath "$INSTDIR\share\locale\es\LC_MESSAGES"
File ${prefix}/share/locale/es/LC_MESSAGES/glib20.mo

SetOutPath "$INSTDIR\share\locale\fr\LC_MESSAGES"
File ${prefix}/share/locale/fr/LC_MESSAGES/glib20.mo

SetOutPath "$INSTDIR\share\locale\ru\LC_MESSAGES"
File ${prefix}/share/locale/ru/LC_MESSAGES/glib20.mo

SetOutPath "$INSTDIR"

#######################################
### libgcrypt
!insertmacro SetPrefix libgcrypt
ClearErrors
SetOverwrite try
File "${prefix}/bin/libgcrypt-20.dll"
SetOverwrite lastused
ifErrors 0 +3
	File /oname=libgcrypt-20.dll.tmp "${prefix}/bin/libgcrypt-20.dll"
	Rename /REBOOTOK libgcrypt-20.dll.tmp libgcrypt-20.dll

SetOutPath "$INSTDIR\lib"
File /oname=libgcrypt.imp "${prefix}/lib/libgcrypt.dll.a"

SetOutPath "$INSTDIR\include"
File "${prefix}/include/gcrypt.h"

SetOutPath "$INSTDIR"

#######################################
### expat
!insertmacro SetPrefix expat
File ${prefix}/bin/libexpat-1.dll

#######################################
### freetype
!insertmacro SetPrefix freetype
File ${prefix}/bin/libfreetype-6.dll

#######################################
### fontconfig
!insertmacro SetPrefix fontconfig
SetOutPath "$INSTDIR\etc\fonts"
File ${prefix}/etc/fonts/fonts.conf

SetOutPath "$INSTDIR"
File ${prefix}/bin/libfontconfig-1.dll

#######################################
### pixman
!insertmacro SetPrefix pixman
File ${prefix}/bin/libpixman-1-0.dll

#######################################
### cairo
!insertmacro SetPrefix cairo
File ${prefix}/bin/libcairo-2.dll
File ${prefix}/bin/libcairo-gobject-2.dll
File ${prefix}/bin/libcairo-script-interpreter-2.dll

#######################################
### harfbuzz
!insertmacro SetPrefix harfbuzz
File ${prefix}/bin/libharfbuzz-0.dll

#######################################
### pango
!insertmacro SetPrefix pango
File ${prefix}/bin/libpango-1.0-0.dll
File ${prefix}/bin/libpangoft2-1.0-0.dll
File ${prefix}/bin/libpangowin32-1.0-0.dll
File ${prefix}/bin/libpangocairo-1.0-0.dll

#######################################
### atk
!insertmacro SetPrefix atk
File ${prefix}/bin/libatk-1.0-0.dll

SetOutPath "$INSTDIR\share\locale\de\LC_MESSAGES"
File ${prefix}/share/locale/de/LC_MESSAGES/atk10.mo

SetOutPath "$INSTDIR\share\locale\ar\LC_MESSAGES"
File ${prefix}/share/locale/ar/LC_MESSAGES/atk10.mo

SetOutPath "$INSTDIR\share\locale\es\LC_MESSAGES"
File ${prefix}/share/locale/es/LC_MESSAGES/atk10.mo

SetOutPath "$INSTDIR\share\locale\fr\LC_MESSAGES"
File ${prefix}/share/locale/fr/LC_MESSAGES/atk10.mo

SetOutPath "$INSTDIR\share\locale\ru\LC_MESSAGES"
File ${prefix}/share/locale/ru/LC_MESSAGES/atk10.mo

SetOutPath "$INSTDIR"

#######################################
### gdk-pixbuf
!insertmacro SetPrefix2 gdk_pixbuf gdk-pixbuf
File ${prefix}/bin/libgdk_pixbuf-2.0-0.dll
File ${prefix}/bin/gdk-pixbuf-query-loaders.exe
File ${prefix}/bin/gdk-pixbuf-pixdata.exe

#######################################
### gtk+
!insertmacro SetPrefix2 gtk_ gtk+
File ${prefix}/bin/libgdk-win32-2.0-0.dll
File ${prefix}/bin/libgtk-win32-2.0-0.dll

File ${prefix}/bin/libgailutil-18.dll
File ${prefix}/bin/gtk-query-immodules-2.0.exe

File ${prefix}/bin/gtk-update-icon-cache.exe

SetOutPath "$INSTDIR\etc\gtk-2.0"
File ${prefix}/etc/gtk-2.0/im-multipress.conf

SetOutPath "$INSTDIR\lib\gtk-2.0\2.10.0\engines"
File ${prefix}/lib/gtk-2.0/2.10.0/engines/libpixmap.dll
File ${prefix}/lib/gtk-2.0/2.10.0/engines/libwimp.dll

#  SetOutPath "$INSTDIR\lib\gtk-2.0\2.10.0\immodules"
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-am-et.dll
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-thai.dll
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-multipress.dll
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-ti-er.dll
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-cedilla.dll
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-ti-et.dll
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-ime.dll
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-inuktitut.dll
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-ipa.dll
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-viqr.dll
#  File ${prefix}/lib/gtk-2.0/2.10.0/immodules/im-cyrillic-translit.dll

SetOutPath "$INSTDIR\lib\gtk-2.0\modules"
File ${prefix}/lib/gtk-2.0/modules/libgail.dll

SetOutPath "$INSTDIR\share\themes\Default\gtk-2.0-key"
File ${prefix}/share/themes/Default/gtk-2.0-key/gtkrc

SetOutPath "$INSTDIR\share\themes\Emacs\gtk-2.0-key"
File ${prefix}/share/themes/Emacs/gtk-2.0-key/gtkrc

SetOutPath "$INSTDIR\share\themes\Raleigh\gtk-2.0"
File ${prefix}/share/themes/Raleigh/gtk-2.0/gtkrc

SetOutPath "$INSTDIR\share\themes\MS-Windows\gtk-2.0"
File ${prefix}/share/themes/MS-Windows/gtk-2.0/gtkrc

SetOutPath "$INSTDIR\share\locale\de\LC_MESSAGES"
File ${prefix}/share/locale/de/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/de/LC_MESSAGES/gtk20-properties.mo

SetOutPath "$INSTDIR\share\locale\ar\LC_MESSAGES"
File ${prefix}/share/locale/ar/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ar/LC_MESSAGES/gtk20-properties.mo

SetOutPath "$INSTDIR\share\locale\es\LC_MESSAGES"
File ${prefix}/share/locale/es/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/es/LC_MESSAGES/gtk20-properties.mo

SetOutPath "$INSTDIR\share\locale\fr\LC_MESSAGES"
File ${prefix}/share/locale/fr/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/fr/LC_MESSAGES/gtk20-properties.mo

SetOutPath "$INSTDIR\share\locale\ru\LC_MESSAGES"
File ${prefix}/share/locale/ru/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ru/LC_MESSAGES/gtk20-properties.mo

SetOutPath "$INSTDIR"

#######################################
### gnutls
!insertmacro SetPrefix gnutls
File ${prefix}/bin/libgnutls-30.dll

#######################################
### curl
!insertmacro SetPrefix curl
File ${prefix}/bin/libcurl-4.dll

#######################################
### libxml2
!insertmacro SetPrefix libxml2
File ${prefix}/bin/libxml2-2.dll

#######################################
### gpgme
!insertmacro SetPrefix gpgme
ClearErrors
SetOverwrite try
File "${prefix}/bin/libgpgme-11.dll"

SetOverwrite lastused
ifErrors 0 +3
	File /oname=libgpgme-11.dll.tmp "${prefix}/bin/libgpgme-11.dll"
	Rename /REBOOTOK libgpgme-11.dll.tmp libgpgme-11.dll

ClearErrors
SetOverwrite try
File "${prefix}/bin/libgpgme-glib-11.dll"
SetOverwrite lastused
ifErrors 0 +3
	File /oname=libgpgme-glib-11.dll.tmp "${prefix}/bin/libgpgme-glib-11.dll"
	Rename /REBOOTOK libgpgme-glib-11.dll.tmp libgpgme-glib-11.dll

File "${prefix}/libexec/gpgme-w32spawn.exe"

SetOutPath "$INSTDIR\lib"
File /oname=libgpgme.imp "${prefix}/lib/libgpgme.dll.a"
File /oname=libgpgme-glib.imp "${prefix}/lib/libgpgme-glib.dll.a"

SetOutPath "$INSTDIR\include"
File "${prefix}/include/gpgme.h"

SetOutPath "$INSTDIR"

#######################################
### webkit
!insertmacro SetPrefix webkit
SetOutPath "$INSTDIR\share\locale\pt_BR\LC_MESSAGES"
File ${prefix}/share/locale/pt_BR/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\uk\LC_MESSAGES"
File ${prefix}/share/locale/uk/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\pt\LC_MESSAGES"
File ${prefix}/share/locale/pt/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\it\LC_MESSAGES"
File ${prefix}/share/locale/it/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\es\LC_MESSAGES"
File ${prefix}/share/locale/es/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\zh_CN\LC_MESSAGES"
File ${prefix}/share/locale/zh_CN/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\nl\LC_MESSAGES"
File ${prefix}/share/locale/nl/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\cs\LC_MESSAGES"
File ${prefix}/share/locale/cs/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\ru\LC_MESSAGES"
File ${prefix}/share/locale/ru/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\sv\LC_MESSAGES"
File ${prefix}/share/locale/sv/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\de\LC_MESSAGES"
File ${prefix}/share/locale/de/LC_MESSAGES/webkit-2.0.mo
SetOutPath "$INSTDIR\share\locale\en_GB\LC_MESSAGES"
File ${prefix}/share/locale/en_GB/LC_MESSAGES/webkit-2.0.mo

SetOutPath "$INSTDIR"
File ${prefix}/bin/libwebkitgtk-1.0-0.dll

#######################################
### jpeg
!insertmacro SetPrefix jpeg
File ${prefix}/bin/libjpeg-9.dll

#######################################
### glib-networking
!insertmacro SetPrefix2 glib_networking glib-networking
SetOutPath "$INSTDIR\lib\gio\modules"
File ${prefix}/lib/gio/modules/libgiognutls.dll
SetOutPath "$INSTDIR"

#######################################
### libsoup
!insertmacro SetPrefix libsoup
File ${prefix}/bin/libsoup-2.4-1.dll

#######################################
### gmp
!insertmacro SetPrefix gmp
File ${prefix}/bin/libgmp-10.dll

#######################################
### nettle
!insertmacro SetPrefix nettle
File ${prefix}/bin/libnettle-6-1.dll
File ${prefix}/bin/libhogweed-4-1.dll

#######################################
### claws-mail
!insertmacro SetPrefix2 claws_mail claws-mail
SetOutPath "$INSTDIR"
File ${prefix}/bin/claws-mail.exe
File ${prefix}/share/doc/claws-mail/manual/en/claws-mail-manual.pdf

SetOutPath "$INSTDIR\share\claws-mail"
File ${prefix}/share/claws-mail/ca-certificates.crt

SetOutPath "$INSTDIR\lib\claws-mail\plugins"
File ${prefix}/lib/claws-mail/plugins/pgpcore.dll
File ${prefix}/lib/claws-mail/plugins/pgpinline.dll
File ${prefix}/lib/claws-mail/plugins/pgpinline.deps
File ${prefix}/lib/claws-mail/plugins/pgpmime.dll
File ${prefix}/lib/claws-mail/plugins/pgpmime.deps
File ${prefix}/lib/claws-mail/plugins/smime.dll
File ${prefix}/lib/claws-mail/plugins/smime.deps
File ${prefix}/lib/claws-mail/plugins/address_keeper.dll
File ${prefix}/lib/claws-mail/plugins/att_remover.dll
File ${prefix}/lib/claws-mail/plugins/attachwarner.dll
File ${prefix}/lib/claws-mail/plugins/bsfilter.dll
File ${prefix}/lib/claws-mail/plugins/fancy.dll
File ${prefix}/lib/claws-mail/plugins/fetchinfo.dll
File ${prefix}/lib/claws-mail/plugins/libravatar.dll
File ${prefix}/lib/claws-mail/plugins/notification.dll
File ${prefix}/lib/claws-mail/plugins/tnef_parse.dll
File ${prefix}/lib/claws-mail/plugins/rssyl.dll
File ${prefix}/lib/claws-mail/plugins/spamreport.dll
File ${prefix}/lib/claws-mail/plugins/vcalendar.dll
File ${prefix}/lib/claws-mail/plugins/managesieve.dll

SetOutPath "$INSTDIR\share\locale\bg\LC_MESSAGES"
File ${prefix}/share/locale/bg/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\ca\LC_MESSAGES"
File ${prefix}/share/locale/ca/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\cs\LC_MESSAGES"
File ${prefix}/share/locale/cs/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\de\LC_MESSAGES"
File ${prefix}/share/locale/de/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\en_GB\LC_MESSAGES"
File ${prefix}/share/locale/en_GB/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\eo\LC_MESSAGES"
File ${prefix}/share/locale/eo/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\es\LC_MESSAGES"
File ${prefix}/share/locale/es/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\fi\LC_MESSAGES"
File ${prefix}/share/locale/fi/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\fr\LC_MESSAGES"
File ${prefix}/share/locale/fr/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\he\LC_MESSAGES"
File ${prefix}/share/locale/he/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\hu\LC_MESSAGES"
File ${prefix}/share/locale/hu/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\id_ID\LC_MESSAGES"
File ${prefix}/share/locale/id_ID/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\lt\LC_MESSAGES"
File ${prefix}/share/locale/lt/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\nb\LC_MESSAGES"
File ${prefix}/share/locale/nb/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\nl\LC_MESSAGES"
File ${prefix}/share/locale/nl/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\pl\LC_MESSAGES"
File ${prefix}/share/locale/pl/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\pt_BR\LC_MESSAGES"
File ${prefix}/share/locale/pt_BR/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\sk\LC_MESSAGES"
File ${prefix}/share/locale/sk/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\sv\LC_MESSAGES"
File ${prefix}/share/locale/sv/LC_MESSAGES/claws-mail.mo

SetOutPath "$INSTDIR"

DetailPrint "Writing VERSION file"
FileOpen $0 "$INSTDIR\VERSION" w
FileWrite $0 "${PACKAGE}$\r$\n"
FileWrite $0 "${VERSION}$\r$\n"
FileClose $0

${MementoSectionEnd}

${MementoSectionDone}

##############################################
### Windows Registry modification section
Section
# We used to determine the language using a Registry entry.
# Although we don't want to delete the user's Lang Registry Setting
# because he might have have selected a different language than his
# default.  We delete the global Lang of the installation.
DeleteRegValue HKLM "Software\GNU\Claws Mail" "Lang"
DetailPrint "Deleted obsolete Lang entry"

!insertmacro MUI_INSTALLOPTIONS_READ $R0 "installer-setdefaultclient.ini" \
"Field 1" "State"
IntCmp $R0 0 skip_default_client

WriteRegStr   HKCU "SOFTWARE\Classes\mailto" "" "URL:MailTo-Protocol"
WriteRegStr   HKCU "SOFTWARE\Classes\mailto" "URL Protocol" ""
WriteRegDword HKCU "SOFTWARE\Classes\mailto" "EditFlags" 2
WriteRegStr   HKCU "SOFTWARE\Classes\mailto" "FriendlyTypeName" "Claws-Mail URL"
WriteRegStr   HKCU "SOFTWARE\Classes\mailto\DefaultIcon" "" "$INSTDIR\claws-mail.exe,0"
WriteRegStr   HKCU "SOFTWARE\Classes\mailto\shell\open\command" "" "$INSTDIR\claws-mail.exe --compose %1"
DetailPrint "Set Claws Mail as default mail client"

skip_default_client:
#just register Claws in the list of available mailers
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail" "" "Claws Mail"
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail" "DLLPath" ""

WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Capabilities" "ApplicationDescription" "Fast, lightweight and user-friendly GTK+2 based email client"
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Capabilities" "ApplicationIcon" "$INSTDIR\claws-mail.exe,0"
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Capabilities" "ApplicationName" "Claws Mail"

WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Capabilities\UrlAssociations" "mailto" "Claws-Mail.URL.mailto"

WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto" "" "URL:MailTo-Protocol"
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto" "URL Protocol" ""
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto" "FriendlyTypeName" "Claws-Mail URL"
WriteRegDword HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto" "EditFlags" 2
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto\DefaultIcon" "" "$INSTDIR\claws-mail.exe,0"
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto\shell\open\command" "" "$INSTDIR\claws-mail.exe --compose %1"

WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\shell\open\command" "" "$INSTDIR\claws-mail.exe"

WriteRegStr   HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto" "" "Claws-Mail URL"
WriteRegStr   HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto" "FriendlyTypeName" "Claws-Mail URL"
WriteRegStr   HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto" "URL Protocol" ""
WriteRegDword HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto" "EditFlags" 2

WriteRegStr   HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto\DefaultIcon" "" "$INSTDIR\claws-mail.exe,0"
WriteRegStr   HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto\shell\open\command" "" "$INSTDIR\claws-mail.exe --compose %1"

# Windows 8
WriteRegStr HKLM "SOFTWARE\RegisteredApplications" "Claws Mail" "Software\Clients\Mail\Claws Mail\Capabilities"

# Windows Add/Remove Programs support
Var /GLOBAL MYTMP
StrCpy $MYTMP "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRETTY_PACKAGE_SHORT}"
WriteRegExpandStr HKLM $MYTMP "UninstallString" '"$INSTDIR\${PACKAGE}-uninstall.exe"'
WriteRegExpandStr HKLM $MYTMP "InstallLocation" "$INSTDIR"
WriteRegStr       HKLM $MYTMP "DisplayName"     "${PRETTY_PACKAGE}"
WriteRegStr       HKLM $MYTMP "DisplayIcon"     "$INSTDIR\claws-mail.exe,0"
WriteRegStr       HKLM $MYTMP "DisplayVersion"  "${VERSION}"
WriteRegStr       HKLM $MYTMP "Publisher"       "${COMPANY}"
WriteRegStr       HKLM $MYTMP "URLInfoAbout"    "${WEBSITE}"
WriteRegDWORD     HKLM $MYTMP "NoModify"        "1"
WriteRegDWORD     HKLM $MYTMP "NoRepair"        "1"
DetailPrint "Added Claws Mail info to Add/Remove Programs list"

SectionEnd

### Create the uninstaller and shortcuts
Section
WriteUninstaller "$INSTDIR\claws-mail-uninstall.exe"

# Delete the old stuff, also old names of previous versions.
Delete "$DESKTOP\Claws-Mail.lnk"
Delete "$DESKTOP\Claws-Mail Manual.lnk"

# Start Menu
!insertmacro MUI_INSTALLOPTIONS_READ $R0 "installer-options.ini" \
	"Field 2" "State"
	IntCmp $R0 0 no_start_menu

	CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Claws-Mail.lnk" \
		"$INSTDIR\claws-mail.exe" \
		"" "" "" SW_SHOWNORMAL "" $(T_Menu_ClawsMail)

	CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Uninstall.lnk" \
		"$INSTDIR\claws-mail-uninstall.exe" \
		"" "$INSTDIR\claws-mail-uninstall.exe" "" SW_SHOWNORMAL "" $(T_Menu_Uninstall)

	no_start_menu:

# Desktop
!insertmacro MUI_INSTALLOPTIONS_READ $R0 "installer-options.ini" \
	"Field 3" "State"
	IntCmp $R0 0 no_desktop

	CreateShortCut "$DESKTOP\Claws-Mail.lnk" \
		"$INSTDIR\claws-mail.exe" \
		"" "" "" SW_SHOWNORMAL "" $(T_Menu_ClawsMail)
	
	no_desktop:

# Quick Launch
!insertmacro MUI_INSTALLOPTIONS_READ $R0 "installer-options.ini" \
	"Field 4" "State"
	IntCmp $R0 0 no_quicklaunch

	CreateShortCut "$QUICKLAUNCH\Claws-Mail.lnk" \
		"$INSTDIR\claws-mail.exe" \
		"" "" "" SW_SHOWNORMAL "" $(T_Menu_ClawsMail)

	no_quicklaunch:

SectionEnd

### Installer section that uninstalls gnupg2, gpa and its dependencies
### Uninstaller needs to have a similar section, doing the same work.
Section /o "-uninst_gnupg" SEC_GnupgUninst
!include "gnupg-uninst.nsi"
SectionEnd

# This function has to be defined here, after the section index of
# which it references. NSIS is weird.
Function UninstallGnupg
  IfFileExists $INSTDIR\gpg2.exe 0 leave
	MessageBox MB_YESNO "$(T_FoundGnupg)" IDYES uninstall IDNO leave
  uninstall:
  !insertmacro SelectSection ${SEC_GnupgUninst}
	leave:
FunctionEnd