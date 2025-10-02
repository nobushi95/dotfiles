# alias
# ls
# alias ls="lsd -F"
# alias ls="ls -GCF"
alias ls="eza --icons --git --time-style long-iso -F"

## common
alias l="ls"
alias la="ls -a"
alias lt="ls --tree"
## ls, lsd
# alias ll="ls -lgh"
# alias lla="ls -lgha"
## eza
alias ll="ls -lg"
alias lla="ls -lga"

# bat
alias cat="bat --paging=never"
alias less="bat --pager='less -R'"

# rm
alias clean="rm -f *~;"
alias rm="rm -i"

# bundle
alias b='bundle'
alias bb='BUNDLE_GEMFILE=Gemfile bundle'
alias bl='BUNDLE_GEMFILE=Gemfile.local bundle'

# others
alias diff="delta"
alias dl="delta"
alias j="jobs -l;"
alias ssh="ssh -X"
alias ldd="otool -L"
alias clean-git="git prune; git gc;"
alias top="top -o cpu"
alias dirs="dirs -v"
alias nn="nano"
alias d='docker'
alias dc='docker compose' # MacOSには'dc'コマンドがあるので注意
alias tiga='tig --all'

# git
alias g="git"
alias gpl="git pull"
alias gps="git push"
alias ggr="git gr"
alias ggrn="git grn"
alias ggra="git gra"
alias ggrna="git grna"
alias gf="git fetch"
alias ga="git add"
alias gb="git branch"
alias gd="git diff"
alias gnd="git --no-pager diff"
alias gs="git status --short"
function git_commit_with_arguments_message() {
    git commit --message $*
}
alias gm=git_commit_with_arguments_message
## peco
### ローカルブランチから選択
# alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
### 全ブランチから選択
# alias -g B='`git branch --all | peco --prompt "GIT BRANCH>" | head -n 1 | sed "s/.* //" | sed "s#remotes/[^/]*/##"`'
### ローカルブランチからswitch
# alias gsl='git switch `git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
### 全ブランチからswitch
# alias gsB='git switch `git branch --all | peco --prompt "GIT BRANCH>" | head -n 1 | sed "s/.* //" | sed "s#remotes/[^/]*/##"`'
## fzf
### ローカルブランチ選択
alias -g lb='`git branch | cut -c 3- | fzf --reverse --height 100% --prompt "GIT BRANCH>" --preview "git grn --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g"`'
### 全ブランチ選択
alias -g B='`git branch --all | cut -c 3- | fzf --reverse --height 100% --prompt "GIT BRANCH>" --preview "git grn --color=always {}" | head -n 1 | sed "s/.* //" | sed "s#remotes/[^/]*/##"`'
### ローカルブランチからswitch
alias gsl='git switch `git branch | cut -c 3- | fzf --reverse --height 100% --prompt "GIT BRANCH>" --preview "git grn --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g"`'
### 全部ランチからswitch
alias gsB='git switch `git branch --all | cut -c 3- | fzf --reverse --height 100% --prompt "GIT BRANCH>" --preview "git grn --color=always {}" | head -n 1 | sed "s/.* //" | sed "s#remotes/[^/]*/##"`'

# history
# alias h="history 30 | tail -n 30;"
alias h='history -t "%F %T" -30'

# emacs alias
# alias em="/usr/local/opt/emacs-mac/Emacs.app/Contents/MacOS/Emacs"
# alias emacs="/usr/local/opt/emacs-mac/Emacs.app/Contents/MacOS/Emacs"
# alias ne="/usr/local/bin/emacs"
alias emacs="emacs -nw"
alias em="emacs"
alias ne="emacs -nw"

# tar alias
alias tar-tar="tar -xvf"
alias tar-gz="tar -zxvf"
alias tar-bz2="tar -jxvf"
alias tar-xz="tar -Jxvf"

# lazy
alias lg="lazygit"
alias lzd="lazydocker"

# VScode
alias code-r="code -r"
alias code-n="code -n"
alias cr="code -r"
alias cn="code -n"
alias vsnotes="code ~/Documents/vsnotes"

# Open Application
## Mac
alias finder="open -a finder"
alias preview="open -a Preview"
alias calc="open -a 'Calculator.app'"
alias textedit="open -a 'TextEdit.app'"
alias keynote="open -a 'Keynote.app'"
alias numbers="open -a 'Numbers.app'"
alias pages="open -a 'Pages.app'"
alias chrome="open -a '/Applications/Google Chrome.app'"
## Otheres
alias adobe-acrobat-reader="open -a 'Adobe Acrobat Reader DC'"
# alias excel="open -a 'Microsoft Excel.app'"
# alias powerpoint="open -a 'Microsoft PowerPoint.app'"
# alias ppt="open -a 'Microsoft PowerPoint.app'"
# alias word="open -a 'Microsoft Word.app'"
## Homebrew show dependency tree
alias brew-tree="brew deps --tree"
alias brew-uses="brew uses --installed"
## Windows(Parallels)
# alias excel-win="open -a 'Excel 2016.app'"
# alias powerpoint-win="open -a 'PowerPoint 2016.app'"
# alias ppt-win="open -a 'PowerPoint 2016.app'"
# alias word-win="open -a 'Word 2016.app'"

# zsh make alias
alias source-rc="zcompile $HOME/.zshrc && zcompile $HOME/.aliases.zsh && zcompile $HOME/.env.zsh && source $HOME/.zshrc;"
alias clean-rc="rm -f $HOME/.zshrc~ $HOME/.aliases.zsh~ $HOME/.env.zsh~;"
alias backup-rc="cp $HOME/.zshrc $HOME/.zshrc.backup && cp $HOME/.aliases.zsh $HOME/.aliases.zsh.backup && cp $HOME/.env.zsh $HOME/.env.zsh.backup;"
alias make-rc="cp $HOME/.zshrc $HOME/.zshrc.backup && source $HOME/.zshrc && zcompile $HOME/.zshrc && zcompile $HOME/.aliases.zsh && zcompile $HOME/.env.zsh && rm -f $HOME/.zshrc~ $HOME/.aliases.zsh~ $HOME/.env.zsh~;"
