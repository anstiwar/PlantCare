# PlantCare Architecture Overview

## Project Structure

```
lib/
├── core/                          # Core functionality shared across the app
│   ├── database/                  # Database setup and DAOs
│   ├── notifications/             # Notification service
│   ├── constants/                 # App-wide constants
│   ├── theme/                     # Theme definitions
│   ├── utils/                     # Utility functions
│   └── services/                  # Core services
│
├── features/                      # Feature modules following Clean Architecture
│   ├── plants/                    # Plant management feature
│   │   ├── data/                  # Data layer (repositories, datasources)
│   │   ├── domain/                # Domain layer (entities, use cases)
│   │   └── presentation/          # Presentation layer (screens, providers)
│   │
│   ├── schedules/                 # Care schedule management
│   ├── tasks/                     # Task management and generation
│   ├── history/                   # Plant care history tracking
│   ├── notes/                     # Notes and health tracking
│   ├── dashboard/                 # Dashboard and statistics
│   └── [other features follow same structure]
│
├── shared/                        # Shared widgets, utilities, models
│
├── routes/                        # Navigation setup
│
└── main.dart                      # App entry point
```

## Architecture Pattern: Clean Architecture

### Three Layers

#### 1. **Presentation Layer** (`presentation/`)
- **Responsibility**: UI and state management
- **Components**:
  - Screens (StatelessWidget)
  - Riverpod providers
  - ViewModels
  - Widgets
- **Handles**: User interactions, displaying data

#### 2. **Domain Layer** (`domain/`)
- **Responsibility**: Business logic and use cases
- **Components**:
  - Entities (immutable data models)
  - Use cases (business logic operations)
  - Repository interfaces
- **Dependencies**: None (pure Dart, no framework)
- **Handles**: What the app does

#### 3. **Data Layer** (`data/`)
- **Responsibility**: Data retrieval and caching
- **Components**:
  - Repositories (implement domain interfaces)
  - Data sources (local/remote data fetching)
  - Models (serializable DTO versions of entities)
- **Dependencies**: Can depend on domain and presentation
- **Handles**: How data is obtained

### Key Principles

1. **Unidirectional Dependency Flow**: Presentation → Domain ← Data
2. **Separation of Concerns**: Each layer has clear responsibilities
3. **Testability**: Loose coupling makes testing easier
4. **Reusability**: Domain logic can be shared across platforms

## State Management: Riverpod

### Why Riverpod?
- Provider-based state management
- Compile-time safety
- Automatic dependency injection
- Less boilerplate than Provider
- Excellent for Clean Architecture

### Provider Types Used
- **StateNotifierProvider**: Mutable state with methods
- **FutureProvider**: Async operations
- **StreamProvider**: Real-time data
- **Provider**: Computed/read-only values

## Database: Drift (SQLite)

### Why Drift?
- Type-safe SQL queries
- Automatic migrations
- Reactive streams
- Works offline
- Excellent performance

### Database Strategy
- **Local-first**: All data stored locally
- **Lazy loading**: Load data on demand
- **Caching**: In-memory caching for frequently accessed data
- **Migrations**: Version-controlled schema changes

## Navigation: GoRouter

### Why GoRouter?
- Declarative routing
- Deep linking support
- Type-safe navigation
- Excellent error handling

## Notifications: Flutter Local Notifications + Timezone

### Implementation Strategy
- **Daily scheduler**: Runs at specified time
- **Task-based reminders**: Generated from schedules
- **Flexible timing**: Morning, evening, custom times
- **Background execution**: Uses native scheduling

## Data Flow Example: Viewing Plants

```
User taps "Plants" screen
         ↓
   PlantsScreen (UI)
         ↓
PlantListProvider (Riverpod)
         ↓
GetPlantsUseCase (Domain)
         ↓
PlantRepository (Data)
         ↓
PlantDataSource (Database)
         ↓
Drift Database (SQLite)
         ↓
         [JSON serialization]
         ↓
Returns Plant entities
         ↓
UI rebuilds with data
```

## Code Organization Guidelines

### Naming Conventions
- **Files**: `snake_case` (e.g., `plant_entity.dart`)
- **Classes**: `PascalCase` (e.g., `PlantEntity`)
- **Functions/Methods**: `camelCase` (e.g., `getPlantById`)
- **Constants**: `camelCase` (e.g., `defaultTimeout`)

### Import Organization
```dart
// 1. Dart imports
import 'dart:async';

// 2. Flutter imports
import 'package:flutter/material.dart';

// 3. Package imports
import 'package:riverpod/riverpod.dart';

// 4. Relative imports
import '../models/plant.dart';
```

### Code Style
- **Immutability**: Use `final` and Freezed for models
- **Null Safety**: Proper null handling with ?/!
- **Error Handling**: Use Either/Result pattern or try-catch
- **Comments**: Only for complex logic (code should be self-documenting)

## Dependency Injection

**Strategy**: Riverpod providers as the DI container

```dart
// Repository
final plantRepositoryProvider = Provider<PlantRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return PlantRepository(database: database);
});

// Use Case
final getPlantsUseCaseProvider = Provider<GetPlantsUseCase>((ref) {
  final repository = ref.watch(plantRepositoryProvider);
  return GetPlantsUseCase(repository: repository);
});
```

## Testing Strategy

### Unit Tests
- Domain layer logic (Use cases)
- Data layer serialization
- Utilities

### Widget Tests
- Individual widgets
- User interactions

### Integration Tests
- Full feature flows
- Database operations

## Performance Considerations

1. **Lazy Loading**: Load plants only when needed
2. **Pagination**: Limit initial load
3. **Caching**: In-memory cache for active data
4. **Indexing**: Database indexes on frequently queried fields
5. **Image Optimization**: Scale and compress photos
6. **Async Loading**: Non-blocking database operations

## Error Handling

**Strategy**: Either/Result pattern or try-catch with logging

```dart
// Success/Failure pattern
Either<Exception, List<Plant>> result = await repository.getPlants();

result.fold(
  (error) => handleError(error),
  (plants) => showPlants(plants),
);
```

## Logging

- **Logger package**: Structured logging
- **Log Levels**: Debug, Info, Warning, Error
- **Context**: Include relevant context in logs
- **No sensitive data**: Never log passwords or personal info

## Offline-First Strategy

1. **Local Database First**: All reads from local DB
2. **Queue Operations**: Queue modifications for later
3. **Sync Ready**: Architecture supports future cloud sync
4. **Conflict Resolution**: Prepare for future multi-device scenarios

## Future Extensibility

This architecture supports future additions:
- Cloud synchronization (Firebase/custom backend)
- Multiple accounts
- Data sharing between devices
- AI features (plant identification, disease detection)
