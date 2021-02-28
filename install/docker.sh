#!/bin/zsh

open -a "Docker"
read -p "Ensure that Docker App is running, then hit enter. "

echo "Creating container for Postgres with Postgis extensions"

docker-compose -f $HOME/.dotfiles/docker/docker-compose.yml up -d 
