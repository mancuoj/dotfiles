$shimPath = "$env:USERPROFILE\AppData\Local\mise\shims"
$currentPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$newPath = $currentPath + ";" + $shimPath
[Environment]::SetEnvironmentVariable('Path', $newPath, 'User')

Remove-Item Alias:ni -Force -ErrorAction Ignore

$env:HTTP_PROXY="http://127.0.0.1:7897";
$env:HTTPS_PROXY="http://127.0.0.1:7897"

function up {
  scoop update *
  if ($?) {
    scoop cleanup *
  }
}

Invoke-Expression (&starship init powershell)
