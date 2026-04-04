#!/usr/bin/env python3
"""
Flutter Setup & Run Script
Run this after the Flutter SDK download completes.
Usage: python setup_flutter.py
"""
import subprocess, sys, os, shutil

FLUTTER_DIR = os.path.expanduser(r"~\flutter")
PROJECT_DIR = os.path.dirname(os.path.abspath(__file__))
FLUTTER_BIN = os.path.join(FLUTTER_DIR, "bin", "flutter.bat")

def run(cmd, cwd=None):
    print(f"\n>>> {cmd}")
    result = subprocess.run(cmd, shell=True, cwd=cwd or PROJECT_DIR)
    if result.returncode != 0:
        print(f"ERROR: command failed with code {result.returncode}")
        sys.exit(1)

def check_flutter():
    if not os.path.exists(FLUTTER_BIN):
        print(f"Flutter not found at {FLUTTER_BIN}")
        print("Wait for the download to finish, then run this script again.")
        sys.exit(1)
    print(f"Flutter found: {FLUTTER_BIN}")

def add_to_path():
    flutter_bin_dir = os.path.join(FLUTTER_DIR, "bin")
    current = os.environ.get("PATH", "")
    if flutter_bin_dir.lower() not in current.lower():
        os.environ["PATH"] = flutter_bin_dir + os.pathsep + current
        print(f"Added {flutter_bin_dir} to PATH (this session only)")
    global FLUTTER_CMD
    FLUTTER_CMD = FLUTTER_BIN

def main():
    print("=" * 55)
    print("  Science Study Hub — Flutter Setup")
    print("=" * 55)

    check_flutter()
    add_to_path()

    # 1. flutter doctor (quick check)
    run(f'"{FLUTTER_BIN}" doctor --android-only')

    # 2. Generate platform folders (ios/ android/ web/)
    if not os.path.exists(os.path.join(PROJECT_DIR, "android")):
        print("\nGenerating platform folders (android, ios, web)...")
        run(f'"{FLUTTER_BIN}" create --project-name science_study_hub .')

    # 3. Get dependencies
    run(f'"{FLUTTER_BIN}" pub get')

    # 4. Build & run options
    print("\n" + "=" * 55)
    print("  What do you want to do?")
    print("  1 - Run on Chrome (web, no device needed)")
    print("  2 - Build Android APK")
    print("  3 - Both")
    print("=" * 55)
    choice = input("Choice [1/2/3]: ").strip()

    if choice in ("1", "3"):
        print("\nOpening in Chrome browser...")
        run(f'"{FLUTTER_BIN}" run -d chrome', cwd=PROJECT_DIR)

    if choice in ("2", "3"):
        print("\nBuilding Android APK...")
        run(f'"{FLUTTER_BIN}" build apk --release')
        apk = os.path.join(PROJECT_DIR, "build", "app", "outputs",
                           "flutter-apk", "app-release.apk")
        if os.path.exists(apk):
            dest = os.path.join(PROJECT_DIR, "ScienceStudyHub.apk")
            shutil.copy(apk, dest)
            print(f"\n✅ APK ready: {dest}")

    print("\n✅ Done!")
    print("\nFor iOS (no Mac needed):")
    print("  1. Push this project to GitHub")
    print("  2. GitHub Actions will build iOS automatically (.github/workflows/build.yml)")
    print("  3. Download the .ipa from the Actions tab")

if __name__ == "__main__":
    main()

