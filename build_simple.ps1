# Build script alternatif pour NVDA Add-on ProtonVPN (sans SCons)
# Usage: .\build_simple.ps1

$ErrorActionPreference = "Stop"

# Configuration
$addonName = "protonVPNAccessibility"
$addonVersion = "0.1.0"
$outputFile = "$addonName-$addonVersion.nvda-addon"

Write-Host "=== NVDA Add-on Build Script ===" -ForegroundColor Cyan
Write-Host "Building: $outputFile"

# Créer le manifest.ini dans addon/
$manifestContent = @"
name = $addonName
summary = "Amélioration de l'accessibilité de ProtonVPN"
description = """Cet add-on NVDA corrige les noms des boutons et éléments d'interface dans l'application ProtonVPN, afin que NVDA annonce des libellés clairs lors de la navigation au clavier."""
author = "Mama Sene"
url = None
version = $addonVersion
docFileName = readme.html
minimumNVDAVersion = 2023.1.0
lastTestedNVDAVersion = 2025.1.0
updateChannel = None
"@

Write-Host "Generating manifest.ini..."
$manifestContent | Out-File -FilePath "addon\manifest.ini" -Encoding UTF8

# Créer le dossier doc si nécessaire
if (-not (Test-Path "addon\doc\en")) {
    New-Item -ItemType Directory -Path "addon\doc\en" -Force | Out-Null
}

# Convertir readme.md en HTML simple
if (Test-Path "readme.md") {
    Write-Host "Generating readme.html..."
    $readmeContent = Get-Content "readme.md" -Raw -Encoding UTF8
    $htmlContent = @"
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>ProtonVPN Accessibility - NVDA Add-on</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2em; line-height: 1.6; }
        h1, h2, h3 { color: #333; }
        code { background: #f4f4f4; padding: 2px 5px; }
        pre { background: #f4f4f4; padding: 1em; overflow-x: auto; white-space: pre-wrap; }
    </style>
</head>
<body>
<pre>$readmeContent</pre>
</body>
</html>
"@
    $htmlContent | Out-File -FilePath "addon\doc\en\readme.html" -Encoding UTF8
}

# Supprimer l'ancien fichier si existant
if (Test-Path $outputFile) {
    Remove-Item $outputFile -Force
}

# Supprimer l'ancien package ExpressVPN si existant
if (Test-Path "expressVPNAccessibility-*.nvda-addon") {
    Remove-Item "expressVPNAccessibility-*.nvda-addon" -Force
}

# Créer le ZIP (renommé en .nvda-addon)
Write-Host "Creating package..."
Compress-Archive -Path "addon\*" -DestinationPath "$addonName-$addonVersion.zip" -Force
Rename-Item "$addonName-$addonVersion.zip" $outputFile -Force

Write-Host ""
Write-Host "=== Build Complete ===" -ForegroundColor Green
Write-Host "Output: $outputFile"
Write-Host ""
Write-Host "To install:"
Write-Host "1. NVDA -> Outils -> Gerer les modules complementaires"
Write-Host "2. Cliquez sur 'Installer...'"
Write-Host "3. Selectionnez: $outputFile"
Write-Host "4. Redemarrez NVDA"
