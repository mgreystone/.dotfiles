export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=mgreystone
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode context dir vcs)

plugins=(git npm python docker docker-compose)

source $ZSH/oh-my-zsh.sh

source ~/.config/zsh-git-prompt/zshrc.sh

export EDITOR='nvim'

alias vi='nvim'
alias vimdiff='nvim -d'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias claude="$HOME/bin/_claude"
alias codex="$HOME/bin/_codex"
alias wm=workmux
eval "$(workmux completions zsh)"

export AWS_FUZZ_USER=mgreystone
export GPG_TTY=$(tty)
export DO_NOT_TRACK=true
export GH_TELEMETRY=false
export ENABLE_LSP_TOOL=1

export NVM_DIR=~/.nvm
export NVM_SYMLINK_CURRENT=true
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH=~/bin:~/.local/bin:$PATH

bindkey -v
export KEYTIMEOUT=20
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
