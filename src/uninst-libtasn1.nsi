# uninst-libtasn1.nsi - Installer snippet for libtasn1.-*- coding: latin-1; -*-
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
!define prefix ${ipdir}/libtasn1-${gpg4win_pkg_libtasn1_version}


; Uninstaller section.
Section "-un.libtasn1"
!ifdef SOURCES
  Push "${gpg4win_pkg_libtasn1}"
  Call un.SourceDelete
!else

  Delete "$INSTDIR\libtasn1-6.dll"
  RMDir "$INSTDIR"

!endif
SectionEnd
