import 'package:drift/drift.dart';

import 'clientes.dart';

class Equipos extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idCliente => integer().references(Clientes, #id)();
  TextColumn get tipoEquipo => text()();
  TextColumn get marca => text()();
  TextColumn get modelo => text()();
  TextColumn get numeroSerie => text().nullable()();
}