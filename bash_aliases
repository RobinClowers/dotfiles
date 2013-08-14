#!/bin/bash

alias vi='mvim -v'
alias vim='mvim'

# ruby
alias z='`[ -e .zeus.sock ] && echo zeus || echo SAD: Zeus is not running 1>&2`'
alias zb='`[ -e .zeus.sock ] && echo zeus || echo bundle exec`'
alias zs='(bundle check > /dev/null || bi); zk; rm .zeus.sock; reset; zeus start'
alias bi='bundle install --binstubs bundle/bin'
alias b='bundle exec'
alias rk='zb rake'

# rails
alias r='rails'
alias gs='guard --no-bundler-warning'
alias mig='rk db:migrate db:test:prepare'

# project specific
alias mqi='script/mergeq integration'
alias mqd='script/mergeq develop'
alias mqc='script/mergeq --continue'

# rails 2
alias ss='script/server'
alias sc='script/console'
alias sg='script/generate'

# pow
alias start_pow="launchctl load $HOME/Library/LaunchAgents/cx.pow.powd.plist"
alias stop_pow="launchctl unload $HOME/Library/LaunchAgents/cx.pow.powd.plist"
