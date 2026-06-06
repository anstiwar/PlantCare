# Development Setup Guide

## Prerequisites

### Required
- **Flutter SDK**: Latest stable (3.0+)
- **Dart SDK**: Included with Flutter
- **Git**: For version control
- **IDE**: Android Studio, VS Code with Flutter extension, or Xcode

### Platform-Specific

#### Android
- Android Studio 2022.3+
- Android SDK 21+
- Java 11+

#### iOS
- Xcode 13+
- macOS 12+
- CocoaPods (included with Xcode)

## Installation

### 1. Install Flutter

**macOS/Linux:**
```bash
# Install Flutter SDK
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Add to ~/.bashrc or ~/.zshrc for persistence
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
source ~/.bashrc
```

**Windows:**
- Download Flutter SDK from [flutter.dev](https://flutter.dev/docs/get-started/install/windows)
- Extract to a folder (e.g., `C:\flutter`)
- Add to PATH: `C:\flutter\bin`
- Open PowerShell and verify: `flutter --version`

### 2. Verify Installation
```bash
flutter --version
flutter doctor
```

Fix any issues shown by `flutter doctor`.

### 3. Set up Android Emulator

```bash
# Create emulator
flutter emulators create --name pixel5

# List emulators
flutter emulators

# Start emulator
flutter emulators launch pixel5
```

### 4. Set up iOS Simulator (macOS only)

```bash
# Start simulator
open -a Simulator

# Or use Flutter
flutter devices
```

## Project Setup

### 1. Clone Repository
```bash
git clone https://github.com/yourusername/plantcare.git
cd plantcare
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Setup IDE

#### VS Code
```bash
# Install extensions
# - Flutter (by Dart Code)
# - Dart (by Dart Code)
# - JSON to Dart (optional)

# Open project
code .
```

#### Android Studio
```bash
# Open project
# File → Open → select plantcare folder
```

### 4. Code Generation Setup

**Important**: Always run code generation during development

```bash
# Watch mode (recommended)
flutter pub run build_runner watch

# Or one-time build
flutter pub run build_runner build
```

**What gets generated**:
- Freezed models (copyWith, equality, toString)
- JSON serialization (fromJson, toJson)
- Drift database code
- Riverpod generators

### 5. Run the App

```bash
# Default (first device)
flutter run

# Specific device
flutter run -d pixel5

# Profile mode (performance)
flutter run --profile

# Release mode (production)
flutter run --release

# Watch for changes
flutter run -v
```

## Development Environment

### Recommended VS Code Extensions

```json
// .vscode/extensions.json
{
  "recommendations": [
    "Dart-Code.flutter",
    "Dart-Code.dart-code",
    "eamodio.gitlens",
    "GitHub.Copilot",
    "ms-vscode.vscode-typescript-eslint"
  ]
}
```

### Recommended VS Code Settings

```json
{
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "Dart-Code.dart"
  },
  "flutter.openDevToolsAtStartup": true,
  "dart.enableSdkFormatter": true
}
```

## Common Commands

### Development
```bash
# Build runner
flutter pub run build_runner watch

# Run app
flutter run

# Run with verbose output
flutter run -v

# Clean and rebuild
flutter clean && flutter pub get && flutter run
```

### Testing
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/unit/models/plant_model_test.dart

# Generate coverage
flutter test --coverage

# Run tests with verbose output
flutter test -v
```

### Code Quality
```bash
# Analyze code
flutter analyze

# Format code
dart format lib/ test/

# Format specific file
dart format lib/main.dart

# Check formatting only
dart format --output=none lib/
```

### Database
```bash
# Generate Drift code
flutter pub run build_runner build

# Rebuild if conflicts
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode
flutter pub run build_runner watch
```

## Database Setup

### First Run
Drift automatically creates the database on first app launch.

**Location**:
- Android: `/data/data/com.yourcompany.plantcare/databases/app_database.db`
- iOS: `Library/Application Support/app_database.db`

### Database Operations

```dart
// Access database in your code
final database = ref.watch(databaseProvider);

// Query
final plants = await database.select(database.plantsTable).get();

// Insert
await database.into(database.plantsTable).insert(plant);

// Update
await database.update(database.plantsTable).replace(updatedPlant);

// Delete
await database.delete(database.plantsTable).delete(plant);
```

## Debugging

### Flutter DevTools
```bash
# Auto-launch with app
flutter run --launch-devtools

# Or manually
flutter pub global activate devtools
devtools
```

Access at `http://localhost:9100`

### Debugging Features
- Widget Inspector: Visualize widget tree
- Performance: Monitor app performance
- Network: Track HTTP requests (if any)
- Logging: View app logs

### Useful Debug Commands
```bash
# Hot reload (in running app, press 'r')
r    # Hot reload
R    # Hot restart
q    # Quit

# Or use DevTools
```

### Logging
```dart
import 'package:logger/logger.dart';

final logger = Logger();

logger.d('Debug message');      // Debug
logger.i('Info message');       // Info
logger.w('Warning message');    // Warning
logger.e('Error message');      // Error
logger.f('Fatal message');      // Fatal
```

## Performance Profiling

### Frame Rate
```bash
flutter run -v | grep "vsync took"
```

### Memory Usage
```bash
adb shell dumpsys meminfo com.example.plantcare
```

### Performance in DevTools
1. Connect DevTools
2. Go to Performance tab
3. Record frame activity
4. Analyze timeline

## Troubleshooting

### Flutter Issues

**"flutter" command not found**
```bash
# Add Flutter to PATH
export PATH="$PATH:$(pwd)/flutter/bin"

# Or use full path
/path/to/flutter/bin/flutter run
```

**Gradle build failed**
```bash
flutter clean
rm -rf android/.gradle
flutter pub get
flutter run
```

**Pod install failed (iOS)**
```bash
cd ios
rm -rf Pods
rm Podfile.lock
pod install
cd ..
flutter run
```

### Dart Issues

**Pub resolution conflict**
```bash
flutter pub get --offline
# or
flutter pub upgrade
```

**Build runner issues**
```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Database Issues

**Database migration error**
1. Check Drift table definitions
2. Verify version number incremented
3. Check migration code

**Database locked**
```bash
# Close all instances of the app
# Uninstall and reinstall
flutter install --uninstall-only
flutter run
```

### Emulator Issues

**Emulator won't start**
```bash
# Kill all emulator processes
adb kill-server

# Start emulator again
flutter emulators launch pixel5
```

**Slow emulator**
- Use hardware acceleration (check emulator settings)
- Allocate more RAM
- Use physical device for testing

## Environment Variables

### Optional Setup
```bash
# .env (not in version control)
FLUTTER_ROOT=/path/to/flutter
ANDROID_SDK_ROOT=/path/to/android/sdk
```

## First Run Checklist

- [ ] Flutter installed (`flutter --version`)
- [ ] Doctor all green (`flutter doctor`)
- [ ] Project cloned
- [ ] Dependencies installed (`flutter pub get`)
- [ ] Emulator running
- [ ] App starts (`flutter run`)
- [ ] Code generation working (`flutter pub run build_runner watch`)
- [ ] Database created (check app logs)
- [ ] Can navigate between screens
- [ ] Tests pass (`flutter test`)

## Next Steps

1. Familiarize with project structure
2. Read [ARCHITECTURE.md](ARCHITECTURE.md)
3. Review database schema
4. Start with Phase 1 tasks
5. Join the development!

## Resources

- [Flutter Docs](https://flutter.dev/docs)
- [Dart Docs](https://dart.dev/guides)
- [Riverpod Documentation](https://riverpod.dev)
- [GoRouter Documentation](https://pub.dev/packages/go_router)
- [Drift Documentation](https://drift.simonbinder.eu)

## Getting Help

- Check documentation first
- Search GitHub issues
- Ask on Flutter Discord
- Open an issue on GitHub
