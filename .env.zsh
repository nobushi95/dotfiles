# Homebrew completion
# if type brew &>/dev/null; then
#   fpath+=$(brew --prefix)/share/zsh-completions
# fi
fpath+=$(brew --prefix)/share/zsh-completions
fpath+=$(brew --prefix)/share/zsh/site-functions

# cargo rustup completion
fpath+=$HOME/.zsh/completions

# openjdk(homebrew)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home`

# atcoder
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$HOME/opt/ac-library"

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}
compctl -K _dotnet_zsh_complete dotnet

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