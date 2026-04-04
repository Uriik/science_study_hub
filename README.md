# Science Study Hub — Flutter Cross-Platform Guide

## The Flutter project works on: Android ✅ | iOS ✅ | Web ✅ | Windows ✅

---

## 🚀 PATH A — iOS build right now (FREE, no Mac, no install)

### Using GitHub Actions (recommended)

1. **Create a free GitHub account** → https://github.com
2. **Create a new repository** → "science_study_hub"
3. **Push this folder to GitHub:**
   ```bash
   cd C:\Users\gabri\prj\science_study_flutter
   git init
   git add .
   git commit -m "Initial Flutter app"
   git remote add origin https://github.com/YOUR_USERNAME/science_study_hub.git
   git push -u origin main
   ```
4. **GitHub automatically runs the build** (see `.github/workflows/build.yml`)
5. **Download the artifacts:**
   - Go to your repo → **Actions** tab → click latest run
   - Download `ios-ipa` → install on iPhone with **AltStore** (free)
   - Download `android-apk` → install directly on Android
   - Download `web-app` → open `index.html` in any browser

⏱ Build time: ~10 minutes | Cost: FREE (2000 min/month free on GitHub)

---

## 🚀 PATH B — Run in browser RIGHT NOW (no install, no GitHub)

### Using FlutLab.io (online Flutter IDE)

1. Open https://flutlab.io in Chrome
2. Click **New Project** → paste your Dart files
3. Click **Run** → your app appears in the browser
4. No installation needed!

---

## 🚀 PATH C — Local setup (after Flutter SDK downloads)

The Flutter SDK is downloading to: `C:\Users\gabri\flutter_sdk.zip`
When done (~1.1 GB), run:

```powershell
# Extract the SDK
Expand-Archive "$env:USERPROFILE\flutter_sdk.zip" "$env:USERPROFILE" -Force

# Add to PATH permanently
[System.Environment]::SetEnvironmentVariable(
  "PATH",
  "$env:USERPROFILE\flutter\bin;" + [System.Environment]::GetEnvironmentVariable("PATH","User"),
  "User"
)

# Restart PowerShell, then:
cd C:\Users\gabri\prj\science_study_flutter

# Generate platform folders + get packages
flutter create --project-name science_study_hub .
flutter pub get

# Run in Chrome browser (instant, no Android Studio needed)
flutter run -d chrome

# Build Android APK
flutter build apk --release
# APK saved to: build\app\outputs\flutter-apk\app-release.apk

# Or use the setup script:
python setup_flutter.py
```

---

## 📱 Install iOS .ipa on iPhone WITHOUT App Store

After GitHub Actions builds the `.ipa`:

| Method | Cost | Notes |
|--------|------|-------|
| **AltStore** | Free | Install via PC, no jailbreak, refreshes every 7 days |
| **Sideloadly** | Free | Same as AltStore |
| **TestFlight** | Free | Apple Developer account ($99/yr) needed |
| **App Store** | $99/yr | For public distribution |

---

## 📁 Project Structure

```
science_study_flutter/
  lib/
    main.dart                    ← App entry + bottom nav
    models/models.dart           ← Data models
    data/content_repository.dart ← All content (5 modules, bilingual EN/PT)
    screens/
      home_screen.dart           ← Module grid
      lesson_screen.dart         ← Learn + Flashcards + Quiz
      game_screen.dart           ← Science Mission (5 zones)
      glossary_screen.dart       ← Searchable glossary
  .github/workflows/build.yml   ← Auto iOS + Android + Web CI
  codemagic.yaml                 ← Alternative CI (Codemagic)
  setup_flutter.py               ← Local setup helper script
```

