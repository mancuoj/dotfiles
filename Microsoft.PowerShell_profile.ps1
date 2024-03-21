$env:http_proxy="http://127.0.0.1:7890"
$env:https_proxy="http://127.0.0.1:7890"

Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Ctrl+u -Function BackwardDeleteLine

Remove-Item Alias:ls -Force -ErrorAction Ignore
Remove-Item Alias:ni -Force -ErrorAction Ignore

Set-Alias -Name ls -Value lsd
Set-Alias -Name remove -Value trash

fnm env --use-on-cd | Out-String | Invoke-Expression

function up {
    scoop update *
    if ($?) {
        scoop cleanup *
    }
}
