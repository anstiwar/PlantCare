# Comprehensive Testing Guide

## Testing Overview

PlantCare uses a multi-level testing strategy:
- **Unit Tests**: Individual functions, classes, and utilities
- **Widget Tests**: UI components and interactions
- **Integration Tests**: Full feature workflows

**Target**: 80%+ code coverage by Phase 3

## Test Structure

```
test/
├── fixtures/              # Test data and helpers
│   ├── test_data.dart
│   └── mock_providers.dart
│
├── unit/                  # Unit tests
│   ├── models/
│   ├── repositories/
│   └── utils/
│
├── widget/                # Widget tests
│   ├── screens/
│   └── widgets/
│
└── integration/           # Integration tests
    └── plant_flow_test.dart
```

## Unit Testing

### Test File Setup

```dart
// test/unit/models/plant_model_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_care/features/plants/data/models/plant_model.dart';

void main() {
  group('PlantModel', () {
    // Tests here
  });
}
```

### Basic Unit Test

```dart
test('creates plant with correct values', () {
  // Arrange - setup
  const plantData = {
    'id': '123',
    'name': 'Monstera',
    'species': 'Deliciosa',
  };

  // Act - execute
  final plant = PlantModel.fromJson(plantData);

  // Assert - verify
  expect(plant.id, '123');
  expect(plant.name, 'Monstera');
  expect(plant.species, 'Deliciosa');
});
```

### Testing Models with Freezed

```dart
test('copyWith creates new instance with updated fields', () {
  // Arrange
  final plant = createTestPlant(name: 'Original');

  // Act
  final updated = plant.copyWith(name: 'Updated');

  // Assert
  expect(plant.name, 'Original');           // Original unchanged
  expect(updated.name, 'Updated');          // New has update
  expect(identical(plant, updated), false); // Different instances
});

test('equality works correctly', () {
  final plant1 = createTestPlant(id: '123');
  final plant2 = createTestPlant(id: '123');
  final plant3 = createTestPlant(id: '456');

  expect(plant1 == plant2, true);  // Same data
  expect(plant1 == plant3, false); // Different data
  expect(plant1.hashCode == plant2.hashCode, true);
});
```

### Testing Async Operations

```dart
test('repository fetches plants from database', () async {
  // Arrange
  final mockDatabase = MockAppDatabase();
  final repository = PlantRepository(database: mockDatabase);
  final expectedPlants = [createTestPlant()];

  when(mockDatabase.plantsTable.select().get())
    .thenAnswer((_) async => expectedPlants);

  // Act
  final result = await repository.getPlants();

  // Assert
  expect(result, expectedPlants);
  verify(mockDatabase.plantsTable.select().get()).called(1);
});

test('handles database errors gracefully', () async {
  // Arrange
  final mockDatabase = MockAppDatabase();
  final repository = PlantRepository(database: mockDatabase);

  when(mockDatabase.plantsTable.select().get())
    .thenThrow(Exception('Database error'));

  // Act & Assert
  expect(
    () => repository.getPlants(),
    throwsException,
  );
});
```

### Testing Use Cases

```dart
test('GetPlantsUseCase returns plants from repository', () async {
  // Arrange
  final mockRepository = MockPlantRepository();
  final useCase = GetPlantsUseCase(repository: mockRepository);
  final expectedPlants = [createTestPlant()];

  when(mockRepository.getPlants())
    .thenAnswer((_) async => expectedPlants);

  // Act
  final result = await useCase();

  // Assert
  expect(result, expectedPlants);
  verify(mockRepository.getPlants()).called(1);
});
```

## Widget Testing

### Basic Widget Test

```dart
// test/widget/screens/home_screen_test.dart
testWidgets('HomeScreen displays welcome message', 
  (WidgetTester tester) async {
    // Arrange - build widget
    await tester.pumpWidget(const HomeScreen());

    // Act & Assert
    expect(find.text('Welcome to PlantCare'), findsOneWidget);
});
```

### Testing with Riverpod

```dart
testWidgets('PlantsScreen displays loading state', 
  (WidgetTester tester) async {
    // Arrange
    final plantsNotifier = FakePlantsNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          plantsProvider.overrideWith((ref) {
            return plantsNotifier.build(ref);
          }),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: PlantsScreen(),
          ),
        ),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
});
```

### Testing User Interactions

```dart
testWidgets('Add button opens add plant dialog', 
  (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const PlantCareApp());

    // Act - find and tap button
    final addButton = find.byIcon(Icons.add);
    expect(addButton, findsOneWidget);
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(AddPlantDialog), findsOneWidget);
});

testWidgets('Form validation prevents empty submission', 
  (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const PlantCareApp());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Act - try to submit empty form
    final submitButton = find.byType(ElevatedButton);
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    // Assert - dialog still open
    expect(find.byType(AddPlantDialog), findsOneWidget);
    
    // Form shows error
    expect(find.text('Plant name is required'), findsOneWidget);
});
```

### Testing Navigation

```dart
testWidgets('Navigating to plant details shows correct plant', 
  (WidgetTester tester) async {
    // Arrange
    const plantId = '123';
    const plant = Plant(
      id: plantId,
      name: 'Monstera',
      species: 'Deliciosa',
    );

    await tester.pumpWidget(const PlantCareApp());

    // Act - navigate to details
    await tester.tap(find.byKey(Key(plantId)));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Monstera'), findsOneWidget);
    expect(find.text('Deliciosa'), findsOneWidget);
});
```

## Integration Testing

### Full Feature Flow

```dart
// test/integration/plant_flow_test.dart
void main() {
  group('Plant Management Flow', () {
    testWidgets('Add, view, and update plant', 
      (WidgetTester tester) async {
        // 1. Start app
        await tester.pumpWidget(const PlantCareApp());

        // 2. Add plant
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();

        final nameField = find.byType(TextField).first;
        await tester.enterText(nameField, 'Monstera');

        final submitButton = find.byType(ElevatedButton);
        await tester.tap(submitButton);
        await tester.pumpAndSettle();

        // 3. Verify plant added
        expect(find.text('Monstera'), findsOneWidget);

        // 4. Tap plant to view details
        await tester.tap(find.text('Monstera'));
        await tester.pumpAndSettle();

        // 5. Edit plant
        await tester.tap(find.byIcon(Icons.edit));
        await tester.pumpAndSettle();

        final editField = find.byType(TextField).first;
        await tester.enterText(editField, 'Monstera Deliciosa');

        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();

        // 6. Verify update
        expect(find.text('Monstera Deliciosa'), findsOneWidget);
      },
    );
  });
}
```

## Test Fixtures & Helpers

### Creating Test Data

```dart
// test/fixtures/test_data.dart
Plant createTestPlant({
  String id = '123',
  String name = 'Test Plant',
  String species = 'Test Species',
  bool isArchived = false,
}) {
  return Plant(
    id: id,
    name: name,
    species: species,
    dateAdded: DateTime.now(),
    isArchived: isArchived,
  );
}

Schedule createTestSchedule({
  String plantId = '123',
  String taskType = 'Water',
  int frequency = 2,
}) {
  return Schedule(
    id: 'sched-123',
    plantId: plantId,
    taskType: taskType,
    frequency: frequency,
    nextDueDate: DateTime.now(),
  );
}

Task createTestTask({
  String plantId = '123',
  String status = 'Pending',
}) {
  return Task(
    id: 'task-123',
    plantId: plantId,
    taskType: 'Water',
    dueDate: DateTime.now(),
    status: status,
  );
}
```

### Mock Providers

```dart
// test/fixtures/mock_providers.dart
class MockPlantRepository extends Mock implements PlantRepository {}
class MockScheduleRepository extends Mock implements ScheduleRepository {}
class MockAppDatabase extends Mock implements AppDatabase {}
class MockPlantsNotifier extends StateNotifier<AsyncValue<List<Plant>>> {
  MockPlantsNotifier() : super(const AsyncValue.data([]));
}
```

## Mocking with Mockito

### Setting Up Mocks

```dart
import 'package:mockito/mockito.dart';

// Generate mocks (requires build_runner)
// mockito_annotations.dart is generated

// Or use Mock() directly
class MockPlantRepository extends Mock implements PlantRepository {}

setUp(() {
  mockRepository = MockPlantRepository();
});
```

### Mocking Behaviors

```dart
// When-thenReturn
when(mockRepository.getPlant('123'))
  .thenReturn(createTestPlant());

// When-thenAnswer for async
when(mockRepository.getPlants())
  .thenAnswer((_) async => [createTestPlant()]);

// When-thenThrow for errors
when(mockRepository.getPlant('invalid'))
  .thenThrow(PlantNotFoundException('invalid'));

// Multiple calls
when(mockRepository.getPlants())
  .thenAnswer((_) async => [])
  .thenAnswer((_) async => [createTestPlant()]);
```

### Verifying Calls

```dart
// Verify called
verify(mockRepository.getPlants()).called(1);

// Verify called with arguments
verify(mockRepository.getPlant('123')).called(1);

// Verify called multiple times
verify(mockRepository.getPlants()).called(3);

// Verify never called
verifyNever(mockRepository.deleteAll());

// Verify in order
verifyInOrder([
  mockRepository.getPlants(),
  mockRepository.addPlant(any),
]);
```

## Running Tests

### Run All Tests
```bash
# Run all tests
flutter test

# Watch mode
flutter test --watch

# Verbose output
flutter test -v
```

### Run Specific Tests
```bash
# Specific file
flutter test test/unit/models/plant_model_test.dart

# Specific group
flutter test --name="PlantModel"

# Pattern matching
flutter test --name="when.*then.*"
```

### Generate Coverage
```bash
# Generate coverage
flutter test --coverage

# View report
lcov --list coverage/lcov.info

# Generate HTML report (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Test Organization Best Practices

### Group Related Tests
```dart
void main() {
  group('PlantRepository', () {
    group('getPlants', () {
      test('returns empty list initially', () {});
      test('returns plants after adding', () {});
    });

    group('addPlant', () {
      test('adds plant to database', () {});
      test('increments plant count', () {});
    });
  });
}
```

### Use Descriptive Names
```dart
// Good
test('when_plantNotFound_then_throwsException', () {});
test('given_validPlant_when_save_then_persistsToDatabase', () {});

// Avoid
test('test 1', () {});
test('should work', () {});
```

### Keep Tests Focused
```dart
// Good - tests one thing
test('returns plant with correct name', () {
  final plant = createTestPlant(name: 'Monstera');
  expect(plant.name, 'Monstera');
});

// Avoid - tests multiple things
test('plant works correctly', () {
  final plant = createTestPlant(name: 'Monstera');
  expect(plant.name, 'Monstera');
  expect(plant.species, isNotEmpty);
  expect(plant.dateAdded, isNotNull);
  expect(plant.isArchived, false);
});
```

### Use AAA Pattern (Arrange-Act-Assert)
```dart
test('updates plant name', () {
  // Arrange
  final plant = createTestPlant(name: 'Original');
  final repository = PlantRepository();

  // Act
  final updated = repository.updatePlant(plant.copyWith(name: 'Updated'));

  // Assert
  expect(updated.name, 'Updated');
});
```

## Common Testing Patterns

### Testing DateTime Operations
```dart
test('calculates days since watering correctly', () {
  // Arrange
  final now = DateTime.now();
  final yesterday = now.subtract(const Duration(days: 1));
  final schedule = createTestSchedule(
    lastCompleted: yesterday,
  );

  // Act
  final daysSince = schedule.daysSinceLastCompleted(now);

  // Assert
  expect(daysSince, 1);
});
```

### Testing Enums
```dart
test('TaskStatus enum has all values', () {
  expect(TaskStatus.values.length, 3);
  expect(TaskStatus.values, contains(TaskStatus.pending));
  expect(TaskStatus.values, contains(TaskStatus.completed));
  expect(TaskStatus.values, contains(TaskStatus.skipped));
});
```

### Testing Collections
```dart
test('filters plants by category', () {
  // Arrange
  final plants = [
    createTestPlant(category: 'Indoor'),
    createTestPlant(category: 'Outdoor'),
    createTestPlant(category: 'Indoor'),
  ];

  // Act
  final indoor = plants.where((p) => p.category == 'Indoor').toList();

  // Assert
  expect(indoor.length, 2);
  expect(indoor, everyElement(
    isA<Plant>().having((p) => p.category, 'category', 'Indoor'),
  ));
});
```

## Performance Testing

### Measure Code Execution
```dart
test('large query completes quickly', () async {
  final stopwatch = Stopwatch()..start();

  final plants = await repository.getPlantsWithSchedules();

  stopwatch.stop();

  expect(plants.length, greaterThan(100));
  expect(stopwatch.elapsedMilliseconds, lessThan(500));
});
```

## Continuous Integration

### GitHub Actions Example
```yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test --coverage
      - uses: codecov/codecov-action@v2
```

## Troubleshooting Tests

### Test Times Out
```dart
testWidgets('long operation', (tester) async {
  // Increase timeout
  tester.binding.window.physicalSizeTestValue = const Size(800, 600);

  // ... test code

  addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
}, timeout: const Timeout(Duration(seconds: 10)));
```

### Widget Not Found
```dart
// Debug output
expect(find.byType(CustomWidget), findsOneWidget,
  reason: 'Check if widget is actually rendered');

// Print widget tree
expect(find.byType(Text), findsWidgets);
tester.printToConsole('Found ${find.byType(Text).evaluate().length} Text widgets');
```

## Coverage Goals by Phase

| Phase | Unit | Widget | Integration | Total |
|-------|------|--------|-------------|-------|
| Phase 1 | 20%  | 10%    | 0%          | 15%   |
| Phase 2 | 40%  | 30%    | 10%         | 35%   |
| Phase 3 | 60%  | 50%    | 30%         | 55%   |
| Phase 4 | 70%  | 60%    | 40%         | 65%   |
| Phase 5 | 75%  | 65%    | 45%         | 70%   |
| Phase 6 | 80%  | 70%    | 50%         | 75%   |
| Phase 7 | 85%  | 75%    | 60%         | 80%+  |

## Resources

- [Flutter Testing](https://flutter.dev/docs/testing)
- [Mockito Documentation](https://pub.dev/packages/mockito)
- [Widget Tester API](https://api.flutter.dev/flutter/widgettest/WidgetTester-class.html)
- [Integration Testing](https://flutter.dev/docs/testing/integration-tests)

## Questions?

For testing issues or questions:
1. Check this guide
2. Review existing tests in `test/` directory
3. Ask in development discussions
4. Open an issue
