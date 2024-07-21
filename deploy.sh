#!/bin/bash
dotfiles=(zsh/.zshrc tmux/.tmux.conf)

for file in "${dotfiles[@]}"; do
        ln -svf $PWD/$file ~/
done
