#!/bin/sh
ROOT=$(dirname $0)

# Git
# ---
git config --global user.name "nmlgc"
git config --global user.email "nmlgc@nmlgc.net"
# ---

# Symlink everything that doesn't honor $XDG_CONFIG_HOME.
link_file() {
	FILE_IN_HOME=~/$(basename $1)
	TARGET_OLD=$(readlink -f $FILE_IN_HOME)

	cmp --silent "$TARGET_OLD" "$1"
	EQUAL=$?

	if [ $EQUAL = 1 ]; then
		ln -vs --backup=numbered $1 $FILE_IN_HOME
	else
		# No backups if we're merely changing the path of this repository.
		ln -fs $1 $FILE_IN_HOME
	fi
}

for f in $(find $ROOT/non-xdg/ -not -type d -not -wholename $0); do
	link_file $(readlink -f $f)
done
