#!/bin/bash
# Tamper with existing files appropriately

# .bashrc
# Inspect .bashrc for previous tampering
# Append accordingly if it's not been tampered with

if ! grep -q "# tampered with by .dotfiles" ~/.bashrc ; then
    printf "\n# tampered with by .dotfiles\n\
for f in ~/.dotfiles/bashrc/*; do source \$f; done\n\
for f in ~/.dotfiles/all_sh/*; do source \$f; done" >> ~/.bashrc
fi

if ! grep -q "# tampered with by .dotfiles" ~/.zshrc ; then
    printf "\n# tampered with by .dotfiles\nfor f in ~/.dotfiles/zshrc/*; \ndo source \$f; done\nfor f in ~/.dotfiles/all_sh/*; \ndo source; \$f done" >> ~/.zshrc
fi

# link .dotfiles/dot/* in ~/

for f in ~/.dotfiles/dot/*
do
    ln -s $f "$HOME/.$(basename $f)"
done
