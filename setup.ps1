# Science Study Hub — Quick Launch Script
# Run this once after Flutter is installed

$flutter = "$env:USERPROFILE\flutter\bin\flutter.bat"
$project = "C:\Users\gabri\prj\science_study_flutter"

if (-not (Test-Path $flutter)) {
    Write-Host "ERROR: Flutter not found at $flutter" -ForegroundColor Red
    Write-Host "Please install Flutter first. See FLUTTER_SETUP.md" -ForegroundColor Yellow
    exit 1
}

Set-Location $project
Write-Host "Creating Flutter scaffold (keeping our lib/ files)..." -ForegroundColor Cyan

# Create scaffold without overwriting existing lib files
& $flutter create . --project-name science_study_hub --org com.gabri --platforms android,ios 2>&1 | Where-Object { $_ -notmatch "^Resolving" }

Write-Host "Installing dependencies..." -ForegroundColor Cyan
& $flutter pub get

Write-Host ""
Write-Host "✅ Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "To run on your phone:  flutter run" -ForegroundColor Cyan
Write-Host "To build Android APK:  flutter build apk --release" -ForegroundColor Cyan

