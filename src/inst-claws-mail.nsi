# inst-claws-mail.nsi - Installer snippet for Claws. -*- coding: latin-1; -*-
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


!ifdef prefix
!undef prefix
!endif
!define prefix ${ipdir}/claws-mail-${gpg4win_pkg_claws_mail_version}

LangString T_SetDefaultClient ${LANG_ENGLISH} \
     "Do you want to make Claws Mail your default mail client?"

${MementoSection} "Claws-Mail" SEC_claws_mail
	SectionIn RO

  SetOutPath "$INSTDIR"
!ifdef SOURCES
  File "${gpg4win_pkg_claws_mail}"
!else
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

  MessageBox MB_YESNO "$(T_SetDefaultClient)" IDNO skip_default_client

#register user's default client

  WriteRegStr   HKCU "SOFTWARE\Classes\mailto" "" "URL:MailTo-Protocol"
  WriteRegStr   HKCU "SOFTWARE\Classes\mailto" "URL Protocol" ""
  WriteRegDword HKCU "SOFTWARE\Classes\mailto" "EditFlags" 2
  WriteRegStr   HKCU "SOFTWARE\Classes\mailto" "FriendlyTypeName" "Claws-Mail URL"
  WriteRegStr   HKCU "SOFTWARE\Classes\mailto\DefaultIcon" "" "$INSTDIR\claws-mail.exe,0"
  WriteRegStr   HKCU "SOFTWARE\Classes\mailto\shell\open\command" "" "$INSTDIR\claws-mail.exe --compose %1"
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
!endif
${MementoSectionEnd}


LangString DESC_SEC_claws_mail ${LANG_ENGLISH} \
   "Claws Mail-User-Agent"

LangString DESC_Menu_claws_mail ${LANG_ENGLISH} \
   "Run the Claws mailprogram."

LangString DESC_Menu_claws_mail_pdf ${LANG_ENGLISH} \
   "Show the online manual of Claws Mail"
