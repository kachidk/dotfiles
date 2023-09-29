Import-Module gsudoModule

$PSStyle.FileInfo.Directory = "`e[34m"

& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\amro.omp.json" --print) -join "`n"))
