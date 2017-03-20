$vimdir="$home"

function Print-Info
{
    Write-Host -NoNewline "[ "
    Write-Host -NoNewline "INFO" -ForegroundColor Blue
    Write-Host " ] $args"
}

function Print-Success
{
    Write-Host -NoNewline "[ "
    Write-Host -NoNewline "DONE" -ForegroundColor Green
    Write-Host " ] $args"
}

Print-Info "In vim/boostrap.ps1"
cmd /c mklink $vimdir\_vimrc $dotfiles\vim\.vimrc 
Print-Success "Linked .vimrc to $vimdir\_vimrc"
cmd /c mklink /d $vimdir\vimfile $dotfiles\vim\.vim 
Print-Success "Linked .vim to $vimdir\vimfiles"
