#!/bin/bash

. ~/.bash_colors

# git prompt goodnes
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=verbose
PS1="${COLOR_RED}[${COLOR_WHITE}\t ${COLOR_NONE}\W${COLOR_GREEN}\$(__git_ps1 ' (%s)')${COLOR_RED}]${COLOR_NONE}\$ "

# ruby optimizations
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

function name_tab() {
  echo -ne "\033]0;$1\007"
}

set -o vi

export EDITOR='vim'
export VISUAL='vim'

export CUCUMBER_FORMAT=Cucumber::Formatter::Fuubar
export RSPEC_FORMAT=Fuubar

complete -o default -o nospace -F __git_flow_feature f
complete -o default -o nospace -F __git_flow_release release


[[ -s `brew --prefix`/etc/autojump.sh ]] && source `brew --prefix`/etc/autojump.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh" && nvm use default > /dev/null

[[ -s "$HOME/.amazon_keys" ]] && source "$HOME/.amazon_keys"
[[ -s "$HOME/.control_services_credentials" ]] && source "$HOME/.control_services_credentials"
[[ -s "$HOME/.photo_gallery_facebook_secret" ]] && source "$HOME/.photo_gallery_facebook_secret"

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/robin/:/usr/local/rvm/bin:/Users/robin/.rvm

export EDITOR='mvim -v'
export GIT_EDITOR='mvim -v'
export VISUAL='mvim'

# bash completion (homebrew style)
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# https://github.com/defunkt/hub
eval `hub alias -s bash`

source ~/.bash_aliases
