#!/bin/bash

# git alias, defaults to status
function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status -sb
  fi
}
# completion for the `g` alias
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g 2>/dev/null || complete -o default -o nospace -F __git_wrap__git_main g

dc() {
  docker compose "$@"
}

dce() {
  local COMMAND=${1}
  local SERVICE=${PWD##*/}
  docker compose exec "${SERVICE}" "${COMMAND}"
}
