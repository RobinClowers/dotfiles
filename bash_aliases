#!/bin/bash

alias ll='exa -la'

alias vi='nvim'
alias vim='nvim'

# ruby
alias bi='bundle install'
alias b='bundle exec'
alias rk='b rake'

# rails
alias r='b rails'
alias mig='rk db:migrate'

# elixir
alias st='script/test'
alias deps='mix do deps.get, compile'

# Fix OSX
alias timeout='gtimeout'
alias grep='ggrep'

# Default to no wrapping for base64
alias base64="base64 -w 0"
