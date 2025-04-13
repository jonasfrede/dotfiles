# dotfiles

This is my small dotfile repository, first used together with the [Windows Subsystem for Linux (WSL)](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux "Wikipedia Explanation for WSL") and later for my laptop in combination with [Manjaro](https://manjaro.org/ "Manjaro Homepage") as well.

Both systems are based on [Arch Linux](https://www.archlinux.org/), but neither of them is pure Arch. If you want to install Arch Linux on your WSL, look into yuk7's Repository [ArchWSL](https://git.io/archwsl), at least that's how I did it some time ago.

Nowadays, I have switched to pure Arch (btw), so some dotfiles will probably follow in the future.

## Installation

This repository is currently designed to be cloned into your home directory, and then GNU Stow can be used to symlink all these dotfiles at once.

```bash
stow --verbose --dotfiles .
```

Alternatively, one can use the provided makefile, with either `make` or `make all`. To remove the symlinks, one can use `make delete` instead.
