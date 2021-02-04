#env variables
export ZSH="/home/dchanana/.oh-my-zsh"

export PATH="$PATH:/home/dchanana/scripts/"
export TERM=xterm-256color
export EDITOR=vim

#zsh options
ZSH_THEME="powerlevel10k/powerlevel10k"
setopt no_beep

#plugins
plugins=(git fancy-ctrl-z zsh-syntax-highlighting zsh-autosuggestions virtualenv)
source $ZSH/oh-my-zsh.sh
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

#custom aliases
alias l="ls -la" lg="ls -la | grep"
alias diskspace="sudo du | sort -nr | head -n"

alias ZZ="exit"
alias gg="ga . && gc && gp"

alias psu="sudo pacman -S"
alias psyu="sudo pacman -Syu"
alias psyyu="sudo pacman -Syyu"
alias prsc="sudo pacman -Rsc"

# startup commands
. optimus
~/scripts/update
