# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Shorten $pwd
short_pwd() {
    cwd=$(pwd | perl -F/ -ane 'print join( "/", map { $i++ < @F - 1 ?  substr $_,0,1 : $_ } @F)')
    echo -n $cwd
}

# Append current git branch in prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]❤\[\033[01;32m\]➤➤\[\033[1;35m\]\w\[\033[1;33m\]$(parse_git_branch)\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions

alias aginstall='sudo apt-get install'
alias agremove='sudo apt-get remove'
alias agpurge='sudo apt-get purge'
alias agupdate='sudo apt-get update'
alias agupgrade='sudo apt-get upgrade'
alias agautoremove='sudo apt-get autoremove'
alias agautoclean='sudo apt-get autoclean'

alias palmdetect='synclient PalmDetect=1 PalmMinWidth=5 PalmMinZ=20'

alias py='python'
alias ipy='ipython'
alias py3='python3'
alias ipy3='ipython3'

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Debian disk iso alias
#  Disabled because I am using Linux Mint
# alias deb1='sudo mount -t iso9660 -o loop /media/work/Debian/debian-8.0.0-amd64-DVD-1.iso /media/cdrom && sudo apt-cdrom -d=/media/cdrom add'
# alias deb2='sudo mount -t iso9660 -o loop /media/work/Debian/debian-8.0.0-amd64-DVD-2.iso /media/cdrom && sudo apt-cdrom -d=/media/cdrom add'
# alias deb3='sudo mount -t iso9660 -o loop /media/work/Debian/debian-8.0.0-amd64-DVD-3.iso /media/cdrom && sudo apt-cdrom -d=/media/cdrom add'

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/repos
source /usr/local/bin/virtualenvwrapper.sh

#Appknox

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by Anaconda3 2.4.1 installer
export PATH="/home/rmad/anaconda3/bin:$PATH"

#z jump around dir
. /home/rmad/repos/scripts/z/z.sh

source /usr/local/lib/python2.7/dist-packages/pyvenvwrapper/pyvenvwrapper_settings
source /usr/local/lib/python2.7/dist-packages/pyvenvwrapper/pyvenvwrapper

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# added by Anaconda3 4.1.1 installer
export PATH="/home/rmad/.anaconda3/bin:$PATH"
