# powershell でのシンボリックリンクの作り方（File・Folder）
# New-Item -Type SymbolicLink [-name] {dest} -Target {src}

# Alias
# gitなどのcompletionが設定したaliasでも動作するように、Import-Moduleの前に記載する

## base
Set-Alias -Force diff difft
Set-Alias open Invoke-Item
Set-Alias pbcopy Set-Clipboard

## ls
function lsd-base { lsd -F $args };
Set-Alias -Name ls -Value lsd-base
Set-Alias -Name l -Value lsd-base

function ls-a { lsd -Fa $args }
Set-Alias -Name la -Value ls-a

function ls-l { lsd -Flgh $args }
Set-Alias -Name ll -Value ls-l

function ls-la { lsd -Flgha $args }
Set-Alias -Name lla -Value ls-la

## VSCode
function code-r { code -r $args }
Set-Alias -Name cr -Value code-r

## powershell make
function source-fun { . $PROFILE }
Set-Alias -Name source-profile -Value source-fun

## git
Set-Alias g git

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

function git-local-branch { ((git branch | peco --prompt "GIT BRANCH>") | ForEach-Object { $_ -replace "^\**\s*", "" }) }
Set-Alias -Name lb -Value git-local-branch

function git-switch-local-branch { git switch ((git branch | peco --prompt "GIT BRANCH>") | ForEach-Object { $_ -replace "^\**\s*", "" }) }
Set-Alias -Name gsl -Value git-switch-local-branch

# gm が Get-Member のデフォルトエイリアスとなっているため上書き
# Set-Alias のオプションで -Option AllScope とすればよさそう？？ -> -Forceで上書きも必要？
# 参考: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/set-alias?view=powershell-7.3#example-3-create-and-change-a-read-only-alias
function git-commit-with-arguments-message { git commit --message "$args" }
Set-Alias -Name gm -Value git-commit-with-arguments-message -Force -Option AllScope


# ビープ音無効化
Set-PSReadlineOption -BellStyle None

Import-Module posh-git
Import-Module Terminal-Icons

# oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\powerlevel10k_rainbow.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\kushal.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\atomic.omp.json" | Invoke-Expression

# PowerShell7
if (7 -eq $PSVersionTable.PSVersion.Major) {
    ## auto suggestion
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
}

# emacs keybinding
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteChar
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# tab-completions
(& volta completions powershell) | Out-String | Invoke-Expression
(& rustup completions powershell) | Out-String | Invoke-Expression
# (& rustup completions powershell cargo) | Out-String | Invoke-Expression # cargoは未サポート

# コンソールのエンコードをUTF-8にする
[System.Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
    dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}

# openssl for rust
# $env:OPENSSL_NO_VENDOR = "1"

function pecoHistory() {
    Get-Content (Get-PSReadlineOption).HistorySavePath | Select-Object -Unique | peco | Invoke-Expression
}

Set-PSReadLineKeyHandler -Chord Ctrl+r -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("pecoHistory")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}