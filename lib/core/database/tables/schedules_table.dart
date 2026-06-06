import 'package:drift/drift.dart';
import 'plants_table.dart';

@DataClassName('Schedule')
class SchedulesTable extends Table {
  TextColumn get id => text()();
  TextColumn get plantId => text().references(PlantsTable, #id)();
  TextColumn get taskType => text()();
  IntColumn get frequency => integer()();
  DateTimeColumn get lastCompleted => dateTime().nullable()();
  DateTimeColumn get nextDueDate => dateTime()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
