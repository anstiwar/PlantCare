import 'package:drift/drift.dart';

@DataClassName('Plant')
class PlantsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get nickname => text().nullable()();
  TextColumn get photoPath => text().nullable()();
  TextColumn get species => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get category => text().nullable()();
  DateTimeColumn get dateAdded => dateTime()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
