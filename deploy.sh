#!/bin/bash

# setup dotfiles
dotfiles=(zsh/.zshrc tmux/.tmux.conf)

for file in "${dotfiles[@]}"; do
        ln -svf $PWD/$file ~/
done

# setup app config dirs
apps=(alacritty zellij)

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

for app in "${apps[@]}"; do
  TARGET_DIR=~/.config/$app

  if [ -d $TARGET_DIR ]; then
    mv $TARGET_DIR $TARGET_DIR.backup
  fi

  ln -s $PWD/$app $TARGET_DIR
done
