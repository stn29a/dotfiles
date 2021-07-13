#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##---------- ALIASES ----------##

# EXA
alias ls='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'

# GREP
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# PROMPT AND INFO
alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -Iv'

alias v="nvim" 

# BARE GIT REPOSITORY
alias config='/usr/bin/git --git-dir=/home/stn29a/.cfg/ --work-tree=/home/stn29a'

# BINDINGS FOR HISTORY SEARCH
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

##---------- STARSHIP PROMPT ----------##
eval "$(starship init bash)"

##---------- NEOFETCH ----------##
pfetch
