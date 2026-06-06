@echo off
REM PlantCare - Quick Start Script for Windows
REM This script helps initialize the PlantCare development environment

setlocal enabledelayedexpansion

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║          PlantCare - Development Environment Setup         ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Check Flutter
echo 📌 Checking Flutter installation...
where flutter >nul 2>nul
if errorlevel 1 (
    echo ❌ Flutter not found. Please install Flutter first.
    echo    Visit: https://flutter.dev/docs/get-started/install
    exit /b 1
)

for /f "tokens=*" %%a in ('flutter --version') do (
    echo ✅ %%a
    exit /b 0
)

REM Run flutter doctor
echo.
echo 📌 Running flutter doctor...
call flutter doctor

REM Get dependencies
echo.
echo 📌 Installing dependencies...
call flutter pub get

REM Generate code
echo.
echo 📌 Generating code with build_runner...
echo    This may take a minute on first run...
call flutter pub run build_runner build --delete-conflicting-outputs

REM Run linting
echo.
echo 📌 Checking code quality...
call dart analyze

REM Format code
echo.
echo 📌 Formatting code...
call dart format lib/ test/ --set-exit-if-changed

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                   Setup Complete! ✅                       ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Next steps:
echo   1. Review documentation: docs/
echo   2. Start code generation watcher:
echo      flutter pub run build_runner watch
echo   3. Run the app:
echo      flutter run
echo.
echo For detailed setup instructions, see:
echo   docs/DEVELOPMENT_SETUP.md
echo.
pause
