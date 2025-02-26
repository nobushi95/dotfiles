# Homebrew completion
# if type brew &>/dev/null; then
#   fpath+=$(brew --prefix)/share/zsh-completions
# fi
fpath+=$(brew --prefix)/share/zsh-completions
fpath+=$(brew --prefix)/share/zsh/site-functions

# zsh completion (cargo, rustup, volta)
fpath+=$HOME/.zsh/completions

# docker completions
fpath+="$HOME/.docker/completions"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# openjdk(homebrew)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home`

# atcoder
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$HOME/opt/ac-library"

# historyコマンド
setopt extended_history
# HISTFILE=$HOME/.zsh-history
## メモリに展開する履歴の数
HISTSIZE=10000
## 保存する履歴の数
SAVEHIST=10000

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip3

# zsh parameter completion for the dotnet CLI for Mac
_dotnet_zsh_complete() 
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet

# dotnet tool
export PATH="$HOME/.dotnet/tools:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# fzf
export FZF_CTRL_T_COMMAND=
export FZF_CTRL_R_COMMAND=
# export FZF_CTRL_R_OPTS=--reverse
export FZF_ALT_C_COMMAND=
export ZSH_FZF_HISTORY_SEARCH_FZF_EXTRA_ARGS=--reverse