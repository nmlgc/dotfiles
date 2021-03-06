#!/bin/sh
ROOT=$(dirname $0)

# Git
# ---
git config --global user.name "nmlgc"
git config --global user.email "nmlgc@nmlgc.net"
git config --global core.quotePath false
# Make rebasing easier (automatically stash changes
# and automatically squash commits created with --fixup)
git config --global rebase.autostash true
git config --global rebase.autosquash true

# Launch a one-off git server from any local repository.
# (via https://gist.github.com/datagrok/5080545)
git config --global alias.serve "daemon \
	--verbose --export-all --base-path=.git --reuseaddr --strict-paths .git/"
# ---

setup_vars() {
	FILE_IN_HOME=~/$(basename $1)
	TARGET_OLD=$(readlink -f $FILE_IN_HOME)
}

# Symlink everything that doesn't honor $XDG_CONFIG_HOME.
link_file() {
	setup_vars $1

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

# Remove things that once didn't support $XDG_CONFIG_HOME, but now do.
remove_old() {
	setup_vars $1

	if [ $TARGET_OLD != $FILE_IN_HOME ] && [ ! -f $TARGET_OLD ]; then
		rm $FILE_IN_HOME
	fi
}

remove_old .minttyrc
