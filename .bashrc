#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

# USE NEOVIM FOR VIM IF PRESENT.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# MERGE NEW SETTINGS
alias merge="xrdb -merge ~/.Xresources"

# ALIASES FOR SOFTWARE MANAGMENT
# PACMAN OR YAY
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syu'
alias upaur="yay -Sua"

# GRUB UPDATE
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# ADD NEW FONTS
alias update-fc='sudo fc-cache -fv'

# CLEANUP ORPHANED PACKAGES
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# GET THE ERROR MESSAGES FROM JOURNALCTL
alias jctl="journalctl -p 3 -xb"

# GIVE THE LIST OF ALL INSTALLED DESKTOPS - XSESSIONS DESKTOPS
alias xd="ls /usr/share/xsessions"

# BARE GIT REPOSITORY
alias config='/usr/bin/git --git-dir=/home/stn29a/.cfg/ --work-tree=/home/stn29a'

# YOUTUBE-DL
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# SHUTDOWN OR REBOOT
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# BINDINGS FOR HISTORY SEARCH
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# IGNORE UPPER AND LOWERCASE WHEN TAB COMPLETION
bind "set completion-ignore-case on"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"

# FZF
#[ -f "/usr/share/fzf/key-bindings.bash" ] && source "/usr/share/fzf/key-bindings.bash"
#[ -f "/usr/share/fzf/completion.bash" ] && source "/usr/share/fzf/completion.bash" 

# USE LF TO SWITCH DIRECTORIES AND BIND IT TO CTRL-O
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

##---------- STARSHIP PROMPT ----------##
eval "$(starship init bash)"
