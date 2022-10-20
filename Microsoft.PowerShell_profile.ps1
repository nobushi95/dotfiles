# powershell でのシンボリックリンクの作り方
# New-Item -Type SymbolicLink {sourceFile} -Value {destFile}

Import-Module posh-git
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\jandedobbeleer.omp.json" | Invoke-Expression

Import-Module Terminal-Icons

# emacs keybinding
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteChar

# tab-completions
(& volta completions powershell) | Out-String | Invoke-Expression
(& rustup completions powershell) | Out-String | Invoke-Expression
# (& rustup completions powershell cargo) | Out-String | Invoke-Expression # cargoは未サポート

# Alias

## base
function ls-fun { ls $args }
Set-Alias -Name l -Value ls-fun

## VSCode
function code-r { code -r $args }
Set-Alias -Name cr -Value code-r

## powershell make
function source-fun { . $PROFILE }
Set-Alias -Name source-profile -Value source-fun

## git
Set-Alias -Name g -Value git

function git-pull { git pull $args }
Set-Alias -Name pull -Value git-pull

function git-push { git push $args }
Set-Alias -Name push -Value git-push

function git-fetch { git fetch $args }
Set-Alias -Name fetch -Value git-fetch

function git-add { git add $args }
Set-Alias -Name ga -Value git-add

function git-branch { git branch $args }
Set-Alias -Name gb -Value git-branch

function git-diff { git diff $args }
Set-Alias -Name gd -Value git-diff

function git-status { git status --short $args }
Set-Alias -Name gs -Value git-status

# gm が Get-Member のデフォルトエイリアスとなっているため不可
# Set-Alias のオプションで -Option AllScope とすればよさそう
# function git-commit-with-arguments-message { git commit --message $args }
# Set-Alias -Name gm -Value git-commit-with-arguments-message
