#!/bin/zsh

echo 'Fetching rvm gpg keys'

command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

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
