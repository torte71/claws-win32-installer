Section "-un.Claws-Mail"
#######################################
### claws-mail
# We delete this file from the old (and removed) jpeg package, that
# was only installed if claws was selected.
Delete "$INSTDIR\jpeg62.dll"

Delete "$INSTDIR\claws-mail.exe"
Delete "$INSTDIR\claws-mail-manual.pdf"

Delete "$INSTDIR\share\claws-mail\ca-certificates.crt"
RMDir "$INSTDIR\share\claws-mail"
RMDir "$INSTDIR\share"

Delete "$INSTDIR\lib\claws-mail\plugins\address_keeper.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\attachwarner.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\att_remover.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\bsfilter.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\fancy.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\fetchinfo.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\libravatar.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\litehtml_viewer.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\managesieve.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\notification.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\pgpcore.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\pgpinline.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\pgpinline.deps"
Delete "$INSTDIR\lib\claws-mail\plugins\pgpmime.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\pgpmime.deps"
Delete "$INSTDIR\lib\claws-mail\plugins\rssyl.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\smime.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\smime.deps"
Delete "$INSTDIR\lib\claws-mail\plugins\spamreport.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\tnef_parse.dll"
Delete "$INSTDIR\lib\claws-mail\plugins\vcalendar.dll"
RMDir "$INSTDIR\lib\claws-mail\plugins"
RMDir "$INSTDIR\lib\claws-mail"
RMDir "$INSTDIR\lib"

Delete "$INSTDIR\share\locale\bg\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\ca\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\cs\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\da\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\de\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\en_GB\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\eo\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\es\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\fi\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\he\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\hu\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\id_ID\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\it\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\ja\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\lt\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\nb\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\nl\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\pl\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\pt_BR\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\ro\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\ru\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\sk\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\sv\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\tr\LC_MESSAGES\claws-mail.mo"
Delete "$INSTDIR\share\locale\zh_TW\LC_MESSAGES\claws-mail.mo"

#######################################
### gumbo-parser
Delete "$INSTDIR\libgumbo-1.dll"

#######################################
### ytnef
Delete "$INSTDIR\libytnef-0.dll"

#######################################
### libical
Delete "$INSTDIR\libical.dll"
Delete "$INSTDIR\libicalss.dll"
Delete "$INSTDIR\libicalvcal.dll"

#######################################
### nettle
Delete "$INSTDIR\libhogweed-6.dll"
Delete "$INSTDIR\libnettle-8.dll"

#######################################
### gmp
Delete "$INSTDIR\libgmp-10.dll"

#######################################
### libsoup
Delete "$INSTDIR\libsoup-2.4-1.dll"

#######################################
### glib-networking
Delete "$INSTDIR\lib\gio\modules\libgiognutls.dll"

#######################################
### jpeg

Delete "$INSTDIR\libjpeg-9.dll"

#######################################
### webkitgtk
Delete "$INSTDIR\libwebkitgtk-1.0-0.dll"
Delete "$INSTDIR\libjavascriptcoregtk-1.0-0.dll"

#######################################
### sqlite-autoconf
Delete "$INSTDIR\libsqlite3-0.dll"

#######################################
### libwebp
Delete "$INSTDIR\libwebp-6.dll"

#######################################
### icu4c
Delete "$INSTDIR\icui18n58.dll"
Delete "$INSTDIR\icuuc58.dll"
Delete "$INSTDIR\icudata58.dll"

#######################################
### gpgme
Delete /REBOOTOK "$INSTDIR\libgpgme-11.dll"
Delete /REBOOTOK "$INSTDIR\libgpgme-glib-11.dll"
Delete /REBOOTOK "$INSTDIR\libgpgme-qt-11.dll"
Delete "$INSTDIR\gpgme-w32spawn.exe"
Delete "$INSTDIR\lib\libgpgme.imp"
Delete "$INSTDIR\lib\libgpgme-glib.imp"
Delete "$INSTDIR\include\gpgme.h"
RMDir "$INSTDIR\lib"
RMDir "$INSTDIR\include"

#######################################
### libxslt
Delete "$INSTDIR\libxslt-1.dll"

#######################################
### libxml2
Delete "$INSTDIR\libxml2-2.dll"

#######################################
### curl
Delete "$INSTDIR\libcurl-4.dll"

#######################################
### gnutls
Delete "$INSTDIR\libgnutls-30.dll"

#######################################
### gtk+
Delete /REBOOTOK "$INSTDIR\libgdk-win32-2.0-0.dll"
Delete /REBOOTOK "$INSTDIR\libgtk-win32-2.0-0.dll"

Delete /REBOOTOK "$INSTDIR\libgailutil-18.dll"
Delete "$INSTDIR\gtk-query-immodules-2.0.exe"

Delete "$INSTDIR\gtk-update-icon-cache.exe.manifest"
Delete "$INSTDIR\gtk-update-icon-cache.exe"

Delete "$INSTDIR\etc\gtk-2.0\gdk-pixbuf.loaders"
Delete "$INSTDIR\etc\gtk-2.0\gtk.immodules"
Delete "$INSTDIR\etc\gtk-2.0\im-multipress.conf"
Delete "$INSTDIR\etc\gtk-2.0\gtkrc"
RMDir "$INSTDIR\etc\gtk-2.0"
RMDir "$INSTDIR\etc"

Delete "$INSTDIR\lib\gtk-2.0\2.4.0\loaders\*.dll"
RMDir  "$INSTDIR\lib\gtk-2.0\2.10.0\loaders"
Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\*.dll"
RMDir  "$INSTDIR\lib\gtk-2.0\2.10.0\loaders"

#  Delete "$INSTDIR\lib\gtk-2.0\2.4.0\immodules\*.dll"
#  RMDir  "$INSTDIR\lib\gtk-2.0\2.4.0\immodules"
#  Delete /REBOOTOK "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\*.dll"
#  RMDir  /REBOOTOK "$INSTDIR\lib\gtk-2.0\2.10.0\immodules"

Delete /REBOOTOK "$INSTDIR\lib\gtk-2.0\2.10.0\engines\*.dll"
RMDir  /REBOOTOK "$INSTDIR\lib\gtk-2.0\2.10.0\engines"

RMDir  "$INSTDIR\lib\gtk-2.0\2.4.0"
RMDir  /REBOOTOK "$INSTDIR\lib\gtk-2.0\2.10.0"

Delete /REBOOTOK "$INSTDIR\lib\gtk-2.0\modules\*.dll"
RMDir  /REBOOTOK "$INSTDIR\lib\gtk-2.0\modules"

RMDir  /REBOOTOK "$INSTDIR\lib\gtk-2.0"

Delete "$INSTDIR\share\locale\af\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\af\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\am\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\am\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ang\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ang\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ar\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ar\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\as\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\as\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ast\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ast\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\az_IR\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\az_IR\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\az\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\az\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\be@latin\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\be@latin\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\be\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\be\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\bg\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\bg\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\bn_IN\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\bn_IN\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\bn\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\bn\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\br\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\br\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\bs\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\bs\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ca\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ca\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ca@valencia\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ca@valencia\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\crh\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\crh\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\cs\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\cs\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\cy\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\cy\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\da\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\da\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\de\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\de\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\dz\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\dz\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\el\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\el\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\en_CA\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\en_CA\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\en_GB\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\en_GB\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\eo\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\eo\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\es\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\es\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\et\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\et\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\eu\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\eu\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\fa\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\fa\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\fi\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\fi\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ga\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ga\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\gl\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\gl\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\gu\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\gu\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\he\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\he\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\hi\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\hi\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\hr\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\hr\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\hu\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\hu\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\hy\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\hy\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ia\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ia\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\id\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\id\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\io\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\io\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\is\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\is\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\it\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\it\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ja\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ja\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ka\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ka\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\kk\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\kk\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\kn\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\kn\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ko\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ko\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ku\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ku\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\li\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\li\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\lt\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\lt\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\lv\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\lv\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\mai\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\mai\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\mi\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\mi\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\mk\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\mk\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ml\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ml\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\mn\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\mn\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\mr\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\mr\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ms\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ms\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\my\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\my\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\nb\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\nb\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\nds\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\nds\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ne\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ne\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\nl\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\nl\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\nn\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\nn\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\nso\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\nso\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\oc\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\oc\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\or\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\or\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\pa\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\pa\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\pl\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\pl\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ps\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ps\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\pt_BR\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\pt_BR\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\pt\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\pt\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ro\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ro\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ru\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ru\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\rw\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\rw\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\si\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\si\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\sk\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\sk\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\sl\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\sl\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\sq\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\sq\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\sr@ije\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\sr@ije\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\sr@latin\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\sr@latin\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\sr\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\sr\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\sv\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\sv\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ta\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ta\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\te\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\te\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\th\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\th\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\tk\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\tk\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\tr\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\tr\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\tt\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\tt\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ug\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ug\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\uk\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\uk\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\ur\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\ur\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\uz@cyrillic\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\uz@cyrillic\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\uz\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\uz\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\vi\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\vi\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\wa\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\wa\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\xh\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\xh\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\yi\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\yi\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\zh_CN\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\zh_CN\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\zh_HK\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\zh_HK\LC_MESSAGES\gtk20-properties.mo"
Delete "$INSTDIR\share\locale\zh_TW\LC_MESSAGES\gtk20.mo"
Delete "$INSTDIR\share\locale\zh_TW\LC_MESSAGES\gtk20-properties.mo"

Delete "$INSTDIR\share\themes\Default\gtk-2.0\gtkrc"
RMDir "$INSTDIR\share\themes\Default\gtk-2.0"
Delete "$INSTDIR\share\themes\Default\gtk-2.0-key\gtkrc"
RMDir "$INSTDIR\share\themes\Default\gtk-2.0-key"
RMDir "$INSTDIR\share\themes\Default"

Delete "$INSTDIR\share\themes\Emacs\gtk-2.0-key\gtkrc"
RMDir "$INSTDIR\share\themes\Emacs\gtk-2.0-key"
RMDir "$INSTDIR\share\themes\Emacs"

Delete "$INSTDIR\share\themes\Raleigh\gtk-2.0\gtkrc"
RMDir "$INSTDIR\share\themes\Raleigh\gtk-2.0"
RMDir "$INSTDIR\share\themes\Raleigh"

Delete "$INSTDIR\share\themes\MS-Windows\gtk-2.0\gtkrc"
RMDir "$INSTDIR\share\themes\MS-Windows\gtk-2.0"
RMDir "$INSTDIR\share\themes\MS-Windows"

RMDir "$INSTDIR\share\themes"
RMDir "$INSTDIR\share"

#######################################
### gdk-pixbuf
Delete /REBOOTOK "$INSTDIR\libgdk_pixbuf-2.0-0.dll"
Delete "$INSTDIR\gdk-pixbuf-query-loaders.exe"
Delete "$INSTDIR\gdk-pixbuf-pixdata.exe"


#######################################
### atk
Delete "$INSTDIR\share\locale\de\LC_MESSAGES\atk10.mo"
Delete "$INSTDIR\share\locale\ar\LC_MESSAGES\atk10.mo"
Delete "$INSTDIR\share\locale\es\LC_MESSAGES\atk10.mo"
Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\atk10.mo"
Delete "$INSTDIR\share\locale\ru\LC_MESSAGES\atk10.mo"
Delete /REBOOTOK "$INSTDIR\libatk-1.0-0.dll"

#######################################
### pango
Delete /REBOOTOK "$INSTDIR\libpango-1.0-0.dll"
Delete /REBOOTOK "$INSTDIR\libpangoft2-1.0-0.dll"
Delete /REBOOTOK "$INSTDIR\libpangowin32-1.0-0.dll"
Delete /REBOOTOK "$INSTDIR\libpangocairo-1.0-0.dll"

#######################################
### harfbuzz
Delete "$INSTDIR\libharfbuzz-0.dll"
Delete "$INSTDIR\libharfbuzz-icu-0.dll"

#######################################
### cairo
Delete /REBOOTOK "$INSTDIR\libcairo-2.dll"
Delete /REBOOTOK "$INSTDIR\libcairo-gobject-2.dll"
Delete /REBOOTOK "$INSTDIR\libcairo-script-interpreter-2.dll"

#######################################
### pixman
Delete /REBOOTOK "$INSTDIR\libpixman-1-0.dll"

#######################################
### fontconfig
Delete /REBOOTOK "$INSTDIR\libfontconfig-1.dll"
Delete "$INSTDIR\etc\fonts\fonts.conf"
RMDir "$INSTDIR\etc\fonts"
RMDir "$INSTDIR\etc"

#######################################
### freetype
Delete /REBOOTOK "$INSTDIR\libfreetype-6.dll"

#######################################
### expat
Delete /REBOOTOK "$INSTDIR\libexpat-1.dll"

RMDir "$INSTDIR\lib"
RMDir "$INSTDIR\include"

#######################################
### glib
Delete "$INSTDIR\share\locale\de\LC_MESSAGES\glib20.mo"
Delete "$INSTDIR\share\locale\ar\LC_MESSAGES\glib20.mo"
Delete "$INSTDIR\share\locale\es\LC_MESSAGES\glib20.mo"
Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\glib20.mo"
Delete "$INSTDIR\share\locale\ru\LC_MESSAGES\glib20.mo"

Delete "$INSTDIR\share\glib-2.0\schemas\gschema.dtd"
RMDir "$INSTDIR\share\glib-2.0\schemas"
RMDir "$INSTDIR\share\glib-2.0"
RMDir "$INSTDIR\share"

Delete "$INSTDIR\gdbus.exe"
Delete "$INSTDIR\gio-querymodules.exe"
Delete "$INSTDIR\glib-compile-resources.exe"
Delete "$INSTDIR\glib-compile-schemas.exe"
Delete "$INSTDIR\glib-genmarshal.exe"
Delete "$INSTDIR\gobject-query.exe"
Delete "$INSTDIR\gresource.exe"
Delete "$INSTDIR\gsettings.exe"
!if ${w64} == "yes"
Delete "$INSTDIR\gspawn-win64-helper.exe"
Delete "$INSTDIR\gspawn-win64-helper-console.exe"
!else
Delete "$INSTDIR\gspawn-win32-helper.exe"
Delete "$INSTDIR\gspawn-win32-helper-console.exe"
!endif

Delete /REBOOTOK "$INSTDIR\libglib-2.0-0.dll"
Delete /REBOOTOK "$INSTDIR\libgmodule-2.0-0.dll"
Delete /REBOOTOK "$INSTDIR\libgobject-2.0-0.dll"
Delete /REBOOTOK "$INSTDIR\libgthread-2.0-0.dll"
Delete /REBOOTOK "$INSTDIR\libgio-2.0-0.dll"

RMDir "$INSTDIR\lib\gio\modules"
RMDir "$INSTDIR\lib\gio"

#######################################
### libffi
Delete /REBOOTOK "$INSTDIR\libffi-6.dll"

#######################################
### libgpg-error
Delete /REBOOTOK "$INSTDIR\libgpg-error${gpg_dll_num}-0.dll"

Delete "$INSTDIR\share\locale\de\LC_MESSAGES\libgpg-error.mo"
Delete "$INSTDIR\share\locale\pl\LC_MESSAGES\libgpg-error.mo"
Delete "$INSTDIR\share\locale\ro\LC_MESSAGES\libgpg-error.mo"
Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\libgpg-error.mo"

Delete "$INSTDIR\gpg-error.exe"
Delete "$INSTDIR\lib\libgpg-error.imp"
Delete "$INSTDIR\lib\libgpg-assuan.imp"
Delete "$INSTDIR\include\gpg-error.h"
RMDir "$INSTDIR\lib"
RMDir "$INSTDIR\include"

#######################################
### libassuan
Delete /REBOOTOK "$INSTDIR\libassuan${gpg_dll_num}-0.dll"
Delete "$INSTDIR\lib\libassuan.imp"
Delete "$INSTDIR\include\assuan.h"
RMDir "$INSTDIR\lib"
RMDir "$INSTDIR\include"

#######################################
### cyrus-sasl
Delete /REBOOTOK "$INSTDIR\libsasl2-3.dll"
Delete /REBOOTOK "$INSTDIR\lib\sasl2\libanonymous-3.dll"
Delete /REBOOTOK "$INSTDIR\lib\sasl2\libcrammd5-3.dll"
Delete /REBOOTOK "$INSTDIR\lib\sasl2\libdigestmd5-3.dll"
Delete /REBOOTOK "$INSTDIR\lib\sasl2\liblogin-3.dll"
Delete /REBOOTOK "$INSTDIR\lib\sasl2\libplain-3.dll"
RMDir "$INSTDIR\lib\sasl2"
RMDir "$INSTDIR\lib"

#######################################
### libetpan
Delete "$INSTDIR\libetpan-20.dll"

#######################################
### enchant
Delete "$INSTDIR\libenchant-1.dll"
Delete "$INSTDIR\lib\enchant\libenchant_myspell.dll"
RMDir "$INSTDIR\lib\enchant"
RMDir "$INSTDIR\lib"

Delete "$INSTDIR\share\enchant\myspell\en_US.aff"
Delete "$INSTDIR\share\enchant\myspell\en_US.dic"
Delete "$INSTDIR\share\enchant\myspell\de.aff"
Delete "$INSTDIR\share\enchant\myspell\de.dic"
Delete "$INSTDIR\share\enchant\myspell\fr.aff"
Delete "$INSTDIR\share\enchant\myspell\fr.dic"
RMDir "$INSTDIR\share\enchant\myspell"
RMDir "$INSTDIR\share\enchant"
RMDir "$INSTDIR\share"

#######################################
### libpng
Delete /REBOOTOK "$INSTDIR\libpng16-16.dll"

#######################################
### gettext
Delete /REBOOTOK "$INSTDIR\libintl-8.dll"
Delete /REBOOTOK "$INSTDIR\intl.dll"

#######################################
### bsfilter
Delete /REBOOTOK "$INSTDIR\bsfilterw.exe"
Delete /REBOOTOK "$INSTDIR\bsfilter.exe"
Delete /REBOOTOK "$INSTDIR\iconv.dll"

#######################################
### zlib
Delete /REBOOTOK "$INSTDIR\zlib1.dll"

#######################################
### w32pth
Delete "$INSTDIR\libw32pth-0.dll"

#######################################
### regex
Delete "$INSTDIR\libregex-1.dll"

#######################################
### pkgconfig
# Nothing to uninstall

#######################################
### libtasn1
Delete "$INSTDIR\libtasn1-6.dll"

#######################################
### libiconv
Delete /REBOOTOK "$INSTDIR\libiconv-2.dll"

#######################################
### crypt
Delete /REBOOTOK "$INSTDIR\crypt-0.dll"

#######################################
### bzip2
# Nothing to uninstall, as we link statically



### Final cleanup
Delete /REBOOTOK "$INSTDIR\libstdc++-6.dll"
Delete /REBOOTOK "$INSTDIR\${libgcc_dll}"
Delete /REBOOTOK "$INSTDIR\libwinpthread-1.dll"

# Remove the locale directories.
RMDir /r "$INSTDIR\share\locale"

# At this point, share subdirectory should be completely empty.
# We can RMDir it without /r.
RMDir "$INSTDIR\share"

RMDir "$INSTDIR"
SectionEnd



Section "-un.registry"
DeleteRegKey HKLM "SOFTWARE\Clients\Mail\Claws Mail"
DeleteRegKey HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto"
DeleteRegValue HKLM "SOFTWARE\RegisteredApplications" "Claws Mail"
DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ClawsMail"
SectionEnd



Section Uninstall
# Make sure that the context of the automatic variables has been set to
# the "all users" shell folder.  This guarantees that the menu gets written
# for all users.  We have already checked that we are running as Admin; or
# we printed a warning that installation will not succeed.
SetShellVarContext all

Delete "$INSTDIR\claws-mail-uninstall.exe"
Delete "$INSTDIR\VERSION"

# Start Menu
!insertmacro MUI_STARTMENU_GETFOLDER Application $MYTMP
Delete "$SMPROGRAMS\$MYTMP\*.lnk"

StrCpy $MYTMP "$SMPROGRAMS\$MYTMP"
startMenuDeleteLoop:
ClearErrors
RMDir $MYTMP
GetFullPathName $MYTMP "$MYTMP\.."
IfErrors startMenuDeleteLoopDone
StrCmp $MYTMP $SMPROGRAMS startMenuDeleteLoopDone startMenuDeleteLoop
startMenuDeleteLoopDone:

DeleteRegValue HKLM "Software\GNU\${PRETTY_PACKAGE_SHORT}" \
	"Start Menu Folder"

# Desktop and Quick Launch
Delete "$DESKTOP\Claws-Mail.lnk"
Delete "$QUICKLAUNCH\Claws-Mail.lnk"

# Try to remove other top directories.
RMDir "$INSTDIR\lib"
RMDir "$INSTDIR\include"
RMDir "$INSTDIR\share"
RMDir "$INSTDIR\pub"
RMDir "$INSTDIR\etc"
RMDir "$INSTDIR"

SectionEnd
