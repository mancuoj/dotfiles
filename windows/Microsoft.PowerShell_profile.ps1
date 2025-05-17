$shimPath = "$env:USERPROFILE\AppData\Local\mise\shims"
$currentPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$newPath = $currentPath + ";" + $shimPath
[Environment]::SetEnvironmentVariable('Path', $newPath, 'User')

Remove-Item Alias:ni -Force -ErrorAction Ignore
Remove-Item Alias:ls -Force -ErrorAction Ignore

Set-PSReadLineKeyHandler -Key Ctrl+u -Function BackwardDeleteLine

function Invoke-NrStart { nr start }
function Invoke-NrDev { nr dev }
function Invoke-NrBuild { nr build }
function Invoke-Eza { eza --icons=always }
function up {
  scoop update *
  if ($?) {
    scoop cleanup *
  }
}

Set-Alias -Name s -Value Invoke-NrStart
Set-Alias -Name d -Value Invoke-NrDev
Set-Alias -Name b -Value Invoke-NrBuild
Set-Alias -Name ls -Value Invoke-Eza

$env:HTTP_PROXY="http://127.0.0.1:7897";
$env:HTTPS_PROXY="http://127.0.0.1:7897"

Invoke-Expression (&starship init powershell)
