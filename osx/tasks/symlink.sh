#!/bin/bash

source ~/.dotfiles/common/functions.sh

DOTFILE_DIR=$HOME/.dotfiles

DOTFILES=(
    "zsh"
    "git"
    "neovim"
    "alacritty"
    "tmux"
    "emacs"
    "editorconfig"
)

cd $DOTFILE_DIR

for dotfile in "${DOTFILES[@]}";do
    msg_checking "Linking file to $HOME/${dotfile}"
    stow $dotfile
done
