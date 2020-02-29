# set-executionpolicy remotesigned
# Install-Module posh-git -Scope CurrentUser
# Install-Module oh-my-posh -Scope CurrentUser
# Install-Module PSColor -Scope CurrentUser
# if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }

# check if git is installed
try {
  git --version
}
catch {
  Write-Output "Git is not installed!"
  exit
}

# initialize and set up repository
git clone --bare git@github.com:mickmetalholic/dotfiles-windows.git $HOME/.dotfiles-windows.git

function dotfiles {
  git --git-dir=$HOME/.dotfiles-windows.git --work-tree=$HOME @args
}
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
dotfiles branch --set-upstream-to=origin/master master
