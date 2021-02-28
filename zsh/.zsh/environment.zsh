export EDITOR=nvim
export VISUAL=nvim

export LC_COLLATE=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8
export LC_MESSAGES=en_GB.UTF-8
export LC_MONETARY=en_GB.UTF-8
export LC_NUMERIC=en_GB.UTF-8
export LC_TIME=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8
export LESSCHARSET=utf-8

export RUBYOPT=-W:no-deprecated

export GOPATH=$HOME/go
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$(python3 -m site --user-base)/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# export PATH="$(python -m site --user-base)/bin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=~/Library/Fonts"
export ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc ${HOME}/.zshrc.local)
export GPG_TTY=$(tty)
