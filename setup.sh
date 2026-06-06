#!/bin/bash

# PlantCare - Quick Start Script
# This script helps initialize the PlantCare development environment

set -e

echo "╔════════════════════════════════════════════════════════════╗"
echo "║          PlantCare - Development Environment Setup         ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Check Flutter
echo "📌 Checking Flutter installation..."
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter not found. Please install Flutter first."
    echo "   Visit: https://flutter.dev/docs/get-started/install"
    exit 1
fi

FLUTTER_VERSION=$(flutter --version | head -n 1)
echo "✅ $FLUTTER_VERSION"

# Run flutter doctor
echo ""
echo "📌 Running flutter doctor..."
flutter doctor

# Get dependencies
echo ""
echo "📌 Installing dependencies..."
flutter pub get

# Generate code
echo ""
echo "📌 Generating code with build_runner..."
echo "   This may take a minute on first run..."
flutter pub run build_runner build --delete-conflicting-outputs

# Run linting
echo ""
echo "📌 Checking code quality..."
dart analyze

# Format code
echo ""
echo "📌 Formatting code..."
dart format lib/ test/ --set-exit-if-changed || true

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                   Setup Complete! ✅                       ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "  1. Review documentation: docs/"
echo "  2. Start code generation watcher:"
echo "     flutter pub run build_runner watch"
echo "  3. Run the app:"
echo "     flutter run"
echo ""
echo "For detailed setup instructions, see:"
echo "  docs/DEVELOPMENT_SETUP.md"
echo ""
