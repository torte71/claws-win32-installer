dnl gpg4win.m4 - macros to configure gpg4win.
dnl Copyright (C) 2005, 2009 g10 Code GmbH
dnl
dnl This file is part of GPG4Win.
dnl
dnl GPG4Win is free software; you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation; either version 2 of the License, or
dnl (at your option) any later version.
dnl
dnl GPG4Win is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl
dnl You should have received a copy of the GNU General Public License
dnl along with this program; if not, write to the Free Software
dnl Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
dnl MA 02110-1301, USA


# CM_DEFINE SYMBOL
# A poor man's version of AC_DEFINE_UNQUOTED for NSIS.
AC_DEFUN([CM_DEFINE],
[
  eval $1=\"\!define $1 1\"
  AC_SUBST($1)
])


# CM_BASH
# Gpg4Win needs bash.  This macro checks for it.
AC_DEFUN([CM_BASH],
[
  AC_MSG_CHECKING([for Bash])
  _bash=$BASH_VERSION
  if test -z "$_bash"; then
    _bash=no
  fi
  AC_MSG_RESULT($_bash)
  if test $_bash = no; then
    AC_MSG_ERROR("this configure script requires Bash")
  fi
])


# CM_PACKAGES
# Determines the path to the source and binary packages.
# Default is the "packages" directory in the source directory.
# The path is stored in the shell variable cm_packages.
AC_DEFUN([CM_PACKAGES],
[
  AC_MSG_CHECKING(for packages directory)
  _cm_packages_default=packages
  AC_ARG_WITH([packages],
    AS_HELP_STRING([--with-packages=DIR],
                   [source and binary packages [[packages]]]),
    cm_packages=$withval)
  AS_IF([test -z $cm_packages],
        [cm_packages=$_cm_packages_default])
  AS_IF([test `echo $cm_packages | head -c 1` != /],
        [cm_packages=`pwd`/$cm_packages])
  AC_SUBST(cm_packages)
  AC_MSG_RESULT($cm_packages)

  _cm_auto_detection=yes
])


# Should be called early.
AC_DEFUN([CM_INIT],
[
  # We call this here so its options appear before the per-package options.
  AC_REQUIRE([CM_PACKAGES])
])


# CM_FIND([FILE],[PATTERN],[ZIP|TAR],[DIR],[IF-FOUND],[IF-NOT-FOUND])
# Search for package file FILE in DIR.  If DIR is empty, yes or maybe,
# look in default directory.  If DIR is not maybe, abort if not found.
# The package file name is provided in cm_val and the version in
# cm_version.
AC_DEFUN([CM_FIND],
[
  AC_REQUIRE([CM_BASH])
  AC_REQUIRE([CM_PACKAGES])

  cm_val=
  cm_version=

  AC_MSG_CHECKING(for package $1)
  _cm_critical=yes
  _cm_file=
  _cm_dir=$4

  # Only check if critical or auto detection is requested.
  AS_IF([test $_cm_auto_detection = yes -o $_cm_critical = yes],
    [AS_IF([test -z "$_cm_dir" -o "$_cm_dir" = yes -o "$_cm_dir" = maybe],
          [_cm_dir=$cm_packages])

    # Install pattern.
    AS_IF([test -z "$2"], [_cm_pat='$1-\([[0-9]].*\)'],
	  [_cm_pat="$2"])

    # Frob pattern.  Regex party!
    [_cm_glob=`echo "$_cm_pat" | sed -e 's/\\\\(\(.*\)\\\\)/\1/'`]
    [_cm_glob=`echo "$_cm_glob" | sed -e 's/\\.\\*/*/'`]

    # Make non-matching globs expand to nothing.
    shopt -s nullglob

    _cm_format=both
    AS_IF([test ! -z "$3"], _cm_format="$3")

    AS_IF([test -z "$_cm_file" -a $_cm_format != zip],
          [_cm_file=`echo ${_cm_dir}/${_cm_glob}.tar.xz`
           _cm_suffix=.tar.xz])
    AS_IF([test -z "$_cm_file" -a $_cm_format != zip],
          [_cm_file=`echo ${_cm_dir}/${_cm_glob}.tar.bz2`
           _cm_suffix=.tar.bz2])
    AS_IF([test -z "$_cm_file" -a $_cm_format != zip],
          [_cm_file=`echo ${_cm_dir}/${_cm_glob}.tbz2`
           _cm_suffix=.tbz2])
    AS_IF([test -z "$_cm_file" -a $_cm_format != zip],
          [_cm_file=`echo ${_cm_dir}/${_cm_glob}.tbz`
           _cm_suffix=.tbz])
    AS_IF([test -z "$_cm_file" -a $_cm_format != zip],
          [_cm_file=`echo ${_cm_dir}/${_cm_glob}.tar.gz`
           _cm_suffix=.tar.gz])
    AS_IF([test -z "$_cm_file" -a $_cm_format != zip],
          [_cm_file=`echo ${_cm_dir}/${_cm_glob}.tgz`
           _cm_suffix=.tgz])
    AS_IF([test -z "$_cm_file" -a $_cm_format != tar],
          [_cm_file=`echo ${_cm_dir}/${_cm_glob}.zip`
           _cm_suffix=.zip])
    shopt -u nullglob])

  AS_IF([test -z "$_cm_file"],
        AC_MSG_RESULT(no),
	AS_IF([test `echo $_cm_file | head -c 1` != /],
              [_cm_file=`pwd`/$_cm_file])
        AC_MSG_RESULT($_cm_file))
  AS_IF([test -z "$_cm_file" -a $_cm_critical = yes],
        AC_MSG_ERROR(could not find sources for $1 in $_cm_dir))

  # Test for duplicate.
  _cm_found=
  for _cm_f in $_cm_file; do
      AS_IF([test "$_cm_found" = yes],
            [AC_MSG_WARN(found more than one sources for $1 in $_cm_dir)
             cm_dup_sources="$cm_dup_sources $1"])
      _cm_found=yes
  done

  AS_IF([test ! -z "$_cm_file"],
        [cm_val="$_cm_file"
 	[cm_version=`echo "$cm_val" | sed -e "s,^.*/${_cm_pat}${_cm_suffix}$,\1,"`]
         [$5]],
        [$6])
])

AC_DEFUN([CM_CHECK_EXDEPS],
[
  AC_REQUIRE([CM_CHECK_DEPS])

  AC_MSG_CHECKING([additional host build list])

  cm_build_ex_list=`echo $_cm_ex_deps | tsort`
  # Remove newlines.
  cm_build_ex_list=`echo $cm_build_ex_list`
  AC_MSG_RESULT($cm_build_ex_list)
  AC_SUBST(cm_build_ex_list)

  # Check each dependency.
  _cm_not_found=
  _cm_d=
  _cm_p=
  for _cm_p in $_cm_ex_deps; do
    AS_IF([test -z $_cm_d], [_cm_d=$_cm_p],
          [
            _cm_found=
            for _cm_i in $_cm_pkgs; do
              AS_IF([test $_cm_d = $_cm_i],
                    _cm_found=yes
                    break)
            done
            AS_IF([test -z $_cm_found],
                  AC_MSG_WARN(could not find ex variant of package $_cm_d required by package $_cm_p)
                  _cm_not_found=yes)
            _cm_d=
          ])
  done
  AS_IF([test ! -z "$_cm_not_found"],
        AC_MSG_ERROR([could not find some required packages]))
])

AC_DEFUN([CM_CHECK_DEPS],
[
  AC_MSG_CHECKING(build list)
  cm_build_list=`echo $_cm_deps | tsort`
  # Remove newlines.
  cm_build_list=`echo $cm_build_list`
  AC_MSG_RESULT($cm_build_list)
  AC_SUBST(cm_build_list)

  # Check each dependency.
  _cm_not_found=
  _cm_d=
  _cm_p=
  for _cm_p in $_cm_deps; do
    AS_IF([test -z $_cm_d], [_cm_d=$_cm_p],
          [
            _cm_found=
            for _cm_i in $_cm_pkgs; do
              AS_IF([test $_cm_d = $_cm_i],
                    _cm_found=yes
                    break)
            done
            AS_IF([test -z $_cm_found],
                  AC_MSG_WARN(could not find package $_cm_d required by package $_cm_p)
                  _cm_not_found=yes)
            _cm_d=
          ])
  done
  AS_IF([test ! -z "$_cm_not_found"],
        AC_MSG_ERROR([could not find some required packages]))
])


AC_DEFUN([CM_FINALIZE],
[
  AC_REQUIRE([CM_CHECK_EXDEPS])

  _cm_debug=no
  AC_ARG_ENABLE([debug],
    AS_HELP_STRING([--enable-debug], [enable debugging [[no]]]),
    _cm_debug=$enableval)

  AS_IF([test "${_cm_debug}" != no],
    CM_DEFINE(CM_DEBUG))
])


# CM_IPKG([PKG],[DEPENDS],[IF-FOUND],[IF-NOT-FOUND])
# Set up the internal package PKG.
# It is provided in cm_val.
AC_DEFUN([CM_IPKG],
[
  AC_REQUIRE([CM_INIT])
  AC_MSG_CHECKING([for internal package $1])
  _cm_pkg=maybe
  AC_ARG_ENABLE([pkg-$1],
    AS_HELP_STRING([--enable-pkg-$1[=DIR]],
                   [include internal package $1]),
    _cm_pkg=$enableval,
    _cm_pkg=yes)

  # cm_pkg_PKGNAME_deps=DEPS
  cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps="$2"
  AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps)

  AC_MSG_RESULT($_cm_pkg)

  AS_IF([test "$_cm_pkg" != no],
    _cm_pkgs="$_cm_pkgs $1"
    CM_DEFINE(HAVE_PKG_[]m4_translit([$1],[a-z+-],[A-Z__]))
    # Record dependencies.  Also enter every package as node.
    _cm_deps="$_cm_deps $1 $1"
    AS_IF([test ! -z "$2"],
          for _cm_i in $2; do
            _cm_deps="$_cm_deps $_cm_i $1"
          done)
      [$3],
      [$4])
])



# CM_SPKG([PKG],[DEPENDS],[IF-FOUND],[IF-NOT-FOUND])
# Set up the source package PKG.
# It is provided in cm_val.
AC_DEFUN([CM_SPKG],
[
  AC_REQUIRE([CM_INIT])
  _cm_pkg=maybe
  _cm_spkg=no
  _cm_version=
  AS_IF([test "$_cm_pkg" != no],
        [CM_FIND($1,,, $_cm_pkg,
	 _cm_spkg=$cm_val
	 _cm_version=$cm_version)])

  # At this point, _cm_spkg is no, or the actual package source file.

  # cm_pkg_PKGNAME=FILENAME_OF_SOURCE
  cm_pkg_[]m4_translit([$1],[-+],[__])[]=$_cm_spkg
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__]))

  # cm_pkg_PKGNAME_version=VERSION
  cm_pkg_[]m4_translit([$1],[-+],[__])[]_version=$_cm_version
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_version)

  # cm_pkg_PKGNAME_deps=DEPS
  cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps="$2"
  AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps)

  AS_IF([test "$_cm_spkg" != no],
    _cm_pkgs="$_cm_pkgs $1"
    CM_DEFINE(HAVE_PKG_[]m4_translit([$1],[a-z+-],[A-Z__]))
    # Record dependencies.  Also enter every package as node.
    _cm_deps="$_cm_deps $1 $1"
    AS_IF([test ! -z "$2"],
          for _cm_i in $2; do
            _cm_deps="$_cm_deps $_cm_i $1"
          done)
      [$3],
      [$4])
])


# CM_SPKGEX([PKG],[DEPENDS],[IF-FOUND],[IF-NOT-FOUND])
# Set up the source package PKG to be additionally built
# for the host provided as additional-gpgex-host
AC_DEFUN([CM_SPKGEX],
[
  CM_SPKG([$1],[$2],[$3],[$4])

  AS_IF([test ! -z "$GPGEX_ADD_HOST"],

    # cm_pkg_PKGNAME_deps=DEPS
    cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_ex_deps="$2"
    AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_ex_deps)

    cm_ex_pkgs="$cm_ex_pkgs $1"

    CM_DEFINE(HAVE_PKG_[]m4_translit([$1],[a-z+-],[A-Z__])_EX)
    # Record dependencies.  Also enter every package as node.
    _cm_ex_deps="$_cm_ex_deps $1 $1"
    AS_IF([test ! -z "$2"],
          for _cm_i in $2; do
            _cm_ex_deps="$_cm_ex_deps $_cm_i $1"
          done)
  )
])

# CM_BPKG_GNUWIN32([PKG],[DEPENDS],[IF-FOUND],[IF-NOT-FOUND])
# Set up the gnuwin32 package PKG.
# It is provided in cm_val.
AC_DEFUN([CM_BPKG_GNUWIN32],
[
  AC_REQUIRE([CM_INIT])
  _cm_pkg=maybe
  AC_ARG_ENABLE([pkg-$1],
    AS_HELP_STRING([--enable-pkg-$1[=DIR]],
                   [include package $1]),
    _cm_pkg=$enableval)
  _cm_bpkg=no
  _cm_version=
  AS_IF([test "$_cm_pkg" != no],
        [CM_FIND($1-bin, [$1-\(.*\)-bin],,
         $_cm_pkg,
         _cm_bpkg=$cm_val
	 _cm_version=$cm_version)])

  # At this point, _cm_bpkg is no, or the actual package source file.

  # cm_pkg_PKGNAME=FILENAME_OF_BINARY
  cm_pkg_[]m4_translit([$1],[-+],[__])[]=$_cm_bpkg
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__]))

  # cm_pkg_PKGNAME_version=VERSION
  cm_pkg_[]m4_translit([$1],[-+],[__])[]_version=$_cm_version
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_version)

  # cm_pkg_PKGNAME_deps=DEPS
  cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps="$2"
  AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps)

  AS_IF([test "$_cm_bpkg" != "no" ],
    CM_FIND($1-lib, [$1-\(.*\)-lib],,
                 $_cm_pkg, _cm_bpkg=$cm_val,
       AC_MSG_ERROR(can not find development package for package $1))
    # cm_pkg_PKGNAME_dev=FILENAME_OF_BINARY_DEVEL
    cm_pkg_[]m4_translit([$1],[-+],[__])[]_dev=$_cm_bpkg
    AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_dev)

    CM_FIND($1-src, [$1-\(.*\)-src],,
                 $_cm_pkg, _cm_bpkg=$cm_val,
       AC_MSG_ERROR(can not find sources for package $1))
    # cm_pkg_PKGNAME_src=FILENAME_OF_SOURCE
    cm_pkg_[]m4_translit([$1],[-+],[__])[]_src=$_cm_bpkg
    AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_src)

    # FIXME: Add a version consistency check here.  All three packages
    # must match!

    CM_DEFINE(HAVE_PKG_[]m4_translit([$1],[a-z+-],[A-Z__]))

    _cm_pkgs="$_cm_pkgs $1"
    # Record dependencies.  Also enter every package as node.
    _cm_deps="$_cm_deps $1 $1"
    AS_IF([test ! -z "$2"],
          for _cm_i in $2; do
	    _cm_deps="$_cm_deps $_cm_i $1"
          done)
          [$3],
          [$4])
])

# CM_BPKG_GNUWIN32_LIB([PKG],[DEPENDS],[IF-FOUND],[IF-NOT-FOUND])
# Set up the gnuwin32 package PKG.  This is a static only library version.
# It is provided in cm_val.
AC_DEFUN([CM_BPKG_GNUWIN32_LIB],
[
  AC_REQUIRE([CM_INIT])
  _cm_pkg=maybe
  AC_ARG_ENABLE([pkg-$1],
    AS_HELP_STRING([--enable-pkg-$1[=DIR]],
                   [include package $1]),
    _cm_pkg=$enableval)
  _cm_bpkg=no
  _cm_version=
  AS_IF([test "$_cm_pkg" != no],
        [CM_FIND($1-lib, [$1-\(.*\)-lib],,
         $_cm_pkg,
         _cm_bpkg=$cm_val
	 _cm_version=$cm_version)])

  # At this point, _cm_bpkg is no, or the actual package source file.

  # cm_pkg_PKGNAME=FILENAME_OF_BINARY
  cm_pkg_[]m4_translit([$1],[-+],[__])[]=$_cm_bpkg
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__]))

  # cm_pkg_PKGNAME_version=VERSION
  cm_pkg_[]m4_translit([$1],[-+],[__])[]_version=$_cm_version
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_version)

  AS_IF([test "$_cm_bpkg" != no],
    CM_FIND($1-src, [$1-\(.*\)-src],,
                 $_cm_pkg, _cm_bpkg=$cm_val,
       AC_MSG_ERROR(can not find sources for package $1))
    # cm_pkg_PKGNAME_src=FILENAME_OF_SOURCE
    cm_pkg_[]m4_translit([$1],[-+],[__])[]_src=$_cm_bpkg
    AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_src)

    # FIXME: Add a version consistency check here.  All two packages
    # must match!

    CM_DEFINE(HAVE_PKG_[]m4_translit([$1],[a-z+-],[A-Z__]))

    _cm_pkgs="$_cm_pkgs $1"
    # Record dependencies.  Also enter every package as node.
    _cm_deps="$_cm_deps $1 $1"
    AS_IF([test ! -z "$2"],
          for _cm_i in $2; do
	    _cm_deps="$_cm_deps $_cm_i $1"
          done)
          [$3],
          [$4])
])


# CM_BPKG_GTK([PKG],[DEPENDS],[IF-FOUND],[IF-NOT-FOUND])
# Set up the Gtk binary package PKG.
# It is provided in cm_val.
AC_DEFUN([CM_BPKG_GTK],
[
  AC_REQUIRE([CM_INIT])
  _cm_pkg=maybe
  AC_ARG_ENABLE([pkg-$1],
    AS_HELP_STRING([--enable-pkg-$1[=DIR]],
                   [include package $1]),
    _cm_pkg=$enableval)
  _cm_bpkg=no
  _cm_version=
  AS_IF([test "$_cm_pkg" != no],
        [CM_FIND($1,,zip, $_cm_pkg,
         _cm_bpkg=$cm_val
	 _cm_version=$cm_version)])

  # At this point, _cm_bpkg is no, or the actual package source file.

  # cm_pkg_PKGNAME=FILENAME_OF_BINARY
  cm_pkg_[]m4_translit([$1],[-+],[__])[]=$_cm_bpkg
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__]))

  # cm_pkg_PKGNAME_version=VERSION
  cm_pkg_[]m4_translit([$1],[-+],[__])[]_version=$_cm_version
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_version)

  # cm_pkg_PKGNAME_deps=DEPS
  cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps="$2"
  AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps)

  AS_IF([test "$_cm_bpkg" != no],
    [CM_FIND($1,,tar, $_cm_pkg, _cm_bpkg=$cm_val,
       AC_MSG_ERROR(can not find sources for package $1))]
    # cm_pkg_PKGNAME_src=FILENAME_OF_SOURCE
    cm_pkg_[]m4_translit([$1],[-+],[__])[]_src=$_cm_bpkg
    AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_src)

    # FIXME: Add a version consistency check here.  All three packages
    # must match!

    CM_DEFINE(HAVE_PKG_[]m4_translit([$1],[a-z+-],[A-Z__]))

    _cm_pkgs="$_cm_pkgs $1"
    # Record dependencies.  Also enter every package as node.
    _cm_deps="$_cm_deps $1 $1"
    AS_IF([test ! -z "$2"],
          for _cm_i in $2; do
	    _cm_deps="$_cm_deps $_cm_i $1"
          done)
          [$3],
          [$4])
])


# CM_BPKG_GTK_DEV([PKG],[DEPENDS],[IF-FOUND],[IF-NOT-FOUND])
# Set up the Gtk library package PKG.
# It is provided in cm_val.
AC_DEFUN([CM_BPKG_GTK_DEV],
[
  AC_REQUIRE([CM_INIT])
  _cm_pkg=maybe
  AC_ARG_ENABLE([pkg-$1],
    AS_HELP_STRING([--enable-pkg-$1[=DIR]],
                   [include package $1]),
    _cm_pkg=$enableval)
  _cm_bpkg=no
  _cm_version=
  AS_IF([test "$_cm_pkg" != no],
        [CM_FIND($1,,zip, $_cm_pkg,
         _cm_bpkg=$cm_val
	 _cm_version=$cm_version)])

  # At this point, _cm_bpkg is no, or the actual package source file.

  # cm_pkg_PKGNAME=FILENAME_OF_BINARY
  cm_pkg_[]m4_translit([$1],[-+],[__])[]=$_cm_bpkg
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__]))

  # cm_pkg_PKGNAME_version=VERSION
  cm_pkg_[]m4_translit([$1],[-+],[__])[]_version=$_cm_version
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_version)

  # cm_pkg_PKGNAME_deps=DEPS
  cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps="$2"
  AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps)

  AS_IF([test "$_cm_bpkg" != no],
    [CM_FIND($1-dev,,, $_cm_pkg, _cm_bpkg=$cm_val,
       AC_MSG_ERROR(can not find development package for package $1))]
    # cm_pkg_PKGNAME_dev=FILENAME_OF_BINARY_DEVEL
    cm_pkg_[]m4_translit([$1],[-+],[__])[]_dev=$_cm_bpkg
    AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_dev)

    [CM_FIND($1,,tar, $_cm_pkg, _cm_bpkg=$cm_val,
       AC_MSG_ERROR(can not find sources for package $1))]
    # cm_pkg_PKGNAME_src=FILENAME_OF_SOURCE
    cm_pkg_[]m4_translit([$1],[-+],[__])[]_src=$_cm_bpkg
    AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_src)

    # FIXME: Add a version consistency check here.  All three packages
    # must match!

    CM_DEFINE(HAVE_PKG_[]m4_translit([$1],[a-z+-],[A-Z__]))

    _cm_pkgs="$_cm_pkgs $1"
    # Record dependencies.  Also enter every package as node.
    _cm_deps="$_cm_deps $1 $1"
    AS_IF([test ! -z "$2"],
          for _cm_i in $2; do
	    _cm_deps="$_cm_deps $_cm_i $1"
          done)
          [$3],
          [$4])
])


# CM_BPKG_GNU([PKG],[DEPENDS],[IF-FOUND],[IF-NOT-FOUND])
# Set up the source package PKG.
# It is provided in cm_val.
AC_DEFUN([CM_BPKG_GNU],
[
  AC_REQUIRE([CM_INIT])
  _cm_pkg=maybe
  AC_ARG_ENABLE([pkg-$1],
    AS_HELP_STRING([--enable-pkg-$1[=DIR]],
                   [include package $1]),
    _cm_pkg=$enableval)
  _cm_bpkg=no
  _cm_version=

  AS_IF([test "$_cm_pkg" != no],
        [
          # For some shameful reason, the gettext package is actually called
          # gettext-runtime!
          AS_IF([test $1 = gettext],
	        [CM_FIND($1-runtime,,zip, $_cm_pkg,
 		             _cm_bpkg=$cm_val
		 	     _cm_version=$cm_version)],
		[CM_FIND($1,,zip, $_cm_pkg,
 		             _cm_bpkg=$cm_val
		 	     _cm_version=$cm_version)])
	])

  # At this point, _cm_bpkg is no, or the actual package source file.

  # cm_pkg_PKGNAME=FILENAME_OF_BINARY
  cm_pkg_[]m4_translit([$1],[-+],[__])[]=$_cm_bpkg
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__]))

  # cm_pkg_PKGNAME_version=VERSION
  cm_pkg_[]m4_translit([$1],[-+],[__])[]_version=$_cm_version
  AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_version)

  # cm_pkg_PKGNAME_deps=DEPS
  cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps="$2"
  AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps)

  AS_IF([test "$_cm_bpkg" != no],
    [CM_FIND($1,,tar, $_cm_pkg, _cm_bpkg=$cm_val,
       AC_MSG_ERROR(can not find sources for package $1))]
    # cm_pkg_PKGNAME_src=FILENAME_OF_SOURCE
    cm_pkg_[]m4_translit([$1],[-+],[__])[]_src=$_cm_bpkg
    AC_SUBST(cm_pkg_[]m4_translit([$1],[-+],[__])[]_src)

    # FIXME: Add a version consistency check here.  All two packages
    # must match!

    CM_DEFINE(HAVE_PKG_[]m4_translit([$1],[a-z+-],[A-Z__]))

    _cm_pkgs="$_cm_pkgs $1"
    # Record dependencies.  Also enter every package as node.
    _cm_deps="$_cm_deps $1 $1"
    AS_IF([test ! -z "$2"],
          for _cm_i in $2; do
	    _cm_deps="$_cm_deps $_cm_i $1"
          done)
          [$3],
          [$4])
])


# CM_BPKG_BINSRC([PKG],[DEPENDS],[IF-FOUND],[IF-NOT-FOUND])
# Set up package PKG which is expected to be delivered as two ZIP files
# with a "-(src|source)" and a "-(bin|noinstaller)" suffix.
AC_DEFUN([CM_BPKG_BINSRC],
[
  AC_REQUIRE([CM_INIT])
  _cm_pkg=maybe
  AC_ARG_ENABLE([pkg-$1],
    AS_HELP_STRING([--enable-pkg-$1[=DIR]],
                   [include package $1]),
    _cm_pkg=$enableval)
  _cm_bpkg=no
  _cm_version=
  AS_IF([test "$_cm_pkg" != no],
        [CM_FIND($1-bin, [$1-\(.*\)-bin],,
         $_cm_pkg,
         _cm_bpkg=$cm_val
	 _cm_version=$cm_version)])
  AS_IF([test "$_cm_pkg" != no -a "$_cm_bpkg" = no],
        [CM_FIND($1-noinstaller, [$1-\(.*\)-noinstaller],,
         $_cm_pkg,
         _cm_bpkg=$cm_val
	 _cm_version=$cm_version)])

  # At this point, _cm_bpkg is no, or the actual package binary file.

  # cm_pkg_PKGNAME=FILENAME_OF_BINARY
  cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]=$_cm_bpkg
  AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__]))

  # cm_pkg_PKGNAME_version=VERSION
  cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_version=$_cm_version
  AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_version)

  # cm_pkg_PKGNAME_deps=DEPS
  cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps="$2"
  AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_deps)

  AS_IF([test "$_cm_bpkg" != no],
    tmp_binsrc=yes
    CM_FIND($1-src, [$1-\(.*\)-src],,
                 $_cm_pkg, _cm_bpkg=$cm_val, tmp_binsrc=no)
    if test $tmp_binsrc = no ; then
       CM_FIND($1-source, [$1-\(.*\)-source],,
                    $_cm_pkg, _cm_bpkg=$cm_val,
                    AC_MSG_ERROR(can not find sources for package $1))
    fi
    # cm_pkg_PKGNAME_src=FILENAME_OF_SOURCE
    cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_src=$_cm_bpkg
    AC_SUBST(cm_pkg_[]m4_translit([$1],[A-Z+-],[a-z__])[]_src)

    # FIXME: Add a version consistency check here.  Both packages
    # must match!

    CM_DEFINE(HAVE_PKG_[]m4_translit([$1],[a-z+-],[A-Z__]))

    _cm_pkgs="$_cm_pkgs []m4_translit([$1],[A-Z],[a-z])"
    # Record dependencies.  Also enter every package as node.
    _cm_deps="$_cm_deps []m4_translit([$1],[A-Z],[a-z]) []m4_translit([$1],[A-Z],[a-z])"
    AS_IF([test ! -z "$2"],
          for _cm_i in $2; do
	    _cm_deps="$_cm_deps $_cm_i []m4_translit([$1],[A-Z],[a-z])"
          done)
          [$3],
          [$4])
])

