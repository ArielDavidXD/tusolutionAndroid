import 'package:drift/drift.dart';

import 'ordenes.dart';

class TrabajosRealizados extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get idOrden => integer().references(Ordenes, #id)();

  TextColumn get descripcion => text()();

  RealColumn get costoManoObra => real()();

  DateTimeColumn get fecha =>
      dateTime().withDefault(currentDateAndTime)();
}