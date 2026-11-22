import 'package:drift/drift.dart';

class Ajustes extends Table {
  TextColumn get clave => text()();
  TextColumn get valor => text().nullable()();

  @override
  Set<Column> get primaryKey => {clave};
}
