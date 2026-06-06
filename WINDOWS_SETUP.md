# PlantCare - Windows Machine Setup Guide

## ✅ Step 1: Install Flutter SDK

### Option A: Automatic Setup (Recommended)

1. **Download Flutter SDK**
   - Go to: https://flutter.dev/docs/get-started/install/windows
   - Download the latest stable version (e.g., `flutter_windows_3.x.x-stable.zip`)
   - Extract to a folder (e.g., `C:\flutter`)

2. **Add Flutter to PATH**
   - Press `Win + X` → "System" (or Settings → System → About)
   - Click "Advanced system settings"
   - Click "Environment Variables"
   - Under "User variables", click "New"
     - Variable name: `PATH`
     - Variable value: `C:\flutter\bin`
   - Click OK and close all windows
   - **Restart PowerShell/Command Prompt**

3. **Verify Installation**
   ```powershell
   flutter --version
   flutter doctor
   ```
   Should show Flutter version and check dependencies.

### Option B: Using Chocolatey (if installed)
```powershell
choco install flutter
```

---

## ✅ Step 2: Install Dependencies

### Android Setup

1. **Install Android Studio**
   - Download from: https://developer.android.com/studio
   - Run installer and follow prompts
   - Accept all default options

2. **Install SDK Platform Tools**
   ```powershell
   flutter doctor --android-licenses
   ```
   When prompted, press `y` multiple times to accept licenses.

3. **Accept Android Licenses**
   ```powershell
   flutter doctor
   ```
   Should now show Android setup complete.

### Verify Setup
```powershell
flutter doctor
```

All items should show green checkmarks:
- [x] Flutter
- [x] Android toolchain
- [x] Visual Studio (for Windows apps, optional)
- [x] Android Studio

---

## ✅ Step 3: Setup PlantCare Project

### 1. Navigate to Project
```powershell
cd C:\Git\PlantCare
```

### 2. Install Dependencies
```powershell
flutter pub get
```

This will download all packages defined in `pubspec.yaml`.

### 3. Generate Code
```powershell
flutter pub run build_runner build
```

This generates:
- Freezed models (copyWith, equality, toString)
- JSON serialization (fromJson, toJson)
- Drift database code
- Riverpod providers

**Note**: This may take 1-2 minutes on first run.

---

## ✅ Step 4: Verify Everything Works

### Run Diagnostic
```powershell
dart analyze
```

Should show: `No issues found!`

### Format Code
```powershell
dart format lib/ test/
```

### Run Tests
```powershell
flutter test
```

Should show test output (may be empty if no tests exist yet).

---

## 🚀 Step 5: Run the App

### Option A: On Android Emulator

1. **Start Android Emulator**
   ```powershell
   # List available emulators
   flutter emulators
   
   # Start specific emulator (e.g., pixel5)
   flutter emulators launch pixel5
   ```

2. **Wait for emulator to boot** (2-3 minutes)

3. **Run app**
   ```powershell
   flutter run
   ```

### Option B: On Connected Android Phone

1. **Enable Developer Mode on phone**
   - Settings → About phone → Tap "Build number" 7 times
   - Go back, find "Developer options" → Enable USB Debugging

2. **Connect via USB cable**

3. **Verify connection**
   ```powershell
   flutter devices
   ```
   Should show your phone.

4. **Run app**
   ```powershell
   flutter run
   ```

---

## 🔄 Development Workflow

### Terminal Setup

**Terminal 1: Code Generation** (Keep running)
```powershell
cd C:\Git\PlantCare
flutter pub run build_runner watch
```

This watches for file changes and regenerates code automatically.

**Terminal 2: Run App**
```powershell
cd C:\Git\PlantCare
flutter run -v
```

During development:
- Press `r` = Hot reload (instant changes)
- Press `R` = Hot restart (full rebuild)
- Press `q` = Quit app
- Press `w` = Show widget grid

**Terminal 3: Run Tests** (Optional)
```powershell
cd C:\Git\PlantCare
flutter test --watch
```

---

## 🧪 Testing Commands

### Run All Tests
```powershell
flutter test
```

### Run Specific Test File
```powershell
flutter test test/unit/models/plant_model_test.dart
```

### Generate Coverage Report
```powershell
flutter test --coverage
```

### View Coverage
```powershell
# Install lcov if not present
choco install lcov

# View coverage report
lcov --list coverage/lcov.info
```

---

## ✅ Verification Checklist

After setup, verify these work:

- [ ] `flutter --version` shows version
- [ ] `flutter doctor` shows all green ✅
- [ ] `flutter pub get` completes successfully
- [ ] `flutter pub run build_runner build` completes
- [ ] `dart analyze` shows "No issues found!"
- [ ] `flutter test` runs without errors
- [ ] `flutter run` launches app on device/emulator
- [ ] Can see PlantCare app on device
- [ ] Hot reload works (press 'r' in running app)
- [ ] Hot restart works (press 'R' in running app)

---

## 🐛 Troubleshooting

### Flutter not found after installation
```powershell
# Restart PowerShell first
# Then verify PATH
$env:PATH

# Should contain: C:\flutter\bin
```

### Android licenses not accepted
```powershell
flutter doctor --android-licenses
# Press 'y' for each license
```

### Build runner conflicts
```powershell
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Emulator won't start
```powershell
# Kill all adb servers
adb kill-server

# Start emulator again
flutter emulators launch pixel5
```

### App crashes on run
```powershell
# Clean and restart
flutter clean
flutter pub get
flutter pub run build_runner build
flutter run
```

---

## 📊 System Requirements

- **OS**: Windows 10 or later (64-bit)
- **RAM**: 8GB minimum (16GB recommended)
- **Disk Space**: 10GB minimum
- **PowerShell** or Command Prompt
- **Android SDK API 21+**

---

## 📖 Next Steps

1. ✅ Complete steps 1-5 above
2. 📖 Read [DEVELOPMENT_SETUP.md](docs/DEVELOPMENT_SETUP.md)
3. 📖 Read [CODE_STYLE.md](docs/CODE_STYLE.md)
4. 🚀 Start Phase 2 development

---

## 💡 Quick Commands Summary

```powershell
# Setup (one time)
flutter pub get
flutter pub run build_runner build

# Development (every session)
flutter pub run build_runner watch      # Terminal 1
flutter run -v                          # Terminal 2

# Testing
flutter test
flutter test --coverage
dart analyze
dart format lib/ test/

# Cleanup
flutter clean
flutter pub get
flutter pub run build_runner clean
```

---

**Need Help?**
- Check [DEVELOPMENT_SETUP.md](docs/DEVELOPMENT_SETUP.md#troubleshooting)
- Review [QUICK_REFERENCE.md](QUICK_REFERENCE.md)
- Open an issue on GitHub
