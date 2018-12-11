#!/bin/bash

alias vi='mvim -v'
alias vim='mvim -v'

# ruby
alias bi='bundle install'
alias b='bundle exec'
alias rk='b rake'

# rails
alias r='b rails'
alias mig='rk db:migrate'

# mergeq
alias mqe='(cd $(git rev-parse --show-toplevel); script/mergeq edge)'
alias mqm='(cd $(git rev-parse --show-toplevel); script/mergeq master)'
alias mqp='(cd $(git rev-parse --show-toplevel); script/mergeq production)'
alias mqc='(cd $(git rev-parse --show-toplevel); git commit --no-edit; script/mergeq --continue)'

# startling
alias ss='(cd $(git rev-parse --show-toplevel); script/start)'

# postgres
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop'

# elixir
alias st='script/test'
alias deps='mix do deps.get, compile'

# Fix OSX
alias timeout='gtimeout'
