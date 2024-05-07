#
# ~/.bash_aliases
#

# simple program changes
alias screenfetch='fastfetch '
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
alias funcommit='curl -s whatthecommit.com | sed -n "s/^<p>//p"'
