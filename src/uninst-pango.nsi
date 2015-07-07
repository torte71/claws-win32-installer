# uninst-pango.nsi - Installer snippet for pango.   -*- coding: latin-1; -*-
# Copyright (C) 2005 g10 Code GmbH
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
!define prefix ${ipdir}/pango-${gpg4win_pkg_pango_version}


; Uninstaller section.
Section "-un.pango"
!ifdef SOURCES
  Push "${gpg4win_pkg_pango}"
  Call un.SourceDelete
!else
  Delete /REBOOTOK "$INSTDIR\libpango-1.0-0.dll"
  Delete /REBOOTOK "$INSTDIR\libpangoft2-1.0-0.dll"
  Delete /REBOOTOK "$INSTDIR\libpangowin32-1.0-0.dll"
  Delete /REBOOTOK "$INSTDIR\libpangocairo-1.0-0.dll"

# Remove stuff from old Pango versions.
  Delete "$INSTDIR\etc\pango\pango.modules"
  Delete "$INSTDIR\etc\pango\pango.aliases"
  RMDir "$INSTDIR\etc\pango"
  RMDir "$INSTDIR\etc"

  Delete "$INSTDIR\lib\pango\1.4.0\modules\pango-arabic-fc.dll"
  Delete "$INSTDIR\lib\pango\1.4.0\modules\pango-basic-fc.dll"
  Delete "$INSTDIR\lib\pango\1.4.0\modules\pango-basic-win32.dll"
  Delete "$INSTDIR\lib\pango\1.4.0\modules\pango-hangul-fc.dll"
  Delete "$INSTDIR\lib\pango\1.4.0\modules\pango-hebrew-fc.dll"
  Delete "$INSTDIR\lib\pango\1.4.0\modules\pango-indic-fc.dll"
  Delete "$INSTDIR\lib\pango\1.4.0\modules\pango-khmer-fc.dll"
  Delete "$INSTDIR\lib\pango\1.4.0\modules\pango-syriac-fc.dll"
  Delete "$INSTDIR\lib\pango\1.4.0\modules\pango-thai-fc.dll"
  Delete "$INSTDIR\lib\pango\1.4.0\modules\pango-tibetan-fc.dll"
  RMDir "$INSTDIR\lib\pango\1.4.0\modules"
  RMDir "$INSTDIR\lib\pango\1.4.0"
  RMDir "$INSTDIR\lib\pango"
  RMDir "$INSTDIR\lib"

!endif
SectionEnd
