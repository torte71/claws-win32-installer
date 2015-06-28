# uninst-glib-networking.nsi - Installer snippet for glib-networking.-*- coding: latin-1; -*-
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
!define prefix ${ipdir}/glib-networking-${gpg4win_pkg_glib_networking_version}


; Uninstaller section.
Section "-un.glib-networking"
!ifdef SOURCES
  Push "${gpg4win_pkg_glib_networking}"
  Call un.SourceDelete
!else

  Delete "$INSTDIR\lib\gio\modules\libgiognutls.dll"
  RMDir "$INSTDIR\lib\gio\modules"
	RMDir "$INSTDIR\lib\gio"

!endif
SectionEnd
