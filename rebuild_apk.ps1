$ErrorActionPreference = "Stop"
$env:ANDROID_HOME = "C:\Users\sunil\AppData\Local\Android\Sdk"

Set-Location C:\Users\sunil\OneDrive\Desktop\invoice\pos_apk

Write-Host "Updating web assets..."
if (-not (Test-Path "www")) {
    New-Item -ItemType Directory -Path "www"
}
Copy-Item ..\retail_pos.html www\index.html -Force

Write-Host "Syncing Capacitor..."
npx cap sync android

Write-Host "Building APK..."
Set-Location android
.\gradlew assembleDebug
