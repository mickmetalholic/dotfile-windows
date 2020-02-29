Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Thunderfury

If (-Not (Test-Path Variable:PSise)) {  # Only run this in the console and not in the ISE
  Import-Module Get-ChildItemColor
  
  Set-Alias ll Get-ChildItem -option AllScope
  Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
}

function dotfiles {
  git --git-dir=$HOME/.dotfiles-windows.git --work-tree=$HOME @args
}
