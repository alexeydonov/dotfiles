#!/usr/bin/env zsh
mkdir -p $HOME/.local/share
mkdir -p $HOME/.zshrc.d

if [[ ! -d $HOME/.local/share/antidote ]]; then
	git clone --depth=1 https://github.com/mattmc3/antidote.git $HOME/.local/share/antidote
fi

if [[ ! -d $HOME/.dotfiles ]]; then
	git clone git@github.com:alexeydonov/dotfiles.git $HOME/.dotfiles
fi

cd $HOME/.dotfiles

stow --dotfiles --restow "$@"

cd -
