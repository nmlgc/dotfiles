Nmlgc's dotfiles
----------------
A collection of configuration files for the programs I use on both Linux and
Windows. These follow the [XDG Base Directory Specification] where possible,
with the root of this repository corresponding to `$XDG_CONFIG_HOME`.

### Setup ###

	./setup.sh

This should be run after every update to the repository (clone, pull, merge,
etc.), or if the repository's *absolute* directory is moved.

If the dotfiles are already installed, this has no effect. Any existing dotfiles
for programs covered by this repository are backed up by `ln`, then overwritten.

### To Do ###
* Port Visual Studio color scheme to Vim
* Package installation for Cygwin (using
  [apt-cyg](https://github.com/transcode-open/apt-cyg)), MSYS2, Debian, and Arch
* Packages: tmux, Unifont, fbterm, vim, …
* Differentiate by OS, only install what's necessary
* asoundrc
* Windows programs (foobar2000, Notepad++, Sublime Text, Visual Studio)

----

[XDG Base Directory Specification]: https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
