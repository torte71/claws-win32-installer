#!/bin/bash

# getgit-claws-mail - Builds a claws package from git repo
#                     Integrates it into claws-installer
# Copyright (C) 1999-2021 the Claws Mail team and Hiroyuki Yamamoto
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.


############################################################
# config section

# REVISION: Name of branch, tag or hash to check out
#           Unset, to check out the main branch
REVISION="gtk3"

# TMPGIT: Custom directory for the checkout
#         If not set (default), system tempdir is used
#TMPGIT="./tmpgit"


############################################################
# No configurable parts below here

PKG_CURRENT="packages.current"

create_package () {
  local logfile="$0.log"
  echo "Creating tarball for Claws-Mail REVISION=${REVISION:-(unset)} in $TMPGIT"
  echo "This may take a while, output is redirected to $logfile"
  [ -e "$logfile" ] && rm "$logfile"
  git clone https://git.claws-mail.org/readonly/claws.git "$TMPGIT" > "$logfile" 2>&1
  ( cd "$TMPGIT" ;
    [ -z "$REVISION" ] || git checkout $REVISION
    ./autogen.sh && ./configure && make dist-xz ) > "$logfile" 2>&1
  local pkgtmp=$(ls "$TMPGIT"/claws-mail-*.tar.xz)
  PKGNAME=$(basename "$pkgtmp")
  cp "$pkgtmp" .
  echo "Created $PKGNAME"
  rm -rf "$TMPGIT"
}

remove_old_packages () {
  echo "Removing old packages"
  # Remove old packages (from packages.current and filesystem)
  grep "^file\W\+claws-mail-" $PKG_CURRENT| while read header file ; do
    # Comment out all previous packages (and rename the files)
    echo "Removing file=$file"
    local error=0
    if [ -e "$file" ]; then
      local checksum=$(sha256sum $file|cut -d " " -f 1)
      echo "Removing chk=$checksum"
      # Comment out checksum for that file
      sed -i "/^chk\W\+$checksum/ s/.*/#&/" "$PKG_CURRENT"
      # Rename old file
      mv "$file" "_$file"
    else
      echo "File not found: $file"
      echo "The checksum line for that file can't be calculated."
      echo "Please remove the stray \"chk ...\" line manually from $PKG_CURRENT"
      echo "(should be somewhere below a line \"#$header $file\")."
      echo
      error=1
    fi
    # Comment out file reference
    sed -i "/^$header\W\+$file/ s/.*/#&/" "$PKG_CURRENT"
    return $error
  done
  # check previous return value (here we can bail out)
  local res=$?
  [[ "$res" -gt 0 ]] && exit $res
}

add_new_package () {
  echo "Adding new package"
  if ! [ -e "$PKGNAME" ] ; then
    echo "Error: Package "$PKGNAME" not found."
    exit 1
  fi

  # Add new package to packages.current
  local server_regex="^server\W\+https:\/\/www.claws-mail.org\/releases"
  local checksum=$(sha256sum $PKGNAME|cut -d " " -f 1)
  local pkglines="file $PKGNAME\nchk  $checksum"
  if grep -q "$server_regex" "$PKG_CURRENT" ; then
    # Put after old "server" line
    sed -i "/$server_regex/ s/.*/&\n\n$pkglines/" "$PKG_CURRENT"
  else
    # No old "server" line found. Add a new one to bottom.
    echo -e "#\n# claws-mail itself\n#\n\n$pkglines" >> "$PKG_CURRENT"
  fi
}

check_dirs () {
  TMPGIT=${TMPGIT:-$(mktemp -d)}
  local testfile="$TMPGIT/test"
  if [ ! -d "$TMPGIT" ] && ! mkdir -p $TMPGIT ; then
    echo "ERROR: Directory missing and cannot be created: $TMPGIT"
    exit 2
  elif ! echo -e "#!/bin/sh\necho Exec test passed" > "$testfile" ; then
    echo "ERROR: Cannot write to: $TMPGIT"
    exit 3
  elif ! ( chmod +x "$testfile" && "$testfile" ) ; then
    echo "ERROR: No execute permission in: $TMPGIT"
    exit 4
  else
    rm "$testfile"
  fi
}

############################################################

check_dirs
remove_old_packages
create_package
add_new_package

