# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# Path to your oh-my-zsh installation.
  export ZSH=/home/rmad/.oh-my-zsh
# Set 256 colors support
  export TERM="xterm-256color"
# import aliases
  source ~/.aliases
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="robbyrussell"

# powelevel9k settings
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(nodeenv virtualenv rbenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='009' 
POWERLEVEL9K_DIR_HOME_BACKGROUND='037' 
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='037' 

# virtualenv
POWERLEVEL9K_VIRTUALENV_FOREGROUND='226' 
POWERLEVEL9K_VIRTUALENV_BACKGROUND='004' 

# rbenv
POWERLEVEL9K_RBENV_FOREGROUND='007' 

# If VCS changes are detected:
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='204'

POWERLEVEL9K_MODE='awesome-fontconfig'

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
ENABLE_CORRECTION="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(debian)
plugins=(git-flow)
plugins=(npm)
plugins=(pip)
plugins=(node)
plugins=(rbenv)
plugins=(virtualenv)

# User configuration

  export PATH="/home/rmad/anaconda3/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/rmad/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

# Search func
function search {
   grep -irl \
       --exclude=\*.{pyc,swp,un~,png,jpg} \
       --exclude-dir=".git" \
       --exclude-dir="node_modules" \
       --exclude-dir="bower_components" \
       --exclude-dir="dist" \
       --exclude-dir="tmp" \
       --exclude-dir=".sass_cache" \
       --exclude-dir="Appknox" \
       --exclude-dir="build" \
       --color "$*" .
}

#z jump around dir
. /home/rmad/repos/scripts/z/z.sh

# VirtualenvWrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# hub - Github cli
eval "$(hub alias -s)"
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by Anaconda3 4.1.1 installer
export PATH="/home/rmad/.anaconda3/bin:$PATH"
