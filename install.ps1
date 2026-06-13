$configFile = ".\settings.json"

if (Test-Path $configFile) {
    $settings = Get-Content $configFile | ConvertFrom-Json
    $modsDestination = $settings.modsPath
}
else {
    $modsDestination = Read-Host "Inserisci il percorso della cartella mods"

    @{
        modsPath = $modsDestination
    } | ConvertTo-Json | Set-Content $configFile
}

Get-ChildItem ".\mods" | ForEach-Object {
    Copy-Item $_.FullName -Destination $modsDestination -Recurse -Force
}

$presetDir = "$env:APPDATA\SlayTheSpire2\card_editor\presets"

if (!(Test-Path $presetDir)) {
    New-Item -ItemType Directory -Path $presetDir -Force | Out-Null
}

Copy-Item `
".\presets\Primo tentativo.json" `
"$presetDir\Primo tentativo.json" `
-Force

Write-Host "Installazione completata!"
Pause