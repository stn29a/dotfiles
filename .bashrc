#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bind '"\C-o":"lfcd\C-m"'

##---------- ALIASES ----------##

# EXA
alias ls='exa -al --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons'

# GREP
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# READABLE OUTPUT
alias df='df -Th'

# PROMPT AND INFO
alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -Iv'

alias v="nvim" 

# MERGE NEW SETTINGS
alias merge="xrdb -merge ~/.Xresources"

# ALIASES FOR SOFTWARE MANAGMENT
# PACMAN OR YAY
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'
alias upall="yay -Syu"

# GRUB UPDATE
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# ADD NEW FONTS
alias update-fc='sudo fc-cache -fv'

# CLEANUP ORPHANED PACKAGES
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# GET THE ERROR MESSAGES FROM JOURNALCTL
alias jctl="journalctl -p 3 -xb"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# BARE GIT REPOSITORY
alias config='/usr/bin/git --git-dir=/home/stn29a/.cfg/ --work-tree=/home/stn29a'

# BINDINGS FOR HISTORY SEARCH
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# IGNORE UPPER AND LOWERCASE WHEN TAB COMPLETION
bind "set completion-ignore-case on"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"

# FZF
#[ -f "/usr/share/fzf/key-bindings.bash" ] && source "/usr/share/fzf/key-bindings.bash"
#[ -f "/usr/share/fzf/completion.bash" ] && source "/usr/share/fzf/completion.bash" 

##---------- STARSHIP PROMPT ----------##
eval "$(starship init bash)"

