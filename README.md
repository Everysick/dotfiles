# dotfiles

The dotfiles Everysick uses.
(based dotfile: koba789)

## How to Use

1. Clone this repository by ghq

```
$ git clone https://github.com/Everysick/dotfiles.git ~/src/github.com/Everysick/dotfiles
```
2. Run make

```
$ cd ~/src/github.com/Everysick/dotfiles && make all
```

## Warning

This Makefile overwrites these files in $HOME: `.emacs` `.tmux.conf` `.zshrc` `.gitconfig` `.gitignore` `.emacs.d/**`. Back up the files if you need.

In default, the user profile in `.gitconfig` is everysick's. Please rewrite it according to your own profile.
