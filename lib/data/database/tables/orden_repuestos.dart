import 'package:drift/drift.dart';

import 'ordenes.dart';
import 'repuestos.dart';

class OrdenRepuestos extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get idOrden => integer().references(Ordenes, #id)();

  IntColumn get idRepuesto => integer().references(Repuestos, #id)();

  IntColumn get cantidad => integer()();

  RealColumn get precioUnitario => real()();
}