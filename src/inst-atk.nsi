# inst-atk.nsi - Installer snippet for atk.        -*- coding: latin-1; -*-
# Copyright (C) 2005, 2008 g10 Code GmbH
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
!define prefix ${ipdir}/atk-${gpg4win_pkg_atk_version}

!ifdef DEBUG
Section "atk" SEC_atk
!else
Section "-atk" SEC_atk
!endif
  SetOutPath "$INSTDIR"
!ifdef SOURCES
  File ${gpg4win_pkg_atk}
!else
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

!endif
SectionEnd
