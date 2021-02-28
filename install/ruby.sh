#!/bin/zsh

echo 'Fetching rvm gpg keys'
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

echo 'Installing rvm & latest stable ruby'
curl -sSL https://get.rvm.io | bash -s stable --ruby

rvm install 3.0 && rvm use 3.0

source $HOME/.rvm/scripts/rvm

echo "gem: --no-document" > ~/.gemrc

echo 'Updating system-level gems'
gem update —system

echo 'Installing bundler'
gem install bundler

echo 'Installing listed gems'
bundle install --system --gemfile=Gemfile --jobs=$(sysctl -n hw.ncpu) --retry=3
