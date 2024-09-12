# Path to your oh-my-zsh installation.
export ZSH=/Users/mgreystone/.oh-my-zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=mgreystone
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode context dir vcs)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export WORKON_HOME=~/.virtualenvs

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm python brew macos docker docker-compose)

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

source ~/.config/zsh-git-prompt/zshrc.sh
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval `gdircolors ~/.config/dircolors-solarized/dircolors.ansi-dark`

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias egrep='egrep --colour=auto'
alias fgrep='frep --colour=auto'
alias grep='grep --colour=auto'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias l='gls -lah --color=tty'
alias la='gls -lAh --color=tty'
alias ll='gls -lh --color=tty'
alias ls='gls --color=tty'
alias lsa='gls -lah --color=tty'
alias vi='nvim'
alias vimdiff='nvim -d'
alias sed='gsed'

alias rise='art --on rise-stage dev --'
alias a360='art --on 360-stage dev --'
alias legacy='art --on legacy-stage dev --'

fpath=(/usr/local/share/zsh-completions $fpath)

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export NVM_DIR=~/.nvm
export NVM_SYMLINK_CURRENT=true
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export MONO_GAC_PREFIX="/usr/local"

# source $(brew --prefix nvm)/nvm.sh
# emulate zsh -c '. $(brew --prefix nvm)/etc/bash_completion.d/nvm'
# eval $(grunt --completion=zsh)

if [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH=/usr/local/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# source $(gem path tmuxinator)/completion/tmuxinator.zsh
# alias mux=tmuxinator

export NDK_ROOT=/opt/android-ndk-r11c


# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/usr/local/src/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/usr/local/src
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/usr/local/src/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/opt/android-sdk-macosx
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.7/bin
export PATH=$ANT_ROOT:$PATH

## Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
#export COCOS_CONSOLE_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/tools/cocos2d-console/bin
#export PATH=$COCOS_CONSOLE_ROOT:$PATH
#
## Add environment variable COCOS_X_ROOT for cocos2d-x
#export COCOS_X_ROOT=/Applications/Cocos/Cocos2d-x
#export PATH=$COCOS_X_ROOT:$PATH
#
## Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
#export COCOS_TEMPLATES_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/templates
#export PATH=$COCOS_TEMPLATES_ROOT:$PATH

eval "$(thefuck --alias)"

concon () {
  case "$1" in
    "prod") profile=prod ;;
    "stage") profile=default ;;
  esac
  ip=$(aws ec2 --profile $profile describe-instances --filters "Name=tag:App,Values=$2" "Name=instance-state-name,Values=running" --query 'Reservations[0].Instances[0].PrivateIpAddress' --output text)
  echo "connecting to $ip"
  ssh -t $ip concon ${@:3}
}

export NPM_TOKEN=`cat ~/.npmrc | grep //registry.npmjs.org/:_authToken | tr "=" "\n" | tail -n 1`
export FONT_AWESOME_NPM_AUTH_TOKEN=`cat ~/.npmrc | grep //npm.fontawesome.com/:_authToken | tr "=" "\n" | tail -n 1`

export AWS_FUZZ_USER=mgreystone
export GPG_TTY=$(tty)

bindkey -v
export KEYTIMEOUT=20
bindkey -M viins 'jk' vi-cmd-mode
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# export HUSKY_SKIP_HOOKS=1
# export HUSKY_SKIP_INSTALL=1

alias frell=fuck
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=~/bin:$PATH

# pnpm
export PNPM_HOME="/Users/mgreystone/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
