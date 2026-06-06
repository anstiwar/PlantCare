import 'package:drift/drift.dart';
import 'tables/plants_table.dart';

@DataClassName('HistoryEntry')
class HistoryTable extends Table {
  TextColumn get id => text()();
  TextColumn get plantId => text().references(PlantsTable, #id)();
  TextColumn get actionType => text()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get notes => text().nullable()();
  TextColumn get photoPath => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
