function Print-Info
{
    Write-Host -NoNewline "[ "
    Write-Host -NoNewline "INFO" -ForegroundColor Blue
    Write-Host " ] $args"
}

$dotfiles = (Get-Item ".\" -Verbose).FullName

foreach ($dir in Get-ChildItem | ?{ $_.PSIsContainer}) {
    Print-Info "Found directory $dir"
    if (Test-Path $dir/bootstrap.ps1) {
        Print-Info "Found bootstrap file $dir/bootstrap.ps1"
        Invoke-Expression $dir/bootstrap.ps1
    }
}
