# Load zgen
echo "Sourcing zgen"
source "$HOME/.zgen/zgen.zsh"

ZSH_DISABLE_COMPFIX=true

echo "Sourcing additional configurations"
for config ($HOME/.zsh/*.zsh) source $config

# if the init scipt doesn't exist
if ! zgen saved; then
  echo "Registering zgen plugins"
  zgen oh-my-zsh

  # Set the theme
  # zgen oh-my-zsh themes/mrtazz
  zgen oh-my-zsh themes/robbyrussell
  # Autosuggestions
  zgen load zsh-users/zsh-autosuggestions

  # Brew autocompletion
  zgen oh-my-zsh plugins/brew

  # `cat` syntax highlighting
  zgen oh-my-zsh plugins/colorize

  # Autocompletion
  zgen oh-my-zsh plugins/compleat

  # Git autofill
  zgen oh-my-zsh plugins/git-extras

  # Git aliases
  zgen oh-my-zsh plugins/git

  zgen oh-my-zsh plugins/kubectl

  # Gitignore downloader
  zgen oh-my-zsh plugins/gitignore

  # Esc twice to put sudo in front of the command
  zgen oh-my-zsh plugins/sudo

  # yarn autocompletion
  zgen g-plane/zsh-yarn-autocompletions

  # nvm autocompletion
  zgen load lukechilds/zsh-nvm

  # generate the init script from plugins above
  zgen save
fi

[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh" && jabba use 17.0.3-ms-openjdk

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add gcloud to PATH
export PATH="$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"

# Add go binaries to path
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="/usr/local/sbin:$PATH"

# Add yarn binaries to path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GPG_TTY=$(tty)
fpath=(/usr/local/share/zsh-completions $fpath)

