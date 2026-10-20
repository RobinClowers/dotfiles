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

# Clean up local branches that are merged or whose upstream is gone.
# Dry run by default; pass -y to delete. Usage: git_prune_branches [-y] [base]
git_prune_branches() {
  local apply=0 base
  [[ ${1:-} == -y ]] && { apply=1; shift; }
  base=${1:-$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null | sed 's|^origin/||')}
  base=${base:-main}

  git fetch --prune --quiet || return

  # Merged into base (regular/rebase merges), not checked out anywhere
  local merged gone
  merged=$(git for-each-ref --merged="$base" --format='%(refname:short) %(worktreepath)' refs/heads \
    | awk -v b="$base" '$1!=b && $2=="" {print $1}')
  # Upstream deleted (squash-merged PRs), not checked out anywhere
  gone=$(git for-each-ref --format='%(refname:short) %(upstream:track) %(worktreepath)' refs/heads \
    | awk '$2=="[gone]" && $3=="" {print $1}')

  echo "Merged into $base:"; echo "${merged:-  (none)}"
  echo "Upstream gone (squash-merged?):"; echo "${gone:-  (none)}"
  echo "Gone but checked out in a worktree (remove the worktree first):"
  git for-each-ref --format='%(refname:short) %(upstream:track) %(worktreepath)' refs/heads \
    | awk '$2=="[gone]" && $3!="" {print "  " $1, $3}'

  if (( apply )); then
    [[ -n $merged ]] && xargs -n1 git branch -d <<<"$merged"
    [[ -n $gone ]] && xargs -n1 git branch -D <<<"$gone"
  else
    echo "Dry run. Re-run with -y to delete."
  fi
}
