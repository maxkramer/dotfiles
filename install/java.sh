#!/bin/zsh

curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh

jabba install adopt@1.8.0-275 
jabba install adopt@1.11.0-9 

jabba use adopt@1.11.0-9
