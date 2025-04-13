all:
	stow --verbose --dotfiles --restow .

delete:
	stow --verbose --dotfiles --delete .
