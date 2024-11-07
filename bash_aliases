#
# ~/.bash_aliases
#

# simple program changes
alias neofetch='fastfetch '
alias python='python3 '

# download and play random youtube video from watch later playlist
alias watchlater='mpv --shuffle --ytdl-raw-options="cookies-from-browser=firefox,yes-playlist=" "https://youtube.com/playlist?list=WL"'

# If you forget to sudo
alias please='sudo $(history -p !!)'

# Not destroying your stuff with dd
protect_my_sdX () {
  for p in "${@}"; do
    lsblk -lpn | grep -q "^${p#*=} " &&
    { echo "Not that one, you idiot!"
      return; }
  done
  dd $@
}

alias dd='protect_my_sdX'

# Going back one folder
alias ..='cd ..'
alias ...=' cd ../..'
alias ....=' cd ../../..'
alias .....=' cd ../../../..'

# Display my IP
alias myip='curl http://ipecho.net/plain; echo'

# Scan IPs in local network
alias ipscan='sudo arp-scan --localnet'

# Funny commit messages
alias funcommit='curl -s https://www.whatthecommit.com | sed -n "s/^<p>//p" | sed -n "s/<\/p>//p"'

# cleanup of unnecessary packages
alias yc='yay -Rns $(yay -Qtdq)'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# exa (ls replacement) alias
alias l='eza -alF --icons --git'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
