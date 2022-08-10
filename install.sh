#!/bin/sh

ln -fs ~/dotfiles/.aliases.zsh ~/.aliases.zsh
ln -fs ~/dotfiles/.env.zsh ~/.env.zsh
ln -fs ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -fs ~/dotfiles/.zshrc ~/.zshrc
ln -fs ~/dotfiles/.gitconfig ~/.gitconfig

source ~/.zshrc
source-rc
