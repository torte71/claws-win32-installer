# inst-webkit.nsi - Installer snippet for webkit.        -*- coding: latin-1; -*-
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

!ifdef prefix
!undef prefix
!endif
!define prefix ${ipdir}/webkit-${gpg4win_pkg_webkit_version}

!ifdef DEBUG
Section "webkit" SEC_webkit
!else
Section "-webkit" SEC_webkit
!endif
  SetOutPath "$INSTDIR"
!ifdef SOURCES
  File ${gpg4win_pkg_webkit}
!else

  File ${prefix}/bin/libwebkitgtk-1.0-0.dll

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

!endif
SectionEnd
