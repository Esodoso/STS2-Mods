$configFile = ".\settings.json"

$workshopDestination = $null

if (Test-Path $configFile) {
    $settings = Get-Content $configFile | ConvertFrom-Json

    if ($settings.workshopModPath) {
        $workshopDestination = $settings.workshopModPath
    }
}

if (-not $workshopDestination) {
    $workshopDestination = Read-Host "Inserisci il percorso della cartella workshop della mod, esempio E:\Steam\steamapps\workshop\content\2868840\3748283746"

    @{
        workshopModPath = $workshopDestination
    } | ConvertTo-Json | Set-Content $configFile
}

if (!(Test-Path $workshopDestination)) {
    New-Item -ItemType Directory -Path $workshopDestination -Force | Out-Null
}

robocopy "." $workshopDestination /E /IS /IT /R:2 /W:1 `
    /XD ".git" "presets" `
    /XF "install.ps1" "settings.json" ".gitignore" "README.md"

if ($LASTEXITCODE -ge 8) {
    Write-Host "Errore durante la copia dei file nella cartella workshop."
    Pause
    exit $LASTEXITCODE
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