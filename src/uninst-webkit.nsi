# uninst-webkit.nsi - Installer snippet for webkit.-*- coding: latin-1; -*-
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
!define prefix ${ipdir}/webkit-${gpg4win_pkg_webkit_version}


; Uninstaller section.
Section "-un.webkit"
!ifdef SOURCES
  Push "${gpg4win_pkg_webkit}"
  Call un.SourceDelete
!else

  Delete "$INSTDIR\libwebkitgtk-1.0-0.dll"
  RMDir "$INSTDIR"

  Delete "$INSTDIR\share\locale\pt_BR\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\pt_BR\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\pt_BR"
  Delete "$INSTDIR\share\locale\uk\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\uk\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\uk"
  Delete "$INSTDIR\share\locale\pt\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\pt\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\pt"
  Delete "$INSTDIR\share\locale\it\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\it\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\it"
  Delete "$INSTDIR\share\locale\es\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\es\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\es"
  Delete "$INSTDIR\share\locale\zh_CN\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\zh_CN\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\zh_CN"
  Delete "$INSTDIR\share\locale\nl\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\nl\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\nl"
  Delete "$INSTDIR\share\locale\cs\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\cs\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\cs"
  Delete "$INSTDIR\share\locale\ru\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\ru\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\ru"
  Delete "$INSTDIR\share\locale\sv\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\sv\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\sv"
  Delete "$INSTDIR\share\locale\de\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\de\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\de"
  Delete "$INSTDIR\share\locale\en_GB\LC_MESSAGES\webkit-2.0.mo"
  RMDir  "$INSTDIR\share\locale\en_GB\LC_MESSAGES"
  RMDir  "$INSTDIR\share\locale\en_GB"
  RMDir  "$INSTDIR\share\locale"

!endif
SectionEnd
