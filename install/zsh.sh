#!/bin/sh

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

echo Setting the default shell to zsh
chsh -s $(which zsh)