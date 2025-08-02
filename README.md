# dotfiles

This is my small dotfile repository, first used together with the [Windows Subsystem for Linux (WSL)](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux "Wikipedia Explanation for WSL") and later for my laptop in combination with [Manjaro](https://manjaro.org/ "Manjaro Homepage") as well.

Both systems are based on [Arch Linux](https://www.archlinux.org/), but neither of them is pure Arch. If you want to install Arch Linux on your WSL, look into yuk7's Repository [ArchWSL](https://git.io/archwsl), at least that's how I did it some time ago.

Nowadays, I have switched to pure Arch (btw), so some dotfiles will probably follow in the future.

## Dependencies

- git
- stow
- make (optional)
- yay (an AUR helper)

All dependencies except for Yay can be installed via

```bash
sudo pacman -S git stow make
```

For instructions on Yay, please refer to [its git repository](https://github.com/Jguer/yay).

## Usage

This repository is currently designed to be cloned into your home directory, and then GNU Stow can be used to symlink all these dotfiles at once.

```bash
	stow --verbose --dotfiles --restow .
```

Alternatively, one can use the provided makefile, with either `make` or `make all`. To remove the symlinks, one can use `make delete` instead. There is also `make install`, which installs all packages listed in `PACKAGES.txt` using bash and yay.

## TODO

- [ ] Add better autoinstallation script for Arch Linux
- [ ] Add more distinctions for different target systems
- [ ] Add .config folders for more programs
- [ ] Add a script to automatically update the package list from the system
- [ ] Add functionality (maybe via cron job or similar) to automatically update the packages from the system
- [ ] Add a script to automatically backup the dotfiles (and maybe even the packages) to a remote repository in regular intervals
- [ ] Add a script to automatically update the dotfiles from a remote repository regularly
