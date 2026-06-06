---
title: PlantCare - Developer Quick Reference
description: Quick reference card for PlantCare development
---

# PlantCare Developer Quick Reference

## 📍 File Locations

| Resource | Location |
|----------|----------|
| Main app | `lib/main.dart` |
| Theme | `lib/core/theme/app_theme.dart` |
| Routes | `lib/routes/app_router.dart` |
| Architecture docs | `docs/ARCHITECTURE.md` |
| Database schema | `docs/DATABASE_SCHEMA.md` |
| Setup guide | `docs/DEVELOPMENT_SETUP.md` |
| Code style | `docs/CODE_STYLE.md` |
| Testing | `docs/TESTING_GUIDE.md` |

---

## 🚀 Quick Start (5 minutes)

```bash
# 1. Clone and enter directory
git clone <repo>
cd plantcare

# 2. Install dependencies
flutter pub get

# 3. Start code generation (in terminal 1)
flutter pub run build_runner watch

# 4. Run app (in terminal 2)
flutter run
```

---

## ⚙️ Essential Commands

### Project Setup
```bash
flutter pub get                    # Get dependencies
flutter pub upgrade                # Update dependencies
flutter clean                      # Clean build
```

### Code Generation
```bash
flutter pub run build_runner watch # Watch (recommended)
flutter pub run build_runner build # One-time build
flutter pub run build_runner clean # Clean generated files
```

### Running
```bash
flutter run                        # Run on default device
flutter run -v                     # Verbose output
flutter run --profile              # Profile mode
flutter run --release              # Release mode
```

### Code Quality
```bash
dart analyze                       # Lint code
dart format lib/ test/            # Format code
flutter test                       # Run tests
flutter test --coverage            # Coverage report
```

---

## 📁 Architecture Quick Guide

### Layer Responsibilities

**Presentation** (`presentation/`)
- Screens, Widgets
- Riverpod providers
- ViewModels

**Domain** (`domain/`)
- Entities (immutable)
- Use Cases
- Repository interfaces

**Data** (`data/`)
- Repositories (impl)
- Data sources
- Models (DTOs)

### Dependency Flow
```
Presentation → Domain ← Data → Database
```
**Always: presentation → domain ← data**

---

## 🗄️ Database Quick Reference

### Tables
- `plants` - Plant data
- `schedules` - Care schedules
- `tasks` - Task instances
- `history` - Action log
- `notes` - Observations
- `photos` - Photo metadata
- `settings` - App config

### Query Example
```dart
// Get plants
final plants = await database
    .select(database.plantsTable)
    .get();

// Insert plant
await database.into(database.plantsTable)
    .insert(plant);

// Update plant
await database
    .update(database.plantsTable)
    .replace(updatedPlant);

// Delete plant
await database.delete(database.plantsTable)
    .delete(plant);
```

---

## 🎨 Design System Quick Reference

### Colors
```dart
const Color primaryGreen = Color(0xFF2E7D32);
const Color secondaryBrown = Color(0xFF6D4C41);
const Color lightCream = Color(0xFFFFF8F0);
```

### Typography
```dart
// Use TextTheme from AppTheme
Theme.of(context).textTheme.headlineMedium
Theme.of(context).textTheme.bodyLarge
Theme.of(context).textTheme.labelSmall
```

### Spacing
```dart
const SizedBox(height: 16);     // Standard spacing (8dp grid)
const EdgeInsets.all(24);       // Padding
Padding(padding: const EdgeInsets.only(left: 16))
```

---

## 🎯 Naming Conventions Cheat Sheet

```
Files:      snake_case          plant_entity.dart
Folders:    snake_case          lib/features/plants/
Classes:    PascalCase          PlantEntity
Functions:  camelCase           getPlantById()
Variables:  camelCase           plantName
Constants:  camelCase           appName (not APP_NAME)
Private:    _prefix             _initDatabase()
```

---

## 🧪 Testing Quick Start

### Run Tests
```bash
flutter test                    # All tests
flutter test -v                 # Verbose
flutter test --coverage         # With coverage
```

### Test Structure
```dart
void main() {
  group('Feature', () {
    test('when_state_then_result', () {
      // Arrange
      
      // Act
      
      // Assert
    });
  });
}
```

### Create Test
```bash
# File: test/unit/features/plants/domain/entities/plant_test.dart
test('creates plant correctly', () {
  final plant = Plant(...);
  expect(plant.name, 'Monstera');
});
```

---

## 🔧 Troubleshooting

### Flutter Issues
```bash
flutter doctor                  # Diagnose issues
flutter clean && flutter pub get # Fresh start
flutter pub get --offline       # Offline mode
```

### Drift Issues
```bash
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner clean
```

### Emulator Issues
```bash
flutter emulators                    # List emulators
flutter emulators launch pixel5      # Start emulator
adb kill-server                      # Reset ADB
```

---

## 📚 Documentation Map

**First Time?**
1. Read: `README.md`
2. Follow: `docs/DEVELOPMENT_SETUP.md`
3. Study: `docs/ARCHITECTURE.md`

**Writing Code?**
1. Check: `docs/CODE_STYLE.md`
2. Follow: `docs/ARCHITECTURE.md`
3. Test: `docs/TESTING_GUIDE.md`

**Database Work?**
1. Review: `docs/DATABASE_SCHEMA.md`
2. Reference: `docs/ARCHITECTURE.md` (Data Layer)

**Stuck?**
1. Check: `docs/DEVELOPMENT_SETUP.md#troubleshooting`
2. Search: `docs/` folder
3. Ask: Discuss in team channels

---

## 🎯 Feature Development Checklist

- [ ] Create feature folder structure
- [ ] Create entities in `domain/entities/`
- [ ] Create models in `data/models/`
- [ ] Create repository interface in `domain/repositories/`
- [ ] Create repository implementation in `data/repositories/`
- [ ] Create use cases in `domain/usecases/`
- [ ] Create Riverpod providers
- [ ] Create screens in `presentation/screens/`
- [ ] Create widgets in `presentation/widgets/`
- [ ] Add unit tests
- [ ] Add widget tests
- [ ] Update documentation
- [ ] Run linting: `dart analyze`
- [ ] Format code: `dart format lib/`
- [ ] Commit with meaningful message

---

## 🧩 Code Template - Repository

```dart
// domain/repositories/plant_repository.dart
abstract class PlantRepository {
  Future<List<Plant>> getPlants();
  Future<Plant> getPlantById(String id);
  Future<void> addPlant(Plant plant);
  Future<void> updatePlant(Plant plant);
  Future<void> deletePlant(String id);
}

// data/repositories/plant_repository_impl.dart
class PlantRepositoryImpl implements PlantRepository {
  const PlantRepositoryImpl({required this.database});
  
  final AppDatabase database;
  
  @override
  Future<List<Plant>> getPlants() async {
    final plantModels = await database
        .select(database.plantsTable)
        .get();
    return plantModels.map((m) => m.toEntity()).toList();
  }
  
  // ... other methods
}
```

---

## 🧩 Code Template - Riverpod Provider

```dart
// Create repository provider
final plantRepositoryProvider = Provider<PlantRepository>((ref) {
  return PlantRepositoryImpl(database: ref.watch(databaseProvider));
});

// Create use case provider
final getPlantsUseCaseProvider = Provider<GetPlantsUseCase>((ref) {
  return GetPlantsUseCase(repository: ref.watch(plantRepositoryProvider));
});

// Create data provider
final plantsProvider = FutureProvider<List<Plant>>((ref) async {
  return ref.watch(getPlantsUseCaseProvider).call();
});

// Use in widget
@override
Widget build(BuildContext context, WidgetRef ref) {
  final plantsAsync = ref.watch(plantsProvider);
  
  return plantsAsync.when(
    loading: () => const CircularProgressIndicator(),
    error: (error, stack) => Text('Error: $error'),
    data: (plants) => ListView(...),
  );
}
```

---

## 🧩 Code Template - Widget

```dart
class PlantCard extends StatelessWidget {
  const PlantCard({
    super.key,
    required this.plant,
    this.onTap,
  });

  final Plant plant;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            _buildImage(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() => Image.asset('assets/plant.png');
  Widget _buildContent() => Text(plant.name);
}
```

---

## 🧩 Code Template - Test

```dart
// test/unit/features/plants/repositories/plant_repository_test.dart
void main() {
  group('PlantRepository', () {
    late PlantRepository repository;
    late MockAppDatabase mockDatabase;

    setUp(() {
      mockDatabase = MockAppDatabase();
      repository = PlantRepositoryImpl(database: mockDatabase);
    });

    test('getPlants returns list of plants', () async {
      // Arrange
      final expectedPlants = [createTestPlant()];
      when(mockDatabase.plantsTable.select().get())
          .thenAnswer((_) async => expectedPlants);

      // Act
      final result = await repository.getPlants();

      // Assert
      expect(result, expectedPlants);
      verify(mockDatabase.plantsTable.select().get()).called(1);
    });
  });
}
```

---

## 📞 Resources

### Official Documentation
- [Flutter Docs](https://flutter.dev/docs)
- [Dart Docs](https://dart.dev)
- [Riverpod Docs](https://riverpod.dev)
- [GoRouter Docs](https://pub.dev/packages/go_router)
- [Drift Docs](https://drift.simonbinder.eu)

### Project Documentation
- [Architecture](docs/ARCHITECTURE.md)
- [Database](docs/DATABASE_SCHEMA.md)
- [Setup](docs/DEVELOPMENT_SETUP.md)
- [Code Style](docs/CODE_STYLE.md)
- [Testing](docs/TESTING_GUIDE.md)

---

## 💡 Pro Tips

1. **Watch Mode**: Always run `flutter pub run build_runner watch` while developing
2. **Hot Reload**: Press 'r' in running app for instant changes (no rebuild)
3. **Hot Restart**: Press 'R' to restart app with full rebuild
4. **Verbose**: Use `flutter run -v` to see detailed logs
5. **Format on Save**: Configure your IDE to auto-format on save
6. **Test First**: Write tests before implementing features
7. **Small Commits**: Commit frequently with meaningful messages
8. **Review Docs**: Read relevant documentation before starting
9. **Use Linting**: Fix all linting issues before committing
10. **Ask for Help**: When stuck, ask in team discussions

---

## 🚨 Common Mistakes

❌ **Don't**:
- Hardcode values (use constants)
- Skip null safety checks
- Mix layers (Presentation using Data directly)
- Forget to increment Drift version on schema changes
- Use `!` operator without careful consideration
- Skip testing
- Ignore linting warnings

✅ **Do**:
- Use Riverpod for state management
- Follow Clean Architecture
- Write tests
- Use dependency injection
- Format code regularly
- Comment complex logic
- Use named parameters
- Keep functions/widgets small

---

## ✅ Pre-Commit Checklist

Before pushing code:
- [ ] `dart analyze` passes
- [ ] `dart format` applied
- [ ] Tests pass (`flutter test`)
- [ ] No TODO comments left
- [ ] Code follows style guide
- [ ] Documentation updated
- [ ] Meaningful commit message

---

**Last Updated**: May 31, 2026
**For latest updates, check**: [SETUP_SUMMARY.md](SETUP_SUMMARY.md)
