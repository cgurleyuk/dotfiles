$emacsdir="$home"

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

Print-Info "In emacs/boostrap.ps1"
cmd /c mklink $emacsdir\.emacs $dotfiles\emacs\.emacs 
Print-Success "Linked .emacs to $emacsdir\.emacs"
