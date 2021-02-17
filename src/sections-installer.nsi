### Start of the installer section
${MementoSection} "-Claws-Mail" SEC_claws_mail

SetOutPath "$INSTDIR"

# Install the mingw32 runtime libraries.  They are stored in the
# build directory with a different suffix, so that makensis does not
# list sumbol names.
File /oname=libstdc++-6.dll     "${BUILD_DIR}/libstdc++-6.dll-x"
File /oname=${libgcc_dll} "${BUILD_DIR}/${libgcc_dll}-x"
File /oname=libwinpthread-1.dll "${BUILD_DIR}/libwinpthread-1.dll-x"

### Now install files for each software component

#######################################
### bzip2
# Nothing to install, as we link statically

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

#######################################
### libtasn1
!insertmacro SetPrefix libtasn1
File ${prefix}/bin/libtasn1-6.dll

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
# Also install the same file under the name bsfilter expects.
ClearErrors
SetOverwrite try
File "${prefix}/bin/iconv.dll"
SetOverwrite lastused
ifErrors 0 +3
	File /oname=iconv.dll.tmp "${prefix}/bin/iconv.dll"
	Rename /REBOOTOK iconv.dll.tmp iconv.dll

#######################################
### gettext
!insertmacro SetPrefix gettext
File ${prefix}/bin/libintl-8.dll
File /oname=intl.dll ${prefix}/bin/libintl-8.dll

#######################################
### libpng
!insertmacro SetPrefix libpng
File ${prefix}/bin/libpng16-16.dll

#######################################
### hunspell
!insertmacro SetPrefix hunspell
File ${prefix}/bin/libhunspell-1.7-0.dll

#######################################
### enchant
!insertmacro SetPrefix enchant
File ${prefix}/bin/libenchant-2.dll
SetOutPath "$INSTDIR\lib\enchant-2"
File ${prefix}/lib/enchant-2/enchant_hunspell.dll

SetShellVarContext all
SetOutPath "$INSTDIR\share\enchant"
File ${prefix}/share/enchant/enchant.ordering
SetOutPath "$INSTDIR\share\enchant\hunspell"
File dictionaries/en_US.aff
File dictionaries/en_US.dic
File dictionaries/de_DE_frami.aff
File dictionaries/de_DE_frami.dic
File dictionaries/fr.aff
File dictionaries/fr.dic
SetOutPath "$INSTDIR"

#######################################
### cyrus-sasl
!insertmacro SetPrefix2 cyrus_sasl cyrus-sasl
File ${prefix}/bin/libsasl2-3.dll
SetOutPath "$INSTDIR\lib\sasl2"
File ${prefix}/lib/sasl2/libanonymous-3.dll
File ${prefix}/lib/sasl2/libcrammd5-3.dll
File ${prefix}/lib/sasl2/libdigestmd5-3.dll
File ${prefix}/lib/sasl2/liblogin-3.dll
File ${prefix}/lib/sasl2/libplain-3.dll
SetOutPath "$INSTDIR"

#######################################
### libetpan
!insertmacro SetPrefix libetpan
File ${prefix}/bin/libetpan-20.dll

#######################################
### libassuan
!insertmacro SetPrefix libassuan
ClearErrors
SetOverwrite try
File "${prefix}/bin/libassuan${gpg_dll_num}-0.dll"
SetOverwrite lastused
ifErrors 0 +3
	File /oname=libassuan${gpg_dll_num}-0.tmp "${prefix}/bin/libassuan${gpg_dll_num}-0.dll"
	Rename /REBOOTOK libassuan${gpg_dll_num}-0.dll.tmp libassuan${gpg_dll_num}.dll

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
File "${prefix}/bin/libgpg-error${gpg_dll_num}-0.dll"
SetOverwrite lastused
ifErrors 0 +3
	File /oname=libgpg-error${gpg_dll_num}-0.dll.tmp "${prefix}/bin/libgpg-error${gpg_dll_num}-0.dll"
	Rename /REBOOTOK libgpg-error${gpg_dll_num}-0.dll.tmp libgpg-error${gpg_dll_num}-0.dll

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
File ${prefix}/bin/libffi-7.dll

#######################################
### glib
!insertmacro SetPrefix glib
File ${prefix}/bin/libglib-2.0-0.dll
File ${prefix}/bin/libgmodule-2.0-0.dll
File ${prefix}/bin/libgobject-2.0-0.dll
File ${prefix}/bin/libgthread-2.0-0.dll
File ${prefix}/bin/libgio-2.0-0.dll

File ${prefix}/bin/gdbus.exe
File ${prefix}/bin/gio-querymodules.exe
File ${prefix}/bin/glib-compile-resources.exe
File ${prefix}/bin/glib-compile-schemas.exe
File ${prefix}/bin/gobject-query.exe
File ${prefix}/bin/gresource.exe
File ${prefix}/bin/gsettings.exe
!if ${w64} == "yes"
File ${prefix}/bin/gspawn-win64-helper.exe
File ${prefix}/bin/gspawn-win64-helper-console.exe
!else
File ${prefix}/bin/gspawn-win32-helper.exe
File ${prefix}/bin/gspawn-win32-helper-console.exe
!endif


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
File ${prefix}/bin/libharfbuzz-icu-0.dll

#######################################
### fribidi
!insertmacro SetPrefix fribidi
File ${prefix}/bin/libfribidi-0.dll

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

# Install all the localizations
SetOutPath "$INSTDIR\share\locale\af\LC_MESSAGES"
File ${prefix}/share/locale/af/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/af/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\am\LC_MESSAGES"
File ${prefix}/share/locale/am/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/am/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ang\LC_MESSAGES"
File ${prefix}/share/locale/ang/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ang/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ar\LC_MESSAGES"
File ${prefix}/share/locale/ar/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ar/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\as\LC_MESSAGES"
File ${prefix}/share/locale/as/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/as/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ast\LC_MESSAGES"
File ${prefix}/share/locale/ast/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ast/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\az_IR\LC_MESSAGES"
File ${prefix}/share/locale/az_IR/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/az_IR/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\az\LC_MESSAGES"
File ${prefix}/share/locale/az/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/az/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\be@latin\LC_MESSAGES"
File ${prefix}/share/locale/be@latin/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/be@latin/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\be\LC_MESSAGES"
File ${prefix}/share/locale/be/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/be/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\bg\LC_MESSAGES"
File ${prefix}/share/locale/bg/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/bg/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\bn_IN\LC_MESSAGES"
File ${prefix}/share/locale/bn_IN/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/bn_IN/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\bn\LC_MESSAGES"
File ${prefix}/share/locale/bn/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/bn/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\br\LC_MESSAGES"
File ${prefix}/share/locale/br/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/br/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\bs\LC_MESSAGES"
File ${prefix}/share/locale/bs/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/bs/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ca\LC_MESSAGES"
File ${prefix}/share/locale/ca/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ca/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ca@valencia\LC_MESSAGES"
File ${prefix}/share/locale/ca@valencia/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ca@valencia/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\crh\LC_MESSAGES"
File ${prefix}/share/locale/crh/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/crh/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\cs\LC_MESSAGES"
File ${prefix}/share/locale/cs/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/cs/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\cy\LC_MESSAGES"
File ${prefix}/share/locale/cy/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/cy/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\da\LC_MESSAGES"
File ${prefix}/share/locale/da/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/da/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\de\LC_MESSAGES"
File ${prefix}/share/locale/de/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/de/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\dz\LC_MESSAGES"
File ${prefix}/share/locale/dz/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/dz/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\el\LC_MESSAGES"
File ${prefix}/share/locale/el/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/el/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\en_CA\LC_MESSAGES"
File ${prefix}/share/locale/en_CA/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/en_CA/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\en_GB\LC_MESSAGES"
File ${prefix}/share/locale/en_GB/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/en_GB/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\eo\LC_MESSAGES"
File ${prefix}/share/locale/eo/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/eo/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\es\LC_MESSAGES"
File ${prefix}/share/locale/es/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/es/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\et\LC_MESSAGES"
File ${prefix}/share/locale/et/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/et/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\eu\LC_MESSAGES"
File ${prefix}/share/locale/eu/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/eu/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\fa\LC_MESSAGES"
File ${prefix}/share/locale/fa/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/fa/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\fi\LC_MESSAGES"
File ${prefix}/share/locale/fi/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/fi/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\fr\LC_MESSAGES"
File ${prefix}/share/locale/fr/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/fr/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ga\LC_MESSAGES"
File ${prefix}/share/locale/ga/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ga/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\gl\LC_MESSAGES"
File ${prefix}/share/locale/gl/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/gl/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\gu\LC_MESSAGES"
File ${prefix}/share/locale/gu/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/gu/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\he\LC_MESSAGES"
File ${prefix}/share/locale/he/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/he/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\hi\LC_MESSAGES"
File ${prefix}/share/locale/hi/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/hi/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\hr\LC_MESSAGES"
File ${prefix}/share/locale/hr/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/hr/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\hu\LC_MESSAGES"
File ${prefix}/share/locale/hu/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/hu/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\hy\LC_MESSAGES"
File ${prefix}/share/locale/hy/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/hy/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ia\LC_MESSAGES"
File ${prefix}/share/locale/ia/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ia/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\id\LC_MESSAGES"
File ${prefix}/share/locale/id/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/id/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\io\LC_MESSAGES"
File ${prefix}/share/locale/io/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/io/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\is\LC_MESSAGES"
File ${prefix}/share/locale/is/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/is/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\it\LC_MESSAGES"
File ${prefix}/share/locale/it/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/it/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ja\LC_MESSAGES"
File ${prefix}/share/locale/ja/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ja/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ka\LC_MESSAGES"
File ${prefix}/share/locale/ka/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ka/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\kk\LC_MESSAGES"
File ${prefix}/share/locale/kk/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/kk/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\kn\LC_MESSAGES"
File ${prefix}/share/locale/kn/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/kn/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ko\LC_MESSAGES"
File ${prefix}/share/locale/ko/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ko/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ku\LC_MESSAGES"
File ${prefix}/share/locale/ku/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ku/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\li\LC_MESSAGES"
File ${prefix}/share/locale/li/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/li/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\lt\LC_MESSAGES"
File ${prefix}/share/locale/lt/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/lt/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\lv\LC_MESSAGES"
File ${prefix}/share/locale/lv/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/lv/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\mai\LC_MESSAGES"
File ${prefix}/share/locale/mai/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/mai/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\mi\LC_MESSAGES"
File ${prefix}/share/locale/mi/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/mi/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\mk\LC_MESSAGES"
File ${prefix}/share/locale/mk/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/mk/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ml\LC_MESSAGES"
File ${prefix}/share/locale/ml/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ml/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\mn\LC_MESSAGES"
File ${prefix}/share/locale/mn/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/mn/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\mr\LC_MESSAGES"
File ${prefix}/share/locale/mr/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/mr/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ms\LC_MESSAGES"
File ${prefix}/share/locale/ms/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ms/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\my\LC_MESSAGES"
File ${prefix}/share/locale/my/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/my/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\nb\LC_MESSAGES"
File ${prefix}/share/locale/nb/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/nb/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\nds\LC_MESSAGES"
File ${prefix}/share/locale/nds/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/nds/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ne\LC_MESSAGES"
File ${prefix}/share/locale/ne/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ne/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\nl\LC_MESSAGES"
File ${prefix}/share/locale/nl/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/nl/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\nn\LC_MESSAGES"
File ${prefix}/share/locale/nn/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/nn/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\nso\LC_MESSAGES"
File ${prefix}/share/locale/nso/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/nso/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\oc\LC_MESSAGES"
File ${prefix}/share/locale/oc/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/oc/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\or\LC_MESSAGES"
File ${prefix}/share/locale/or/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/or/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\pa\LC_MESSAGES"
File ${prefix}/share/locale/pa/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/pa/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\pl\LC_MESSAGES"
File ${prefix}/share/locale/pl/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/pl/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ps\LC_MESSAGES"
File ${prefix}/share/locale/ps/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ps/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\pt_BR\LC_MESSAGES"
File ${prefix}/share/locale/pt_BR/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/pt_BR/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\pt\LC_MESSAGES"
File ${prefix}/share/locale/pt/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/pt/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ro\LC_MESSAGES"
File ${prefix}/share/locale/ro/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ro/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ru\LC_MESSAGES"
File ${prefix}/share/locale/ru/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ru/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\rw\LC_MESSAGES"
File ${prefix}/share/locale/rw/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/rw/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\si\LC_MESSAGES"
File ${prefix}/share/locale/si/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/si/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\sk\LC_MESSAGES"
File ${prefix}/share/locale/sk/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/sk/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\sl\LC_MESSAGES"
File ${prefix}/share/locale/sl/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/sl/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\sq\LC_MESSAGES"
File ${prefix}/share/locale/sq/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/sq/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\sr@ije\LC_MESSAGES"
File ${prefix}/share/locale/sr@ije/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/sr@ije/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\sr@latin\LC_MESSAGES"
File ${prefix}/share/locale/sr@latin/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/sr@latin/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\sr\LC_MESSAGES"
File ${prefix}/share/locale/sr/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/sr/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\sv\LC_MESSAGES"
File ${prefix}/share/locale/sv/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/sv/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ta\LC_MESSAGES"
File ${prefix}/share/locale/ta/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ta/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\te\LC_MESSAGES"
File ${prefix}/share/locale/te/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/te/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\th\LC_MESSAGES"
File ${prefix}/share/locale/th/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/th/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\tk\LC_MESSAGES"
File ${prefix}/share/locale/tk/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/tk/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\tr\LC_MESSAGES"
File ${prefix}/share/locale/tr/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/tr/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\tt\LC_MESSAGES"
File ${prefix}/share/locale/tt/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/tt/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ug\LC_MESSAGES"
File ${prefix}/share/locale/ug/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ug/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\uk\LC_MESSAGES"
File ${prefix}/share/locale/uk/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/uk/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\ur\LC_MESSAGES"
File ${prefix}/share/locale/ur/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/ur/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\uz@cyrillic\LC_MESSAGES"
File ${prefix}/share/locale/uz@cyrillic/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/uz@cyrillic/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\uz\LC_MESSAGES"
File ${prefix}/share/locale/uz/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/uz/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\vi\LC_MESSAGES"
File ${prefix}/share/locale/vi/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/vi/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\wa\LC_MESSAGES"
File ${prefix}/share/locale/wa/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/wa/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\xh\LC_MESSAGES"
File ${prefix}/share/locale/xh/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/xh/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\yi\LC_MESSAGES"
File ${prefix}/share/locale/yi/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/yi/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\zh_CN\LC_MESSAGES"
File ${prefix}/share/locale/zh_CN/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/zh_CN/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\zh_HK\LC_MESSAGES"
File ${prefix}/share/locale/zh_HK/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/zh_HK/LC_MESSAGES/gtk20-properties.mo
SetOutPath "$INSTDIR\share\locale\zh_TW\LC_MESSAGES"
File ${prefix}/share/locale/zh_TW/LC_MESSAGES/gtk20.mo
File ${prefix}/share/locale/zh_TW/LC_MESSAGES/gtk20-properties.mo

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
### libxslt
!insertmacro SetPrefix libxslt
File ${prefix}/bin/libxslt-1.dll

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
### libwebp
!insertmacro SetPrefix libwebp
SetOutPath "$INSTDIR"
File ${prefix}/bin/libwebp-7.dll

#######################################
### icu4c
!insertmacro SetPrefix icu4c
SetOutPath "$INSTDIR"
File ${prefix}/lib/icui18n58.dll
File ${prefix}/lib/icuuc58.dll
File ${prefix}/lib/icudata58.dll

#######################################
### sqlite-autoconf
!insertmacro SetPrefix2 sqlite_autoconf sqlite-autoconf
SetOutPath "$INSTDIR"
File ${prefix}/bin/libsqlite3-0.dll

#######################################
### webkit
!insertmacro SetPrefix webkitgtk
SetOutPath "$INSTDIR"
File ${prefix}/bin/libwebkitgtk-1.0-0.dll
File ${prefix}/bin/libjavascriptcoregtk-1.0-0.dll

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
### libpsl
!insertmacro SetPrefix libpsl
File ${prefix}/bin/libpsl-5.dll

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
File ${prefix}/bin/libnettle-8.dll
File ${prefix}/bin/libhogweed-6.dll

#######################################
### libical
!insertmacro SetPrefix libical
File ${prefix}/bin/libical.dll
File ${prefix}/bin/libicalss.dll
File ${prefix}/bin/libicalvcal.dll

#######################################
### ytnef
!insertmacro SetPrefix ytnef
File ${prefix}/bin/libytnef-0.dll

#######################################
### gumbo-parser
!insertmacro SetPrefix2 gumbo_parser gumbo-parser
File ${prefix}/bin/libgumbo-1.dll

#######################################
### claws-mail
!insertmacro SetPrefix2 claws_mail claws-mail
SetOutPath "$INSTDIR"
File ${prefix}/bin/claws-mail.exe
File ${prefix}/share/doc/claws-mail/manual/en/claws-mail-manual.pdf

SetOutPath "$INSTDIR\share\claws-mail"
File ${prefix}/share/claws-mail/ca-certificates.crt

SetOutPath "$INSTDIR\lib\claws-mail\plugins"
File ${prefix}/lib/claws-mail/plugins/address_keeper.dll
File ${prefix}/lib/claws-mail/plugins/attachwarner.dll
File ${prefix}/lib/claws-mail/plugins/att_remover.dll
File ${prefix}/lib/claws-mail/plugins/bsfilter.dll
File ${prefix}/lib/claws-mail/plugins/fancy.dll
File ${prefix}/lib/claws-mail/plugins/fetchinfo.dll
File ${prefix}/lib/claws-mail/plugins/libravatar.dll
File ${prefix}/lib/claws-mail/plugins/litehtml_viewer.dll
File ${prefix}/lib/claws-mail/plugins/managesieve.dll
File ${prefix}/lib/claws-mail/plugins/notification.dll
File ${prefix}/lib/claws-mail/plugins/pgpcore.dll
File ${prefix}/lib/claws-mail/plugins/pgpinline.dll
File ${prefix}/lib/claws-mail/plugins/pgpinline.deps
File ${prefix}/lib/claws-mail/plugins/pgpmime.dll
File ${prefix}/lib/claws-mail/plugins/pgpmime.deps
File ${prefix}/lib/claws-mail/plugins/rssyl.dll
File ${prefix}/lib/claws-mail/plugins/smime.dll
File ${prefix}/lib/claws-mail/plugins/smime.deps
File ${prefix}/lib/claws-mail/plugins/spamreport.dll
File ${prefix}/lib/claws-mail/plugins/tnef_parse.dll
File ${prefix}/lib/claws-mail/plugins/vcalendar.dll

#SetOutPath "$INSTDIR\share\locale\bg\LC_MESSAGES"
#File ${prefix}/share/locale/bg/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\ca\LC_MESSAGES"
File ${prefix}/share/locale/ca/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\cs\LC_MESSAGES"
File ${prefix}/share/locale/cs/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\da\LC_MESSAGES"
File ${prefix}/share/locale/da/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\de\LC_MESSAGES"
File ${prefix}/share/locale/de/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\en_GB\LC_MESSAGES"
File ${prefix}/share/locale/en_GB/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\es\LC_MESSAGES"
File ${prefix}/share/locale/es/LC_MESSAGES/claws-mail.mo
#SetOutPath "$INSTDIR\share\locale\eo\LC_MESSAGES"
#File ${prefix}/share/locale/eo/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\fi\LC_MESSAGES"
File ${prefix}/share/locale/fi/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\fr\LC_MESSAGES"
File ${prefix}/share/locale/fr/LC_MESSAGES/claws-mail.mo
#SetOutPath "$INSTDIR\share\locale\he\LC_MESSAGES"
#File ${prefix}/share/locale/he/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\hu\LC_MESSAGES"
File ${prefix}/share/locale/hu/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\id_ID\LC_MESSAGES"
File ${prefix}/share/locale/id_ID/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\it\LC_MESSAGES"
File ${prefix}/share/locale/it/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\ja\LC_MESSAGES"
File ${prefix}/share/locale/ja/LC_MESSAGES/claws-mail.mo
#SetOutPath "$INSTDIR\share\locale\lt\LC_MESSAGES"
#File ${prefix}/share/locale/lt/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\nb\LC_MESSAGES"
File ${prefix}/share/locale/nb/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\nl\LC_MESSAGES"
File ${prefix}/share/locale/nl/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\pl\LC_MESSAGES"
File ${prefix}/share/locale/pl/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\pt_BR\LC_MESSAGES"
File ${prefix}/share/locale/pt_BR/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\ro\LC_MESSAGES"
File ${prefix}/share/locale/ro/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\ru\LC_MESSAGES"
File ${prefix}/share/locale/ru/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\sk\LC_MESSAGES"
File ${prefix}/share/locale/sk/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\sv\LC_MESSAGES"
File ${prefix}/share/locale/sv/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\tr\LC_MESSAGES"
File ${prefix}/share/locale/tr/LC_MESSAGES/claws-mail.mo
SetOutPath "$INSTDIR\share\locale\zh_TW\LC_MESSAGES"
File ${prefix}/share/locale/zh_TW/LC_MESSAGES/claws-mail.mo

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
WriteRegExpandStr HKLM $MYTMP "UninstallString" '"$INSTDIR\claws-mail-uninstall.exe"'
WriteRegExpandStr HKLM $MYTMP "InstallLocation" "$INSTDIR"
WriteRegStr       HKLM $MYTMP "DisplayName"     "Claws Mail"
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

	SetOutPath "$INSTDIR"

	CreateDirectory "$SMPROGRAMS\$STARTMENU_FOLDER"

	CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Claws-Mail.lnk" \
		"$INSTDIR\claws-mail.exe" \
		"" "" "" SW_SHOWNORMAL "" $(T_Menu_ClawsMail)

	CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Claws-Mail Manual.lnk" \
		"$INSTDIR\claws-mail-manual.pdf" \
		"" "" "" SW_SHOWNORMAL "" $(T_Menu_ClawsMailManual)

	CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Uninstall.lnk" \
		"$INSTDIR\claws-mail-uninstall.exe" \
		"" "$INSTDIR\claws-mail-uninstall.exe" "" SW_SHOWNORMAL "" $(T_Menu_Uninstall)

	no_start_menu:

# Desktop
!insertmacro MUI_INSTALLOPTIONS_READ $R0 "installer-options.ini" \
	"Field 3" "State"
	IntCmp $R0 0 no_desktop

	SetOutPath "$INSTDIR"

	CreateShortCut "$DESKTOP\Claws-Mail.lnk" \
		"$INSTDIR\claws-mail.exe" \
		"" "" "" SW_SHOWNORMAL "" $(T_Menu_ClawsMail)
	
	no_desktop:

# Quick Launch
!insertmacro MUI_INSTALLOPTIONS_READ $R0 "installer-options.ini" \
	"Field 4" "State"
	IntCmp $R0 0 no_quicklaunch

	SetOutPath "$INSTDIR"

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
#Function UninstallGnupg
#  IfFileExists $INSTDIR\gpg2.exe 0 leave
#	MessageBox MB_YESNO "$(T_FoundGnupg)" IDYES uninstall IDNO leave
#  uninstall:
#  !insertmacro SelectSection ${SEC_GnupgUninst}
#	leave:
#FunctionEnd
