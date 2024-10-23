# added by devcontainer from dotfiles/devcontainer/.bashrc
alias ls="ls -F"
alias l="ls"
alias la="ls -a"
alias ll="ls -lh"
alias lla="ls -lha"
alias j="jobs -l"
alias rm="rm -i"
alias h="history 30"
alias dc="docker compose"
alias g="git"
alias gpl="git pull"
alias gps="git push"
alias gf="git fetch"
alias ga="git add"
alias gb="git branch"
alias gd="git diff"
alias gs="git status --short"
function git_commit_with_arguments_message() {
    git commit --message "$*"
}
alias gm=git_commit_with_arguments_message
alias gsl='git switch `git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias gsB='git switch `git branch --all | peco --prompt "GIT BRANCH>" | head -n 1 | sed "s/.* //" | sed "s#remotes/[^/]*/##"`'

export HISTTIMEFORMAT='%F %T '
export PATH=$PATH:~/opt/peco/current

peco-select-history() {
  local _cmd=$(HISTTIMEFORMAT= history | tac | sed -e 's/^\s*[0-9]\+\s\+//' | peco --query "$READLINE_LINE")
  READLINE_LINE="$_cmd"
  READLINE_POINT=${#_cmd}
}

bind -x '"\C-r": peco-select-history'
