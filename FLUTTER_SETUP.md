# Science Study Hub — Flutter Setup Guide

## Step 1: Install Flutter

### Option A — Automated (run this script once in PowerShell)
```powershell
# Downloads Flutter and creates the project automatically
$dest = "$env:USERPROFILE\flutter"
$zip  = "$env:USERPROFILE\flutter_sdk.zip"
$url  = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.29.2-stable.zip"

Invoke-WebRequest -Uri $url -OutFile $zip -UseBasicParsing
Expand-Archive -Path $zip -DestinationPath $env:USERPROFILE -Force

# Add Flutter to PATH for this session
$env:PATH = "$dest\bin;$env:PATH"
flutter --version
```

### Option B — Manual
1. Go to **https://flutter.dev/docs/get-started/install/windows**
2. Download the **Flutter SDK** (stable channel)
3. Extract to `C:\Users\gabri\flutter`
4. Add `C:\Users\gabri\flutter\bin` to your system PATH

---

## Step 2: Create the project scaffold

```powershell
$flutter = "$env:USERPROFILE\flutter\bin\flutter.bat"
$project = "C:\Users\gabri\prj\science_study_flutter"

cd $project
& $flutter create . --project-name science_study_hub --org com.gabri --platforms android,ios
```

> ⚠️ When prompted to overwrite `lib/main.dart` — say **NO** (we already have our code)

---

## Step 3: Install dependencies

```powershell
$flutter = "$env:USERPROFILE\flutter\bin\flutter.bat"
cd C:\Users\gabri\prj\science_study_flutter
& $flutter pub get
```

---

## Step 4: Run on Android (quick test)

Connect your phone via USB with USB debugging enabled, then:

```powershell
$flutter = "$env:USERPROFILE\flutter\bin\flutter.bat"
cd C:\Users\gabri\prj\science_study_flutter
& $flutter run
```

---

## Step 5: Build release APK (Android)

```powershell
$flutter = "$env:USERPROFILE\flutter\bin\flutter.bat"
cd C:\Users\gabri\prj\science_study_flutter
& $flutter build apk --release
# APK will be at: build/app/outputs/flutter-apk/app-release.apk
```

---

## Step 6: Build for iOS (requires a Mac)

On a Mac with Xcode installed:

```bash
flutter build ios --release
# Open ios/Runner.xcworkspace in Xcode to archive and distribute
```

Or use a CI service like **Codemagic.io** (free tier) to build iOS from Windows.

---

## Project Structure Created

```
science_study_flutter/
├── pubspec.yaml              ← dependencies
└── lib/
    ├── main.dart             ← app entry + bottom navigation
    ├── models/
    │   └── models.dart       ← Module, Concept, Question, GameZone, GlossaryEntry
    ├── data/
    │   ├── content_repository.dart  ← all 5 modules, 20 glossary, 5 game zones
    │   └── preferences_manager.dart ← SharedPreferences wrapper
    └── screens/
        ├── home_screen.dart    ← module cards list
        ├── lesson_screen.dart  ← Learn / Flashcards / Quiz tabs
        ├── game_screen.dart    ← Bio Mission adventure game
        └── glossary_screen.dart ← searchable glossary
```

## What's Ported

| Feature | Android (Kotlin) | Flutter (Dart) |
|---|---|---|
| 5 Science modules | ContentRepository.kt | content_repository.dart |
| Learn tab | LessonFragment (renderLearn) | _LearnTab widget |
| Flashcards | LessonFragment (renderFlashcards) | _FlashcardsTab widget |
| Flip animation | scaleX animation | AnimatedSwitcher |
| Quiz | LessonFragment (renderQuiz) | _QuizTab widget |
| Bio Mission game | GameFragment.kt | game_screen.dart |
| Glossary | GlossaryFragment.kt | glossary_screen.dart |
| Preferences | DataStore | SharedPreferences |
| Dark theme | colors.xml | ThemeData in main.dart |
| Bottom navigation | Custom LinearLayout nav | BottomNavigationBar |

## iOS Distribution (without App Store)

For personal use on your own iPhone:
1. Build on a Mac (or Codemagic)
2. Use **AltStore** or **Sideloadly** to install the IPA on your iPhone
3. No Apple Developer account required for personal sideloading

