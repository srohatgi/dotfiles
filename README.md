# Sumeet’s dotfiles

![Screenshot of my shell prompt](http://i.imgur.com/qLEfGBC.png)

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
$ git clone https://github.com/srohatgi/dotfiles.git && cd dotfiles 
$ git submodule init && git submodule update 
$ source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
$ source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
$ set -- -f; source bootstrap.sh
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Sumeet Rohatgi"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="srohatgi@mailinator.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/srohatgi/dotfiles/fork) instead, though.

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

### Vim Stuff

1. Install iTerm2
2. Install neovim ```brew install neovim```
3. Install fonts ```cd ~/dotfiles; ./install-fonts.sh; cd -```
4. Setup font (Inconsolata Powerline) on iTerm2, both "Font" and "Non Ascii Font"
5. Remove existing installation of nvim plugins ```rm -rf ~/.config/nvim```
6. Copy over Plug plugin manager ```curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim```
7. Install python 3.6.3 ```pyenv install 3.6.3```
  - if this fails, try ```xcode-select --install```
8. Make it global ```pyenv global 3.6.3 && pyenv rehash```
9. Install neovim pip package ```pip install neovim```
10. Copy over new vim stuff ```cat ~/dotfiles/.config/nvim/init.vim | sed "s/srohatgi/$(whoami)/g" > ~/.config/nvim/init.vim```
11. Open vim and run: ```:PlugInstall```

## Feedback

Suggestions/improvements
[welcome](https://github.com/srohatgi/dotfiles/issues)!

## Thanks to…

* Original author [Mathias Bynens](https://mathiasbynens.be/) 
