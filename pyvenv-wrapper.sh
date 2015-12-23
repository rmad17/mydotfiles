#! /bin/sh
#
# pyvenv-wrapper.sh
# Copyright (C) 2015 rmad <souravbasu17@gmail.com> 
#
# Distributed under terms of the MIT license.
#



# Wrappers for pyvenv
#
# Source in .bashrc via 'source pyvenv-wrapper.sh'

PYVENV_DIR=$HOME/.pyvenv
PYVENV_BIN=pyvenv-3.4

function py-create-venv {
  mkdir -p $PYVENV_DIR
  $PYVENV_BIN $PYVENV_DIR/$1
}

function py-activate-venv {
  source $PYVENV_DIR/$1/bin/activate
}

function py-delete-venv {
  rm -rf $PYVENV_DIR/$1
}

function _py-complete-venv()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls $PYVENV_DIR/)" -- $cur) )
}

complete -F _py-complete-venv py-activate-venv
complete -F _py-complete-venv py-delete-venv

