#!/bin/zsh

curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh

jabba install adopt@1.11.0-9
jabba install 17.0.3-ms-openjdk=tgz+https://aka.ms/download-jdk/microsoft-jdk-17.0.3-macOS-aarch64.tar.gz

jabba alias default 17.0.3-ms-openjdk
jabba use 17.0.3-ms-openjdk
