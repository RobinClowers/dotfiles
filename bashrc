#!/bin/bash

. ~/.bash_colors

# git prompt goodnes
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=verbose
PS1="${COLOR_RED}[${COLOR_WHITE}\t ${COLOR_NONE}\W${COLOR_GREEN}\$(__git_ps1 ' (%s)')${COLOR_RED}]${COLOR_NONE}\$ "

# ruby optimizations
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

function name_tab() {
  echo -ne "\033]0;$1\007"
}

export EDITOR='vim'
export VISUAL='vim'

export CUCUMBER_FORMAT=Cucumber::Formatter::Fuubar
export RSPEC_FORMAT=Fuubar
export GOPATH=$HOME

complete -o default -o nospace -F __git_flow_feature f
complete -o default -o nospace -F __git_flow_release release


# set path for homebrew
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# add Heroku Toolbelt to path
PATH=/usr/local/heroku/bin:$PATH

# add go bin to path
PATH=$HOME/bin:$PATH

# add subscript to path
PATH=$HOME/.subscript/bin:$PATH

# add imagemagick6 to path
PATH=/usr/local/opt/imagemagick@6/bin:$PATH
export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"

[[ -s `brew --prefix`/etc/autojump.sh ]] && source `brew --prefix`/etc/autojump.sh
[[ -s "$HOME/.asdf/asdf.sh" ]] && source "$HOME/.asdf/asdf.sh"
[[ -s "$HOME/.asdf/completions/asdf.bash" ]] && source "$HOME/.asdf/completions/asdf.bash"
# [[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh" && nvm use default > /dev/null
# [[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "$HOME/.amazon_keys" ]] && source "$HOME/.amazon_keys"
[[ -s "$HOME/.control_services_credentials" ]] && source "$HOME/.control_services_credentials"
[[ -s "$HOME/.photo_gallery_facebook_secret" ]] && source "$HOME/.photo_gallery_facebook_secret"

# load direnv
eval "$(direnv hook bash)"

export EDITOR='mvim -v'
export GIT_EDITOR='mvim -v'
export VISUAL='mvim'

# bash completion (homebrew style)
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# fancy alias for git from: https://github.com/aaronjensen/dotfiles
function g {
  if [[ $# > 0 ]]; then
    hub "$@"
  else
    git status -sb
  fi
}
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g


source ~/.bash_aliases
