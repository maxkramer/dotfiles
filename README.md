# Dotfiles

Will replicate my entire personal development env from scratch.

- Sets up ZSH as the default shell
- Sets up Homebrew; installs brew formulas and cask apps/fonts
- Sets up and configures Ruby, Go and Python (2 & 3)
- Sets up docker-compose with a Postgres instance (+ Postgis)
- Sets up nvim as the text editor
- Sets up new SSH keys
- Configures the system with a set of OSX & machine-level (hostname etc) preferences
- and much much more...

Prerequisites:
- Login to Mac App Store
- Ensure that there are no spaces in your username!
 
Usage:
```bash
    $ git clone git@github.com:maxkramer/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ sh install.sh
```
