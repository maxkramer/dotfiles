alias rm=trash
alias vi=nvim
alias vim=nvim
alias cat=bat
alias serv='python -m SimpleHTTPServer'
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dotf="cd ~/.dotfiles"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias cp='cp -v'
alias mv='mv -v'
alias flush='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
function ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

# $ size dir1 file2.js
function size() {
  # du -sh "$@" 2>&1 | grep -v '^du:' | sort -nr
  du -shck "$@" | sort -rn | awk '
      function human(x) {
          s="kMGTEPYZ";
          while (x>=1000 && length(s)>1)
              {x/=1024; s=substr(s,2)}
          return int(x+0.5) substr(s,1,1)
      }
      {gsub(/^[0-9]+/, human($1)); print}'
}

function mkcd() {
	mkdir -p "$@" && cd "$_";
}

function listening() {
	lsof -nP -i4TCP:"$@" | grep LISTEN
}

alias d="docker-compose -f $HOME/.dotfiles/docker/docker-compose.yml"
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdpo='kd pod'
alias kgpo='kubectl get pod'
alias kl='kubectl logs'

function alike() {
	cd ~/Desktop/Personal/Alike/$@;
}

function maha() {
	cd ~/Projects/maha/$@;
}

function ten() {
	cd ~/Projects/tenera/$@;
}

function tsmg() {
	  TIMESTAMP=$(date '+%Y%m%d%H%M%S')
	  FILE_NAME="src/main/resources/db/migration/V"$TIMESTAMP"__$1.sql"
	      echo "Creating migration file $FILE_NAME"
	        touch $FILE_NAME
	}

alias awsume=". awsume"
