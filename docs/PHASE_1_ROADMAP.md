# PlantCare Phase 1 Implementation Roadmap

## Overview
Phase 1 establishes the project foundation with core architecture, database, navigation, and theme setup.

**Duration**: 2-3 weeks
**Focus**: Architecture setup, not features

---

## Phase 1 Breakdown

### ✅ Task 1: Project Setup & Configuration
**Status**: COMPLETED (this document)
- [x] Create folder structure
- [x] Setup pubspec.yaml with dependencies
- [x] Create analysis_options.yaml
- [x] Initialize main.dart
- [x] Document architecture

**Deliverables**:
- pubspec.yaml with all Phase 1 dependencies
- Complete folder structure
- analysis_options.yaml for linting
- Main entry point
- Architecture documentation

---

### 📋 Task 2: Core Theme System
**Status**: PLANNED
**Files to Create**:
- `lib/core/theme/app_theme.dart` ✅
- `lib/core/constants/app_colors.dart`
- `lib/core/constants/app_dimens.dart`
- `lib/core/constants/app_strings.dart`

**Implementation**:
```
Create color palette with Material 3 support
Define spacing system (8dp, 16dp, 24dp grid)
Create text styles (H1-H6, Body, Label)
Support light/dark theme switching
Add theme provider for Riverpod
```

**Testing**:
- Widget test for theme colors
- Verify Material 3 component compatibility

---

### 📋 Task 3: Navigation Setup (GoRouter)
**Status**: PLANNED
**Files to Create**:
- `lib/routes/app_router.dart` ✅
- `lib/routes/route_names.dart`
- `lib/routes/app_routes.dart`

**Implementation**:
```
Setup GoRouter with initial routes:
  / → Splash Screen
  /home → Dashboard
  /plants → Plants List
  /settings → Settings
  
Add named route constants
Configure error pages
Add shell routes for bottom navigation
```

**Testing**:
- Test route navigation
- Verify named routes
- Test invalid routes

---

### 📋 Task 4: Database Setup (Drift/SQLite)
**Status**: PLANNED
**Files to Create**:
- `lib/core/database/database.dart`
- `lib/core/database/app_database.dart`
- `lib/core/database/tables/plants_table.dart`
- `lib/core/database/tables/schedules_table.dart`
- `lib/core/database/tables/tasks_table.dart`
- `lib/core/database/tables/history_table.dart`
- `lib/core/database/tables/notes_table.dart`
- `lib/core/database/tables/photos_table.dart`
- `lib/core/database/tables/settings_table.dart`

**Implementation**:
```
Define Drift database class
Create table definitions with:
  - Columns with types
  - Indexes
  - Foreign keys
  - Default values

Configure migrations
Setup database provider for Riverpod
Initialize database on app startup
```

**Commands**:
```bash
# Generate Drift code
flutter pub run build_runner build

# Watch for changes
flutter pub run build_runner watch
```

**Testing**:
- Test database initialization
- Test table creation
- Test CRUD operations on each table

---

### 📋 Task 5: Core Models & Entities
**Status**: PLANNED
**Files to Create**:
- `lib/features/plants/domain/entities/plant_entity.dart`
- `lib/features/plants/data/models/plant_model.dart`
- `lib/features/schedules/domain/entities/schedule_entity.dart`
- `lib/features/schedules/data/models/schedule_model.dart`
- `lib/features/tasks/domain/entities/task_entity.dart`
- `lib/features/tasks/data/models/task_model.dart`
- `lib/features/history/domain/entities/history_entity.dart`
- `lib/features/history/data/models/history_model.dart`
- `lib/features/notes/domain/entities/note_entity.dart`
- `lib/features/notes/data/models/note_model.dart`

**Implementation**:
```
Create immutable entities using Freezed
Create JSON serializable models
Implement copyWith and equality
Add toJson/fromJson methods
```

**Commands**:
```bash
flutter pub run build_runner build
```

**Testing**:
- Test entity creation
- Test model serialization
- Test JSON conversion

---

### 📋 Task 6: Base Repository Pattern
**Status**: PLANNED
**Files to Create**:
- `lib/core/data/repository_base.dart`
- `lib/features/plants/domain/repositories/plant_repository_interface.dart`
- `lib/features/plants/data/repositories/plant_repository_impl.dart`
- `lib/features/schedules/domain/repositories/schedule_repository_interface.dart`
- `lib/features/schedules/data/repositories/schedule_repository_impl.dart`
- Similar for tasks, history, notes

**Implementation**:
```
Create abstract repository interfaces
Implement repository with Drift datasource
Add error handling
Setup repository providers
```

---

### 📋 Task 7: Core Services & Utils
**Status**: PLANNED
**Files to Create**:
- `lib/core/utils/logger.dart`
- `lib/core/utils/date_utils.dart`
- `lib/core/utils/file_utils.dart`
- `lib/core/services/storage_service.dart`
- `lib/core/services/permission_service.dart`

**Implementation**:
```
Logger service with levels
Date parsing and formatting utilities
File management utilities
Local storage access
Permission checking
```

---

### 📋 Task 8: Placeholder Screens for Navigation
**Status**: PLANNED
**Files to Create**:
- `lib/features/dashboard/presentation/screens/splash_screen.dart`
- `lib/features/dashboard/presentation/screens/home_screen.dart`
- `lib/features/plants/presentation/screens/plants_screen.dart`
- `lib/features/plants/presentation/screens/plant_details_screen.dart`
- `lib/features/dashboard/presentation/screens/settings_screen.dart`

**Implementation**:
```
Create minimal screens with navigation
Add Riverpod provider stubs
Setup bottom navigation bar shell
Verify routing works end-to-end
```

**Testing**:
- Navigate between screens
- Verify back button behavior
- Test deep linking

---

### 📋 Task 9: Dependency Injection Setup
**Status**: PLANNED
**Files to Create**:
- `lib/core/providers/database_provider.dart`
- `lib/core/providers/repository_providers.dart`
- `lib/core/providers/service_providers.dart`

**Implementation**:
```
Setup Riverpod providers for:
  - Database instance
  - All repositories
  - Services
  - Shared state
```

---

### 📋 Task 10: Testing Infrastructure
**Status**: PLANNED
**Files to Create**:
- `test/fixtures/test_data.dart`
- `test/unit/models/plant_model_test.dart`
- `test/unit/utils/date_utils_test.dart`

**Implementation**:
```
Setup test fixtures
Create sample test data
Test model serialization
Test utility functions
```

---

### 📋 Task 11: App Icons & Assets
**Status**: PLANNED
**Directories**:
- `assets/icons/`
- `assets/images/`
- `assets/fonts/`

**Implementation**:
```
Add app icon (512x512)
Add placeholder images
Add Material Icons setup
Configure assets in pubspec.yaml
```

---

### 📋 Task 12: Documentation & Guides
**Status**: PLANNED
**Files to Create**:
- `docs/DEVELOPMENT_SETUP.md`
- `docs/TESTING_GUIDE.md`
- `docs/CODE_STYLE.md`
- `README.md`

**Implementation**:
```
Setup guides
Code style documentation
Testing procedures
Build/run instructions
```

---

## Dependencies Summary

**Phase 1 Dependencies** (from pubspec.yaml):
```yaml
# State Management & Navigation
- flutter_riverpod: ^2.4.0
- go_router: ^14.0.0

# Database
- drift: ^2.14.0
- sqlite3_flutter_libs: ^0.5.0

# Models
- freezed_annotation: ^2.4.1
- json_annotation: ^4.8.1

# Utils
- intl: ^0.19.0
- uuid: ^4.0.0
- logger: ^2.0.0
- path_provider: ^2.1.0

# Dev
- build_runner: ^2.4.0
- freezed: ^2.4.1
- json_serializable: ^6.7.0
- drift_dev: ^2.14.0
```

---

## Getting Started

### 1. Install Flutter
```bash
flutter --version  # Ensure latest stable version
flutter doctor     # Check dependencies
```

### 2. Create Flutter Project
```bash
flutter create plant_care
cd plant_care
```

### 3. Update Dependencies
```bash
flutter pub get
```

### 4. Generate Code
```bash
# One-time build
flutter pub run build_runner build

# Watch mode (recommended during development)
flutter pub run build_runner watch
```

### 5. Run App
```bash
flutter run
```

### 6. Run Tests
```bash
flutter test
```

---

## Architecture Validation Checklist

Before moving to Phase 2, verify:

- [x] Project structure matches Clean Architecture
- [ ] Riverpod providers properly organized
- [ ] GoRouter configured and tested
- [ ] Drift database working offline
- [ ] Models properly frozen and serialized
- [ ] Repository pattern implemented
- [ ] Dependency injection working
- [ ] Navigation between all screens working
- [ ] Theme switching working
- [ ] Tests passing (10+ unit tests)
- [ ] No compile errors
- [ ] Linting clean (analysis_options.yaml)
- [ ] App builds and runs

---

## Phase 1 Success Criteria

✅ **Project compiles without errors**
✅ **Can navigate between 5+ screens**
✅ **Database initializes and creates tables**
✅ **Theme system works in light/dark mode**
✅ **Riverpod providers follow best practices**
✅ **Folder structure matches Clean Architecture**
✅ **Documentation is complete**
✅ **Basic unit tests pass**

---

## Next: Phase 2 - Plant Management

Once Phase 1 is complete:
1. Implement Plant CRUD operations
2. Add photo support
3. Create plant listing screens
4. Implement search and filtering

---

## Notes

- **Code Generation**: Always run `build_runner watch` during development
- **Drift Migrations**: Version number in `@Database(version: X)` must increment
- **Testing**: Aim for 80%+ code coverage by Phase 3
- **Performance**: Profile the app with DevTools frequently
- **Documentation**: Keep docs updated as code evolves
