#!/bin/bash

# git alias, defaults to status
function g {
  if [[ $# > 0 ]]; then
    git "$@"
  else
    git status -sb
  fi
}
# completion for the `g` alias
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g 2>/dev/null || complete -o default -o nospace -F __git_wrap__git_main g

function restore-vscode-extensions {
  cat vscode-extensions.list | xargs -L 1 code --install-extension
}

dc(){
  docker compose "$@"
}

dce(){
  COMMAND=${1}
  SERVICE=${PWD##*/}
  docker compose exec ${SERVICE} ${COMMAND}
}
