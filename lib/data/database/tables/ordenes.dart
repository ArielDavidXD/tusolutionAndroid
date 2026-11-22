import 'package:drift/drift.dart';

import 'equipos.dart';
import 'tecnicos.dart';

class Ordenes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get idEquipo => integer().references(Equipos, #id)();

  IntColumn get idTecnico =>
      integer().nullable().references(Tecnicos, #id)();

  TextColumn get fallaReportada => text()();

  TextColumn get estado =>
      text().withDefault(const Constant('recibida'))();

  DateTimeColumn get fechaRecepcion =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get fechaEntrega => dateTime().nullable()();
}