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

alias r='bundle exec rails'
alias b='bundle exec'
alias c='bundle exec cap'
alias gs='bundle exec guard start'
alias f='git flow feature'
alias release='git flow release'
alias mig='bundle exec rake db:migrate db:test:prepare'
alias rk='bundle exec rake'
alias ss='script/server'
alias sc='script/console'
alias sg='script/generate'
alias bi='bundle install --standalone --binstubs bundle/bin'

set -o vi

export EDITOR='vim'
export VISUAL='vim'

export CUCUMBER_FORMAT=Cucumber::Formatter::Fuubar
export RSPEC_FORMAT=Fuubar


complete -o default -o nospace -F __git_flow_feature f
complete -o default -o nospace -F __git_flow_release release

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh" && nvm use default > /dev/null

[[ -s "$HOME/.amazon_keys" ]] && source "$HOME/.amazon_keys"
[[ -s "$HOME/.control_services_credentials" ]] && source "$HOME/.control_services_credentials"
[[ -s "$HOME/.photo_gallery_facebook_secret" ]] && source "$HOME/.photo_gallery_facebook_secret"

if [ `uname` == "Darwin" ]; then
  PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/robin/.rvm/bin
  alias vi='mvim'
  alias vim='mvim -v'
  export EDITOR='mvim -v'
  export GIT_EDITOR='mvim -v'
  export VISUAL='mvim'
  alias start_pow="launchctl load $HOME/Library/LaunchAgents/cx.pow.powd.plist"
  alias stop_pow="launchctl unload $HOME/Library/LaunchAgents/cx.pow.powd.plist"

  # bash completion (homebrew style)
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi

  # autojump
  if [ -f `brew --prefix`/etc/autojump.sh ]; then
      . `brew --prefix`/etc/autojump.sh
  fi

  # https://github.com/defunkt/hub
  eval `hub alias -s bash`

else
  source /etc/profile.d/autojump.bash
  PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
  alias vi='gvim'
  alias ack='ack-grep'
  export BUNDLER_EDITOR=gvim
fi
