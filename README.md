## Pixelhandler's Dotfiles

Inspired by and borrowed from https://github.com/mathiasbynens/dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork
this repository, review the code, and remove things you don’t want or need.
Don’t blindly use my settings. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want (I like `~/dotfiles`).
The bootstrapper script will pull in the latest version and copy the files to
your home folder.

```bash
git clone https://github.com/pixelhandler/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/pixelhandler/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE.txt}
```

To update later on, just run that command again.

### User bin

The `bin` directory has some tools and scripts, e.g. `z.sh` and install
script for Homebrew, NVM, pyenv, etc.

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew] formulae: 

```bash
./bin/brew.sh
```
[Homebrew]: http://brew.sh/ 

## Thanks to

- https://github.com/mathiasbynens/dotfiles
- https://github.com/toranb/dotfiles

