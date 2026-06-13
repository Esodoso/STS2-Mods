$presetDir = "$env:APPDATA\SlayTheSpire2\card_editor\presets"

if (!(Test-Path $presetDir)) {
    New-Item -ItemType Directory -Path $presetDir -Force | Out-Null
}

Copy-Item `
".\presets\Primo tentativo.json" `
"$presetDir\Primo tentativo.json" `
-Force

Write-Host "Preset aggiornato."
Pause