all:
	stow --verbose --dotfiles --restow .

install:
	stow --verbose --dotfiles --restow .
	bash dot-scripts/install_packages.sh

delete:
	stow --verbose --dotfiles --delete .
