# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# ls color（補完でLS_COLORを使うのでここで設定）
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:"

# pure theme
# zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
# zinit light sindresorhus/pure
# # pureのフォルダパス色をシアンに変更
# zstyle :prompt:pure:path color cyan

# Powerlevel10k theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# パッケージ
## 参考: https://github.com/yutkat/dotfiles/blob/1949077cae1831e150dbd1cdd907f7a4eb2afa6c/.config/zsh/rc/pluginlist.zsh
zinit for \
    light-mode  zsh-users/zsh-syntax-highlighting \

zinit wait'0b' lucid \
	light-mode for @zsh-users/zsh-autosuggestions

# zinit wait'0a' lucid \
# 	light-mode for @marlonrichert/zsh-autocomplete

zinit wait'0b' lucid as"completion" \
    atload"zicompinit; zicdreplay" \
    light-mode for @zsh-users/zsh-completions

# # 補完関連
# zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
#     zsh-users/zsh-completions

# 補完を選択可能にする
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1
# 補完でカラーを使用
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:default' list-colors $LS_COLORS

. "$HOME/.aliases.zsh"
. "$HOME/.env.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ayenv
# eval "$(anyenv init - --no-rehash)"

# peco settings
# 過去に実行したコマンドを選択
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}

# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

function peco-cdr () {
    local selected_dir="$(cdr -l | sed -E 's/^[0-9]+ *//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}

# なにかの設定ファイルにbindkeyを書き換えるものが含まれているため、bindkeyをリセット
bindkey -d

# Ctrl-r で過去に実行したコマンドを選択
zle -N peco-select-history
bindkey '^r' peco-select-history

# Ctrl-x, Ctrl-f で過去に移動したディレクトリを選択
zle -N peco-cdr
bindkey '^t' peco-cdr

 # Shift-Tab で補完候補を逆順する("\e[Z"でも動作する)
bindkey "^[[Z" reverse-menu-complete

# Tab, Shift-Tab で補完をサイクルする (zsh-autocomplete)
# bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

