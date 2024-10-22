# alias
# ls
alias ls="lsd -F"
# alias ls="ls -GCF"
alias l="ls"
alias la="ls -a"
alias ll="ls -lgh"
alias lla="ls -lgha"
alias lt="ls --tree"

# rm
alias clean="rm -f *~;"
alias rm="rm -i"

# others
alias diff="difft"
alias j="jobs -l;"
alias ssh="ssh -X"
alias ldd="otool -L"
alias clean-git="git prune; git gc;"
alias top="top -o cpu"
alias dirs="dirs -v"
alias nn="nano"
alias dc='docker compose' # MacOSには'dc'コマンドがあるので注意

# git
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
## g br lb でローカルブランチをpecoで選択
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
## g br B でリモートブランチを含んだブランチをpecoで選択
alias -g B='`git branch --all | peco --prompt "GIT BRANCH>" | head -n 1 | sed "s/.* //" | sed "s#remotes/[^/]*/##"`'

# history
# alias h="history 30 | tail -n 30;"
alias history='history -t "%F %T"'
alias h="history"

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

# VScode
alias code-r="code -r"
alias code-n="code -n"
alias cr="code -r"
alias cn="code -n"

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
