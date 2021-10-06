# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#env variables
export ZSH="/home/dchanana/.oh-my-zsh"
if [ "$SHLVL" = 1 ]; then
	export PATH="$PATH:/home/dchanana/.scripts/:/home/dchanana/.cargo/bin"
fi
export TERM=xterm-256color
export EDITOR=nvim

#zsh options
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_TMUX_AUTOSTART=false
setopt no_beep

#plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions virtualenv tmux vi-mode common-aliases fancy-ctrl-z)
source $ZSH/oh-my-zsh.sh
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

#custom aliases
alias l="ls -la"
alias diskspace="sudo du | sort -nr | head -n"

alias mux="tmuxinator"
alias vim="nvim"
alias emacs="emacs -nw"

alias ZZ="exit"
alias ZQ="exit"
alias gg="ga . && gc && gp"

alias psu="sudo pacman -S"
alias psyu="sudo pacman -Syu"
alias psyyu="sudo pacman -Syyu"
alias prsc="sudo pacman -Rsc"

#tmux setup
tmux new-session -s dev -d 2>/dev/null
alias tmuxn='tmux new-session -s $$ -t dev -d; tmux a -t $$'
_trap_exit() { tmux kill-session -t $$}
trap _trap_exit EXIT

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
