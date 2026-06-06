# PlantCare - Offline Plant Care Tracker

A beautiful, offline-first Flutter mobile application that helps users manage and track the care of their home plants.

## 🌱 Features

### Core Features (V1)
- **Plant Management**: Add, edit, delete, and archive plants
- **Care Schedules**: Create watering, fertilizing, pruning, and repotting schedules
- **Task Management**: Auto-generated tasks from schedules with tracking
- **Local Notifications**: Customizable reminders (morning, evening, custom times)
- **Dashboard**: Today's tasks, upcoming tasks, and statistics
- **Plant History**: Complete log of all plant care activities
- **Notes & Health Tracking**: Add notes, photos, and health observations
- **Backup/Restore**: Export/import data as JSON

### Planned Features (Future)
- AI plant identification from photos
- Disease detection and analysis
- Growth tracking with photo comparison
- Cloud synchronization (Google Drive, Dropbox)
- Multi-user/family sharing

## 🏗️ Architecture

**Clean Architecture** with three distinct layers:
- **Presentation**: Flutter UI, Riverpod state management
- **Domain**: Business logic, use cases, entities
- **Data**: Repositories, Drift database, data sources

**Technologies**:
- **Framework**: Flutter (latest stable)
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Database**: Drift (SQLite)
- **Models**: Freezed, JSON Serializable
- **UI**: Material Design 3

See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for detailed architecture overview.

## 📱 Supported Platforms

- **Android**: API 21+
- **iOS**: iOS 11+

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK (included with Flutter)
- Android Studio / Xcode
- Git

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/plantcare.git
cd plantcare
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate code**
```bash
flutter pub run build_runner watch
```

4. **Run the app**
```bash
flutter run
```

For detailed setup instructions, see [docs/DEVELOPMENT_SETUP.md](docs/DEVELOPMENT_SETUP.md).

## 📚 Documentation

- [Architecture Overview](docs/ARCHITECTURE.md) - Project structure and design patterns
- [Database Schema](docs/DATABASE_SCHEMA.md) - SQLite schema and relationships
- [Phase 1 Roadmap](docs/PHASE_1_ROADMAP.md) - Implementation plan and tasks
- [Development Setup](docs/DEVELOPMENT_SETUP.md) - Environment setup guide
- [Testing Guide](docs/TESTING_GUIDE.md) - Unit and widget testing
- [Code Style](docs/CODE_STYLE.md) - Coding conventions

## 🏃 Development Workflow

### Running the App
```bash
flutter run              # Run on connected device/emulator
flutter run -v          # Verbose output
flutter run --profile   # Profile mode (performance testing)
```

### Code Generation
```bash
flutter pub run build_runner build           # One-time build
flutter pub run build_runner watch           # Watch mode (recommended)
flutter pub run build_runner build --delete-conflicting-outputs
```

### Running Tests
```bash
flutter test                 # Run all tests
flutter test --coverage      # Generate coverage report
flutter test lib/features/plants  # Test specific feature
```

### Linting & Analysis
```bash
flutter analyze              # Run dart analyzer
dart format lib/ test/       # Format code
```

## 📁 Project Structure

```
plantcare/
├── lib/
│   ├── core/               # Core functionality
│   │   ├── database/       # Drift database setup
│   │   ├── theme/          # Material 3 themes
│   │   ├── constants/      # App constants
│   │   ├── utils/          # Utility functions
│   │   ├── services/       # Core services
│   │   └── providers/      # Riverpod DI container
│   │
│   ├── features/           # Feature modules (Clean Architecture)
│   │   ├── plants/         # Plant CRUD
│   │   ├── schedules/      # Care schedules
│   │   ├── tasks/          # Task management
│   │   ├── history/        # Plant history
│   │   ├── notes/          # Notes & tracking
│   │   ├── dashboard/      # Dashboard & stats
│   │   └── [feature]/
│   │       ├── data/       # Data layer
│   │       ├── domain/     # Domain layer
│   │       └── presentation/  # Presentation layer
│   │
│   ├── shared/             # Shared widgets
│   ├── routes/             # Navigation
│   └── main.dart           # App entry point
│
├── test/                   # Unit and widget tests
├── docs/                   # Documentation
├── pubspec.yaml            # Dependencies
└── analysis_options.yaml   # Linting rules
```

## 🎨 Design System

### Colors
- **Primary**: Green (#2E7D32)
- **Secondary**: Earth Brown (#6D4C41)
- **Background**: Light Cream (#FFF8F0)
- **Success**: Green (#4CAF50)
- **Warning**: Orange (#FFA726)
- **Error**: Red (#EF5350)

### Typography
- **Display**: Large, Medium, Small
- **Headline**: Medium, Small
- **Title**: Large, Medium
- **Body**: Large, Medium, Small
- **Label**: Large

### Spacing
- **Base Unit**: 8dp (Figma 8-point grid)
- **Common**: 8, 16, 24, 32, 48, 64dp

## �️ Database

**Type**: SQLite with Drift ORM
**Tables**: 7 main tables (plants, schedules, tasks, history, notes, photos, settings)
**Offline**: 100% offline-first, no server required

See [docs/DATABASE_SCHEMA.md](docs/DATABASE_SCHEMA.md) for full schema.

## 🧪 Testing

### Unit Tests
```bash
flutter test test/unit/
```

### Widget Tests
```bash
flutter test test/widget/
```

### Integration Tests
```bash
flutter test integration_test/
```

### Coverage
```bash
flutter test --coverage
lcov --list coverage/lcov.info
```

Target: 80%+ code coverage by Phase 3

See [docs/TESTING_GUIDE.md](docs/TESTING_GUIDE.md) for details.

## 📊 Development Phases

### Phase 1: Foundation ✅
- Project setup
- Database configuration
- Navigation system
- Theme system
- Core architecture

### Phase 2: Plant Management
- Plant CRUD operations
- Photo support
- Plant listing with search/filter

### Phase 3: Schedules & Tasks
- Schedule creation
- Task auto-generation
- Task completion tracking

### Phase 4: Notifications
- Daily notification scheduler
- Task reminders
- Custom notification times

### Phase 5: History & Notes
- History timeline
- Plant notes
- Photo history

### Phase 6: Dashboard & Analytics
- Task statistics
- Plant statistics
- Calendar view

### Phase 7: Polish
- Backup/restore
- Comprehensive testing
- UI refinement
- Performance optimization

## 🐛 Troubleshooting

### Build Issues
```bash
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build
```

### Drift Conflicts
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Database Issues
- Delete app data and reinstall
- Check database path in console logs
- Verify Drift migrations are correct

## 🤝 Contributing

Contributions welcome! Please:
1. Follow the code style guide
2. Add tests for new features
3. Update documentation
4. Ensure linting passes

## 📄 License

MIT License - see LICENSE file

## 📞 Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Check existing documentation
- Review code comments

## 🙏 Acknowledgments

- Flutter and Dart teams
- Riverpod and Drift communities
- Material Design team
- Flutter community

---

**Last Updated**: May 2026
**Status**: Phase 1 Setup Complete
**Next**: Phase 2 - Plant Management Implementation
