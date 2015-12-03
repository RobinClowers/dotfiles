#!/bin/bash

alias vi='mvim -v'
alias vim='mvim -v'

# ruby
alias z='`[ -e .zeus.sock ] && echo zeus || echo SAD: Zeus is not running 1>&2`'
alias zb='`[ -e .zeus.sock ] && echo zeus || echo bundle exec`'
alias zs='(bundle check > /dev/null || bi); zk; rm .zeus.sock; reset; zeus start'
alias bi='bundle install'
alias b='bundle exec'
alias rk='zb rake'

# rails
alias r='rails'
alias gs='guard --no-bundler-warning'
alias mig='rk db:migrate'

# mergeq
alias mqe='script/mergeq edge'
alias mqm='script/mergeq master'
alias mqc='script/mergeq --continue'

# postgres
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop"

# elixir
alias st='script/test'
alias deps='mix do deps.get, compile'
