#!/bin/zsh

mkdir -p ~/.gnupg
echo 'pinentry-program /usr/local/bin/pinentry-mac' > ~/.gnupg/gpg-agent.conf
echo 'use-agent' > ~/.gnupg/gpg.conf

chmod 700 ~/.gnupg
git config --global gpg.program $(which gpg)
