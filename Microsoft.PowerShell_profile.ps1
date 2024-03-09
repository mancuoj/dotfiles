$env:http_proxy="http://127.0.0.1:7890";
$env:https_proxy="http://127.0.0.1:7890";

Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Ctrl+u -Function BackwardDeleteLine

Remove-Item -Path Alias:\ls
Set-Alias -Name ls -Value lsd

fnm env --use-on-cd | Out-String | Invoke-Expression

function up {
    scoop update *
    if ($?) {
        scoop cleanup *
    }
}

function remove {
    param(
        [string]$Target
    )
    Remove-Item -Recurse -Force $Target
    Write-Host "Delete $Target Successfully"
}
