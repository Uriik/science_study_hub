# SESSION CONTEXT — Science Study Hub
**Date:** 2026-04-04  
**Projects:** Native Android (`science_study`) + iOS SwiftUI (`science_study_ios`) + Flutter cross-platform (`science_study_flutter`)

---

## 1. PROJECTS ON DISK

| Path | Type | Status |
|------|------|--------|
| `C:\Users\gabri\prj\science_study\` | Native Android (Kotlin) | ✅ Release APK built |
| `C:\Users\gabri\prj\science_study_ios\` | iOS SwiftUI (Swift) | ✅ Complete, needs Mac/CI to build |
| `C:\Users\gabri\prj\science_study_flutter\` | Flutter cross-platform | ✅ Code complete, Flutter SDK downloading |

---

## 2. ANDROID PROJECT — `science_study`

### Stack
- Kotlin, Android SDK 36, minSdk 24, Gradle 9.3
- Single Activity (`MainActivity.kt`) + Fragment navigation
- DataStore for preferences, no external network dependencies

### Key files
```
app/src/main/java/com/gabri/sciencestudyhub/
  MainActivity.kt
  data/
    models/Models.kt          — Module, Concept, Question, GameZone, GlossaryEntry
    repositories/ContentRepository.kt  — ALL content (5 modules, bilingual EN/PT)
    utils/SvgProvider.kt
    preferences/
  ui/
    BaseFragment.kt
    HomeFragment.kt           — 2-col module grid
    LessonFragment.kt         — Learn / Flashcards / Quiz tabs (687 lines)
    GameFragment.kt           — 5-zone science mission
    GlossaryFragment.kt       — searchable glossary
    viewmodels/
app/science_study_release.keystore
keystore.properties           — storePassword=science@Hub2026, keyAlias=science_study_key
```

### Signing
```
storeFile=science_study_release.keystore
storePassword=science@Hub2026
keyAlias=science_study_key
keyPassword=science@Hub2026
```

### Build commands
```powershell
cd C:\Users\gabri\prj\science_study
.\gradlew.bat clean assembleDebug    # debug
.\gradlew.bat assembleRelease        # signed release APK
# Output: app\build\outputs\apk\release\app-release.apk  (5.0 MB)
```

### Encoding fix history
Files `ContentRepository.kt`, `SvgProvider.kt`, `GameFragment.kt`, `LessonFragment.kt`
had double-encoded UTF-8 (W-1252 read as Latin-1 then re-saved as UTF-8).

**Fixed by:**
- `C:\Users\gabri\prj\fix_encoding.py` — general W-1252 reverse decode (cp1252 codec)
- `C:\Users\gabri\prj\fix_encoding2.py` — targeted replacements for remaining C1 controls:
  - `\u0097` → `—` (em dash)
  - `\u00e2\u0080\u0094` → `—`
  - `\u00e2\u0086\u0092` → `→`
  - `\u00c3\u008d` → `Í`
- BOM strip: all 4 files had double-BOM (`\ufeff\ufeff`), fixed by stripping all leading BOMs

**Final verification:**
```
icons: 🦠 🔬 ⚡ 🏗️ 🌿  ✅
Em-dashes (—): 59  ✅
Arrows (→): 30  ✅
Subscript ₂: 8  ✅
í (i-acute): 46  ✅
Í (I-acute): 1  ✅
C1 controls remaining: 0  ✅
```

### ⚠️ REMAINING ISSUE — Ecology module in Android ContentRepository.kt
Lines 377-416 still have corrupted Portuguese text (different encoding path):
- `prÃ³prio` → should be `próprio`
- `primÃ¡rios` → should be `primários`
- `DecompÃµem` → should be `Decompõem`
- `BactÃ©rias` → should be `Bactérias`
- `estÃ£o` → should be `estão`
- `VÃ¡rias` → should be `Várias`

**These ARE fixed in the iOS and Flutter versions** but not yet in Android ContentRepository.kt.
Fix script to run:
```python
# Quick fix — run in Python:
path = r"C:\Users\gabri\prj\science_study\app\src\main\java\com\gabri\sciencestudyhub\data\repositories\ContentRepository.kt"
ECOLOGY_FIXES = [
    ("prÃ³prio", "próprio"), ("primÃ¡rios", "primários"), ("secundÃ¡rios", "secundários"),
    ("DecompÃµem", "Decompõem"), ("BactÃ©rias", "Bactérias"), ("estÃ£o", "estão"),
    ("VÃ¡rias", "Várias"), ("matÃ©ria", "matéria"), ("Ã©", "é"), ("Ã³", "ó"),
    ("Ãµ", "õ"), ("Ã£", "ã"), ("Ã¡", "á"),
]
with open(path, 'r', encoding='utf-8') as f: text = f.read()
for bad, good in ECOLOGY_FIXES: text = text.replace(bad, good)
with open(path, 'w', encoding='utf-8') as f: f.write(text)
print("Done")
```

---

## 3. iOS PROJECT — `science_study_ios`

### Stack
- SwiftUI, iOS 17+, Swift 5, Bundle ID: `com.gabri.sciencestudyhub`
- No external dependencies, pure SwiftUI

### File structure
```
C:\Users\gabri\prj\science_study_ios\
  ScienceStudyHub.xcodeproj\
    project.pbxproj            ← valid Xcode 15 project file
  ScienceStudyHub\
    ScienceStudyHubApp.swift   ← @main, dark mode forced
    ContentView.swift          ← TabView: Home | Mission | Glossary
    Theme\Theme.swift          ← color palette matching Android
    Models\Models.swift        ← Swift structs for all data models
    Data\ContentRepository.swift ← full content (all 5 modules, ECOLOGY FIXED)
    Views\
      HomeView.swift           ← LazyVGrid module cards → NavigationLink
      LessonView.swift         ← segmented picker: Learn / Flashcards / Quiz
      GameView.swift           ← 5-zone mission with evidence pips
      GlossaryView.swift       ← searchable card list
    Assets.xcassets\           ← AppIcon + AccentColor (#63D9AB)
    Preview Content\
```

### To open on macOS
```bash
# Copy folder to Mac, then:
open ScienceStudyHub.xcodeproj  # opens in Xcode
# Press ⌘R to run in Simulator
```

### To build without a Mac (cloud)
See section 5 (CI/CD) below.

---

## 4. FLUTTER PROJECT — `science_study_flutter`

### Stack
- Flutter 3.32.0 stable, Dart SDK ≥3.0
- Material 3, dark theme
- `shared_preferences: ^2.3.2`
- Bundle: `science_study_hub`

### File structure
```
C:\Users\gabri\prj\science_study_flutter\
  lib\
    main.dart                    ← MaterialApp + BottomNavigationBar (4 tabs)
    models\models.dart           ← Module, Concept, Question, GameZone, GlossaryEntry
    data\
      content_repository.dart    ← full content, CORRECTLY ENCODED UTF-8
      preferences_manager.dart
    screens\
      home_screen.dart           ← module list → navigates to lesson tab
      lesson_screen.dart         ← TabController: Learn / Flashcards / Quiz
      game_screen.dart           ← science mission
      glossary_screen.dart       ← glossary
  .github\workflows\build.yml   ← GitHub Actions: iOS + Android + Web CI
  codemagic.yaml                 ← Codemagic CI alternative
  setup_flutter.py               ← automated setup helper
  README.md                      ← full setup guide
  .gitignore
  pubspec.yaml                   ← version 1.1.0+2
```

### ⚠️ STATUS: Platform folders missing
The project only has `lib/` — no `android/`, `ios/`, `web/` folders yet.
These are generated by:
```powershell
cd C:\Users\gabri\prj\science_study_flutter
flutter create --project-name science_study_hub .
flutter pub get
```

### Flutter SDK download in progress
```
Downloading to: C:\Users\gabri\flutter_sdk.zip
Source: https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.32.0-stable.zip
Size: ~1.1 GB
Progress as of session end: ~17 MB (slow connection, may take hours)
```

**When download completes:**
```powershell
# Extract
Expand-Archive "$env:USERPROFILE\flutter_sdk.zip" "$env:USERPROFILE" -Force
# Add to PATH permanently
[System.Environment]::SetEnvironmentVariable("PATH", "$env:USERPROFILE\flutter\bin;" + [System.Environment]::GetEnvironmentVariable("PATH","User"), "User")
# Restart PowerShell, then:
cd C:\Users\gabri\prj\science_study_flutter
flutter create --project-name science_study_hub .
flutter pub get
flutter run -d chrome          # instant preview in browser
flutter build apk --release    # Android APK
```

---

## 5. CI/CD — iOS BUILD WITHOUT A MAC

### GitHub Actions (FREE — recommended)
File: `.github/workflows/build.yml`

```yaml
# Builds automatically on git push:
# - android job  → ubuntu runner → app-release.apk artifact
# - ios job      → macos runner  → ScienceStudyHub.ipa artifact  
# - web job      → ubuntu runner → web/ folder artifact
```

**Steps to use:**
1. Create GitHub repo (free): https://github.com/new
2. Push Flutter project:
   ```powershell
   cd C:\Users\gabri\prj\science_study_flutter
   git init
   git add .
   git commit -m "Science Study Hub Flutter v1.1"
   git remote add origin https://github.com/YOUR_USER/science_study_hub.git
   git push -u origin main
   ```
3. GitHub → your repo → **Actions** tab → watch build (~10 min)
4. Download artifacts: `ios-ipa`, `android-apk`, `web-app`
5. Install iOS `.ipa` on iPhone using **AltStore** (free, no jailbreak)

### Codemagic (alternative CI)
File: `codemagic.yaml`
- Connect at https://codemagic.io
- Free tier: 500 min/month on Mac mini M2

---

## 6. APP CONTENT — 5 MODULES

| # | Icon | Title (EN) | Title (PT) | Color |
|---|------|-----------|-----------|-------|
| 1 | 🦠 | Living Things & Viruses | Seres Vivos e Vírus | tag-green |
| 2 | 🔬 | Cell Structure & Functions | Estrutura e Funções Celulares | tag-blue |
| 3 | ⚡ | Specialised Cells | Células Especializadas | tag-purple |
| 4 | 🏗️ | Levels of Organisation | Níveis de Organização | tag-amber |
| 5 | 🌿 | Microorganisms & Ecology | Microrganismos e Ecologia | tag-coral |

Each module has: concepts (EN+PT desc) + quiz (4 questions with feedback)
Game: 5 zones (Bloodstream → Immune Defense → Cell Interior → Lung Tissue → Ecosystem Exit)
Glossary: 20 entries

---

## 7. QUICK REFERENCE — NEXT SESSION TASKS

### High priority
- [ ] Fix ecology module corruption in Android `ContentRepository.kt` (see fix script in section 2)
- [ ] Complete Flutter SDK setup when download finishes
- [ ] Push Flutter project to GitHub to trigger iOS build
- [ ] Test iOS `.ipa` install via AltStore

### Medium priority
- [ ] Add `HomeFragment.kt` "Study now ▶" button text encoding fix (`â–¶` → `▶`)
- [ ] Add progress persistence (DataStore already set up in Android)
- [ ] Add more science modules (Module 6+)

### Optional
- [ ] App icon (replace placeholder in both Android and iOS)
- [ ] Flutter: add `flutter_svg` package for SVG illustrations
- [ ] Publish Android app to Google Play (release APK already signed and ready)
- [ ] Publish iOS app to App Store (needs $99/yr Apple Developer account)

---

## 8. HELPER SCRIPTS

| Script | Location | Purpose |
|--------|----------|---------|
| `fix_encoding.py` | `C:\Users\gabri\prj\` | General W-1252 reverse decode |
| `fix_encoding2.py` | `C:\Users\gabri\prj\` | Targeted C1-control replacements |
| `setup_flutter.py` | `science_study_flutter\` | Auto-setup Flutter after download |

---

## 9. VERSIONS

| Component | Version |
|-----------|---------|
| Android compileSdk | 36 |
| Android minSdk | 24 |
| Android Gradle | 9.3.1 |
| App versionName | 1.1 (versionCode 2) |
| iOS deployment target | 17.0 |
| Flutter SDK | 3.32.0 stable |
| Dart SDK | ≥3.0.0 |
| Swift | 5.0 |
| Xcode compat | 15.0 |
| Bundle ID (all platforms) | com.gabri.sciencestudyhub |

