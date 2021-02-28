#!/bin/zsh

echo 'Generating a new SSH Key'
echo 'Enter your Github email address: '
read GITHUB_EMAIL_ADDRESS

SSH_DIR=$HOME/.ssh
mkdir -p $SSH_DIR

ssh-keygen -t rsa -b 4096 -C "$GITHUB_EMAIL_ADDRESS" -f $SSH_DIR/id_rsa
eval "$(ssh-agent -s)"
ssh-add -K $SSH_DIR/id_rsa
cat $SSH_DIR/id_rsa.pub | pbcopy

echo 'Copying public key to clipboard. Paste it into your Github account...'
open 'https://github.com/account/ssh'

read -p 'Press enter to continue.'

echo 'Verifying key exists on Github'
ssh -T git@github.com
