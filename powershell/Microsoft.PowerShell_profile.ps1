Set-PSReadLineOption -PredictionSource Plugin

$PSStyle.FileInfo.Directory = "`e[34m"

Import-Module gsudoModule # Run previous command as admin with `gsudo !!`

# Oh-my-posh
$omp_config = Join-Path $PSScriptRoot ".\victor.omp.json"
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$omp_config" --print) -join "`n"))

# Alias
Set-Alias -Name vim -Value nvim

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
