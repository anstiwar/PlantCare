# PlantCare Code Style Guide

## Overview
This guide ensures consistency across the PlantCare codebase. All contributors must follow these conventions.

## File Organization

### Imports
```dart
// 1. Dart imports (alphabetical)
import 'dart:async';
import 'dart:io';

// 2. Package imports (alphabetical)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 3. Relative imports (alphabetical, most specific first)
import '../models/plant.dart';
import './widgets/plant_card.dart';
```

### File Structure
```dart
// 1. Imports (as above)

// 2. Constants
const String plantCategoryIndoor = 'indoor';

// 3. Global variables (minimal use)
late AppDatabase appDatabase;

// 4. Main class/function

// 5. Helper classes

// 6. Enums (if not in separate file)
enum TaskStatus { pending, completed, skipped }
```

## Naming Conventions

### Files & Folders
```dart
// Files: snake_case
plant_entity.dart
plant_model.dart
plant_repository.dart
app_theme.dart

// Folders: snake_case
lib/features/plants/
lib/core/database/
lib/shared/widgets/
```

### Classes & Types
```dart
// PascalCase for classes
class PlantEntity {}
class GetPlantsUseCase {}
class PlantRepository {}

// PascalCase for enums
enum TaskStatus { pending, completed }
enum PlantCategory { indoor, outdoor }

// PascalCase for type aliases
typedef PlantCallback = Function(Plant);
```

### Variables, Functions & Parameters
```dart
// camelCase for variables
String plantName = 'Monstera';
int waterFrequency = 2;
bool isArchived = false;

// camelCase for functions
void waterPlant(String plantId) {}
Future<List<Plant>> getPlantsNeedingWater() async {}
Plant? findPlantById(String id) {}

// camelCase for parameters
void addPlant({
  required String plantName,
  required String species,
  String? notes,
}) {}
```

### Constants
```dart
// camelCase for constants (not SCREAMING_SNAKE_CASE)
const String appName = 'PlantCare';
const int maxPlants = 500;
const Duration taskQueryTimeout = Duration(seconds: 30);
```

### Private Members
```dart
// Prefix with underscore
class PlantRepository {
  final AppDatabase _database;  // Private final
  String _cachedPlantName = '';  // Private variable
  
  void _initializeCache() {}     // Private method
  String _formatDate(DateTime date) => '';  // Private helper
}
```

## Formatting

### Line Length
**Maximum 80 characters** for readability (100 for URLs/long strings)

```dart
// Good
String displayText = getFormattedText(
  plant,
  includeDetails: true,
);

// Bad - line too long
String displayText = getFormattedText(plant, includeDetails: true, showHistory: true, maxLines: 5);
```

### Indentation
**2 spaces** (configured in `analysis_options.yaml`)

```dart
class PlantEntity {
  final String name;
  final String species;
  
  PlantEntity({
    required this.name,
    required this.species,
  });
}
```

### Whitespace
```dart
// One blank line between members
class PlantEntity {
  final String name;

  final String species;

  PlantEntity({required this.name, required this.species});

  void waterPlant() {}

  String getDisplayName() => name;
}

// Two blank lines between top-level declarations
const String appName = 'PlantCare';

class PlantEntity {}

void main() {}
```

## Dart Best Practices

### Use `final` by Default
```dart
// Good
final plant = _repository.getPlant(id);
final String plantName = 'Monstera';

// Avoid
var plant = _repository.getPlant(id);
String plantName = 'Monstera';
```

### Prefer `const` for Immutable Values
```dart
// Good
const SizedBox(height: 16);
const EdgeInsets.all(8);

// Avoid
SizedBox(height: 16)
EdgeInsets.all(8)
```

### Use `late` for Late Initialization
```dart
// Good
late final AppDatabase database;

void initialize() {
  database = AppDatabase();
}

// Avoid
AppDatabase? database;
```

### Null Safety
```dart
// Good - handle nullability explicitly
String? getNickname(Plant plant) => plant.nickname;

final nickname = plant.nickname ?? 'Unnamed';

if (plant.nickname case var nick when nick != null) {
  print(nick);
}

// Avoid
String getNickname(Plant plant) => plant.nickname!; // Risky!
```

### String Interpolation
```dart
// Good - concise interpolation
print('Plant: $plantName, Species: $species');
print('Total: ${plants.length} plants');

// Avoid
print('Plant: ' + plantName + ', Species: ' + species);
print('Total: ' + plants.length.toString() + ' plants');
```

### Cascade Operator
```dart
// Good - chain operations
final plant = Plant()
  ..name = 'Monstera'
  ..species = 'Deliciosa'
  ..location = 'Living Room';

// Also good - builder pattern
Widget buildCard() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text('Hello'),
    ),
  );
}

// Avoid - repeated instance reference
final plant = Plant();
plant.name = 'Monstera';
plant.species = 'Deliciosa';
plant.location = 'Living Room';
```

## Code Comments

### When to Comment
✅ **DO comment**:
- Complex algorithms or business logic
- Non-obvious design decisions
- Workarounds and hacks
- Performance-critical sections

❌ **DON'T comment**:
- Self-documenting code
- Obvious variable assignments
- Function names that are clear
- Obvious loop iterations

### Comment Style

**Line comments for explanations**:
```dart
// Calculate watering interval in days
final wateringInterval = (today - lastWatered).inDays;

// Fetch from cache first, then database
```

**Doc comments for public APIs**:
```dart
/// Retrieves plants that need watering today.
///
/// Returns a list of [PlantEntity] objects that have pending watering tasks.
/// 
/// Throws [DatabaseException] if the database query fails.
Future<List<PlantEntity>> getPlantsNeedingWater() async {}

/// The name of the plant.
/// 
/// This is the display name shown in the UI.
final String name;
```

**Block comments for sections**:
```dart
/*
 * Plant watering logic:
 * 1. Check last watered date
 * 2. Calculate days since last watering
 * 3. Compare against frequency
 */
```

### TODO/FIXME Comments
```dart
// TODO: Implement photo compression
// FIXME: Handle edge case when plant has no species
// NOTE: This must stay public for testing purposes
// HACK: Temporary workaround for Drift limitation
```

## Flutter-Specific Conventions

### Widget Structure
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildContent(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => SizedBox.fromSize(size: const Size.fromHeight(200));
  Widget _buildContent() => const Text('Content');
  Widget _buildFooter() => const Text('Footer');
}
```

### Widget Parameters
```dart
// Good - clear parameter order
class PlantCard extends StatelessWidget {
  const PlantCard({
    super.key,
    required this.plant,
    required this.onTap,
    this.showHistory = false,
    this.elevation = 2.0,
  });

  final Plant plant;
  final VoidCallback onTap;
  final bool showHistory;
  final double elevation;

  @override
  Widget build(BuildContext context) => const Placeholder();
}

// Instantiation
PlantCard(
  key: ValueKey(plant.id),
  plant: plant,
  onTap: () => handleTap(plant),
  showHistory: true,
)
```

### Building Long Widget Trees
```dart
// Good - multi-line with proper indentation
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('My Plants'),
      elevation: 0,
    ),
    body: ListView.builder(
      itemCount: plants.length,
      itemBuilder: (context, index) => PlantCard(
        plant: plants[index],
        onTap: () => _handlePlantTap(plants[index]),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _handleAddPlant,
      child: const Icon(Icons.add),
    ),
  );
}

// Avoid - unclear structure
@override
Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('My Plants')), body: ListView.builder(itemCount: plants.length, itemBuilder: (context, index) => PlantCard(plant: plants[index], onTap: () => _handlePlantTap(plants[index]))), floatingActionButton: FloatingActionButton(onPressed: _handleAddPlant, child: const Icon(Icons.add)));
```

## Riverpod Conventions

### Provider Naming
```dart
// Repository providers
final plantRepositoryProvider = Provider<PlantRepository>((ref) {
  return PlantRepository(database: ref.watch(databaseProvider));
});

// Use case providers
final getPlantsUseCaseProvider = Provider<GetPlantsUseCase>((ref) {
  return GetPlantsUseCase(repository: ref.watch(plantRepositoryProvider));
});

// State providers
final selectedPlantIdProvider = StateProvider<String?>((ref) => null);

// Async providers
final plantsProvider = FutureProvider<List<Plant>>((ref) async {
  return ref.watch(getPlantsUseCaseProvider).call();
});

// Computed providers
final plantCountProvider = Provider<int>((ref) {
  final plants = ref.watch(plantsProvider);
  return plants.maybeWhen(
    data: (data) => data.length,
    orElse: () => 0,
  );
});
```

### Using Providers
```dart
// In widgets
@override
Widget build(BuildContext context, WidgetRef ref) {
  final plantsAsync = ref.watch(plantsProvider);
  
  return plantsAsync.when(
    loading: () => const CircularProgressIndicator(),
    error: (error, stack) => Text('Error: $error'),
    data: (plants) => ListView(children: [...]),
  );
}

// Selecting specific data
final plantCount = ref.watch(
  plantsProvider.select((async) => 
    async.maybeWhen(data: (plants) => plants.length, orElse: () => 0)
  ),
);

// Invalidating cache
ref.invalidate(plantsProvider);
```

## Error Handling

### Use Try-Catch for Async
```dart
// Good
try {
  final plants = await repository.getPlants();
  return plants;
} catch (e, stackTrace) {
  logger.e('Error fetching plants', error: e, stackTrace: stackTrace);
  rethrow;
}

// Avoid
final plants = await repository.getPlants(); // Might crash!
```

### Custom Exceptions
```dart
// Define specific exceptions
class PlantNotFoundException implements Exception {
  PlantNotFoundException(this.plantId);
  final String plantId;
  
  @override
  String toString() => 'Plant $plantId not found';
}

// Use specific exceptions
try {
  return repository.getPlant(id);
} on PlantNotFoundException catch (e) {
  logger.w('Plant not found: ${e.plantId}');
  rethrow;
} catch (e) {
  logger.e('Unexpected error: $e');
  rethrow;
}
```

## Testing Conventions

### Test File Organization
```dart
// test/unit/repositories/plant_repository_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('PlantRepository', () {
    late PlantRepository repository;
    late MockAppDatabase mockDatabase;

    setUp(() {
      mockDatabase = MockAppDatabase();
      repository = PlantRepository(database: mockDatabase);
    });

    group('getPlants', () {
      test('returns list of plants', () async {
        // Arrange
        final expectedPlants = [createTestPlant()];
        when(mockDatabase.plantsTable).thenReturn([...]);

        // Act
        final result = await repository.getPlants();

        // Assert
        expect(result, expectedPlants);
        verify(mockDatabase.plantsTable.select()).called(1);
      });

      test('throws exception on database error', () async {
        // Arrange
        when(mockDatabase.plantsTable).thenThrow(Exception());

        // Act & Assert
        expect(
          () => repository.getPlants(),
          throwsException,
        );
      });
    });
  });
}
```

### Test Naming
```dart
// Use descriptive names following: when_state_then_result
test('when_plantListEmpty_then_returnsEmptyList', () {});
test('when_databaseError_then_throwsException', () {});
test('when_validPlantId_then_returnsPlant', () {});
```

## Linting

### Run Linting
```bash
dart analyze
dart format lib/ test/
```

### .analyze_options.yaml
The project includes comprehensive linting rules. Never disable rules without discussion.

## Code Review Checklist

Before submitting a PR, ensure:

- [ ] Code follows style guide
- [ ] No linting issues (`dart analyze`)
- [ ] Properly formatted (`dart format`)
- [ ] All tests pass (`flutter test`)
- [ ] No hardcoded values
- [ ] Null safety violations fixed
- [ ] Comments only for complex logic
- [ ] No unused imports/variables
- [ ] Meaningful commit messages
- [ ] Documentation updated

## Quick Reference

| Convention | Style | Example |
|-----------|-------|---------|
| Files | snake_case | plant_entity.dart |
| Folders | snake_case | lib/features/plants |
| Classes | PascalCase | PlantEntity |
| Functions | camelCase | getPlantById() |
| Variables | camelCase | plantName |
| Constants | camelCase | defaultTimeout |
| Private | _camelCase | _initDatabase() |
| Lines | Max 80 chars | Break long lines |
| Indentation | 2 spaces | Standard Dart |
| Null safety | Explicit ? | String? nullable |
| Imports | Grouped | Dart, Flutter, Package, Relative |

## Resources

- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Flutter Best Practices](https://flutter.dev/docs/testing/best-practices)
- [Riverpod Best Practices](https://riverpod.dev/docs/concepts/about_hooks)

---

**Questions?** Open an issue or ask in development discussions.
