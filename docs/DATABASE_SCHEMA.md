# PlantCare Database Schema

## Overview
SQLite database with 7 main tables using Drift ORM for type safety and automatic migrations.

## Tables

### 1. **plants**
Primary table for storing plant information.

```sql
CREATE TABLE plants (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  nickname TEXT,
  photoPath TEXT,
  species TEXT,
  location TEXT,
  category TEXT,
  dateAdded INTEGER NOT NULL,
  notes TEXT,
  isArchived INTEGER NOT NULL DEFAULT 0,
  createdAt INTEGER NOT NULL,
  updatedAt INTEGER NOT NULL
);

CREATE INDEX idx_plants_category ON plants(category);
CREATE INDEX idx_plants_location ON plants(location);
CREATE INDEX idx_plants_isArchived ON plants(isArchived);
```

**Columns**:
- `id`: UUID primary key
- `name`: Plant common name
- `nickname`: User-given nickname
- `photoPath`: Local file path to photo
- `species`: Botanical species name
- `location`: Room/area location
- `category`: Indoor, Outdoor, Succulent, etc.
- `dateAdded`: When plant was added
- `notes`: General notes
- `isArchived`: Soft delete flag
- `createdAt`, `updatedAt`: Timestamps

---

### 2. **schedules**
Care schedules for each plant (watering, fertilizing, etc.).

```sql
CREATE TABLE schedules (
  id TEXT PRIMARY KEY,
  plantId TEXT NOT NULL,
  taskType TEXT NOT NULL,
  frequency INTEGER NOT NULL,
  lastCompleted INTEGER,
  nextDueDate INTEGER NOT NULL,
  isActive INTEGER NOT NULL DEFAULT 1,
  createdAt INTEGER NOT NULL,
  updatedAt INTEGER NOT NULL,
  FOREIGN KEY (plantId) REFERENCES plants(id) ON DELETE CASCADE
);

CREATE INDEX idx_schedules_plantId ON schedules(plantId);
CREATE INDEX idx_schedules_nextDueDate ON schedules(nextDueDate);
CREATE INDEX idx_schedules_taskType ON schedules(taskType);
```

**Columns**:
- `id`: UUID primary key
- `plantId`: Foreign key to plants
- `taskType`: Water, Fertilize, Prune, Repot, Custom
- `frequency`: Days between tasks
- `lastCompleted`: Last completion timestamp
- `nextDueDate`: When task is next due
- `isActive`: Can disable schedules

---

### 3. **tasks**
Generated tasks from schedules (one entry per task instance).

```sql
CREATE TABLE tasks (
  id TEXT PRIMARY KEY,
  plantId TEXT NOT NULL,
  scheduleId TEXT NOT NULL,
  taskType TEXT NOT NULL,
  dueDate INTEGER NOT NULL,
  status TEXT NOT NULL,
  completedDate INTEGER,
  skippedDate INTEGER,
  notes TEXT,
  createdAt INTEGER NOT NULL,
  updatedAt INTEGER NOT NULL,
  FOREIGN KEY (plantId) REFERENCES plants(id) ON DELETE CASCADE,
  FOREIGN KEY (scheduleId) REFERENCES schedules(id) ON DELETE CASCADE
);

CREATE INDEX idx_tasks_plantId ON tasks(plantId);
CREATE INDEX idx_tasks_status ON tasks(status);
CREATE INDEX idx_tasks_dueDate ON tasks(dueDate);
CREATE INDEX idx_tasks_scheduleId ON tasks(scheduleId);
```

**Columns**:
- `status`: Pending, Completed, Skipped
- `completedDate`: When marked done
- `skippedDate`: When marked skipped

---

### 4. **history**
Log of all plant care actions.

```sql
CREATE TABLE history (
  id TEXT PRIMARY KEY,
  plantId TEXT NOT NULL,
  actionType TEXT NOT NULL,
  timestamp INTEGER NOT NULL,
  notes TEXT,
  photoPath TEXT,
  createdAt INTEGER NOT NULL,
  FOREIGN KEY (plantId) REFERENCES plants(id) ON DELETE CASCADE
);

CREATE INDEX idx_history_plantId ON history(plantId);
CREATE INDEX idx_history_timestamp ON history(timestamp);
CREATE INDEX idx_history_actionType ON history(actionType);
```

**Columns**:
- `actionType`: Watered, Fertilized, Pruned, Repotted, Note Added, Photo Added
- `photoPath`: Optional photo attachment

---

### 5. **notes**
Plant care notes and health tracking.

```sql
CREATE TABLE notes (
  id TEXT PRIMARY KEY,
  plantId TEXT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  photoPath TEXT,
  timestamp INTEGER NOT NULL,
  createdAt INTEGER NOT NULL,
  updatedAt INTEGER NOT NULL,
  FOREIGN KEY (plantId) REFERENCES plants(id) ON DELETE CASCADE
);

CREATE INDEX idx_notes_plantId ON notes(plantId);
CREATE INDEX idx_notes_timestamp ON notes(timestamp);
```

**Columns**:
- `title`: Note title
- `content`: Note text
- `photoPath`: Optional photo

---

### 6. **photos**
Metadata for plant photos with versioning.

```sql
CREATE TABLE photos (
  id TEXT PRIMARY KEY,
  plantId TEXT NOT NULL,
  photoPath TEXT NOT NULL,
  timestamp INTEGER NOT NULL,
  tags TEXT,
  createdAt INTEGER NOT NULL,
  FOREIGN KEY (plantId) REFERENCES plants(id) ON DELETE CASCADE
);

CREATE INDEX idx_photos_plantId ON photos(plantId);
CREATE INDEX idx_photos_timestamp ON photos(timestamp);
```

**Columns**:
- `tags`: Optional tags for categorization
- Supports photo history/progression

---

### 7. **settings**
App-wide settings and preferences.

```sql
CREATE TABLE settings (
  id TEXT PRIMARY KEY,
  key TEXT NOT NULL UNIQUE,
  value TEXT NOT NULL,
  updatedAt INTEGER NOT NULL
);

CREATE INDEX idx_settings_key ON settings(key);
```

**Columns**:
- `key`: Setting identifier (e.g., "notification_time")
- `value`: JSON-encoded value
- Examples:
  - `notification_time`: "08:00"
  - `theme_mode`: "system"
  - `last_backup_date`: "2024-01-15"

---

## Data Relationships

```
plants (1) ──── (N) schedules
  ↓
  ├──── (N) tasks
  │       └──── (1) schedules
  │
  ├──── (N) history
  │
  ├──── (N) notes
  │
  └──── (N) photos
```

## Indexing Strategy

**Primary Indexes** (by frequency of queries):
- `plants.id` (primary)
- `schedules.plantId, nextDueDate` (task queries)
- `tasks.plantId, status, dueDate` (dashboard queries)
- `history.plantId, timestamp` (history timeline)

**Benefits**:
- Faster `WHERE` clauses
- Efficient `ORDER BY` operations
- Quick date-range queries
- Plant-specific queries

---

## Migration Strategy

**Drift handles migrations automatically**:
```dart
// Version number increments with schema changes
@Database(version: 2)
class AppDatabase extends _$AppDatabase {
  // Migration from v1 to v2
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) => m.createAll(),
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        // Add new columns, tables, etc.
      }
    },
  );
}
```

---

## Query Patterns

### Upcoming Tasks (Next 7 days)
```dart
final tasks = await database.select(database.tasksTable)
  .where((t) => t.status.equals('Pending') & 
                t.dueDate.isBetweenValues(now, now + 7days))
  .get();
```

### Plant History Timeline
```dart
final history = await database.select(database.historyTable)
  .where((h) => h.plantId.equals(plantId))
  .orderBy([(h) => OrderingTerm(expression: h.timestamp, mode: OrderingMode.desc)])
  .limit(50)
  .get();
```

### Most Cared For Plants
```dart
final query = database.historyTable.plantId.count().as('count');
final results = await database
  .select(database.historyTable)
  .addColumns([query])
  .groupBy([database.historyTable.plantId])
  .orderBy([(t) => OrderingTerm(expression: query, mode: OrderingMode.desc)])
  .get();
```

---

## Performance Considerations

1. **Lazy Loading**: Load schedules only when viewing plant details
2. **Pagination**: Load history with pagination (latest first)
3. **Batch Operations**: Bulk insert tasks for all schedules
4. **Soft Deletes**: Use `isArchived` flag instead of actual deletion
5. **Cleanup**: Periodic cleanup of completed old tasks
6. **Snapshots**: Create weekly summary snapshots for statistics

---

## Backup/Restore Strategy

**Export**: Serialize all tables to JSON
**Import**: Transaction-based insertion with conflict handling
**Location**: Local filesystem (Documents folder)
**Format**: JSON with schema version for compatibility
