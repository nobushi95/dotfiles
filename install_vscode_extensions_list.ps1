$text = Get-Content .\vscode-extensions-list.txt
foreach ($line in $text) {
    code.cmd --install-extension $line
}