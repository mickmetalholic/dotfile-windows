set-executionpolicy remotesigned
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module PSColor -Scope CurrentUser
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }

Import-Module posh-git
Import-Module oh-my-posh
Import-Module PSColor
Set-Theme Paradox
