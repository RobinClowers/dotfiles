#!/bin/bash

. ~/.bash_colors

# git prompt goodnes
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=verbose
PS1="${COLOR_RED}[${COLOR_WHITE}\t ${COLOR_NONE}\W${COLOR_GREEN}\$(__git_ps1 ' (%s)')${COLOR_RED}]${COLOR_NONE}\n\$ "

# Less settings
# --ignore-case is actually smart case, only ignores for lower case searches
# --chop-long-lines makes long lines scroll instead of wrapping
export LESS="--ignore-case --chop-long-lines"

# increase node memory limit
export NODE_OPTIONS=--max-old-space-size=4096

# Don't show macOS bash to zsh prompt
export BASH_SILENCE_DEPRECATION_WARNING=1

function name_tab() {
  echo -ne "\033]0;$1\007"
}

export EDITOR='nvim'
export VISUAL='nvim'

export GOPATH=$HOME

# completion for my custom checkout command
_git_grepcheckout() {
  _git_checkout
}

# Set PATH, MANPATH, etc., for Homebrew on arm64
[[ -s /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# add Heroku Toolbelt to path
PATH=/usr/local/heroku/bin:$PATH

# add go bin to path
PATH=$HOME/bin:$PATH

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# add imagemagick6 to path
PATH=/usr/local/opt/imagemagick@6/bin:$PATH
export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"

# add gnu stuff to the path
PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/opt/gnu-time/libexec/gnubin:$PATH"

# avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# append history entries
shopt -s histappend

# Make globs recursive
shopt -s globstar

# no limit on history
export HISTSIZE=
export HISTFILESIZE=

[[ -s `brew --prefix`/etc/autojump.sh ]] && source `brew --prefix`/etc/autojump.sh
[[ -s "$HOME/.asdf/asdf.sh" ]] && source "$HOME/.asdf/asdf.sh"
[[ -s "$HOME/.asdf/completions/asdf.bash" ]] && source "$HOME/.asdf/completions/asdf.bash"

# Volta - js toolchain manager
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/robin/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Prefer brew llvm
# https://github.com/rustwasm/wasm-pack/issues/1381
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

[[ -s "$HOME/.amazon_keys" ]] && source "$HOME/.amazon_keys"
[[ -s "$HOME/.photo_gallery_facebook_secret" ]] && source "$HOME/.photo_gallery_facebook_secret"
[[ -s "$HOME/.private_bash_functions" ]] && source "$HOME/.private_bash_functions"

# load direnv
eval "$(direnv hook bash)"

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

export EDITOR='nvim'
export GIT_EDITOR='nvim'
export VISUAL='nvim'

# bash completion (homebrew style)
# "/opt/homebrew/etc/profile.d/bash_completion.sh"
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Rustup setup
. "$HOME/.cargo/env"

source ~/.bash_functions
source ~/.bash_aliases
