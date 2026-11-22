import 'package:drift/drift.dart';

class Tecnicos extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text()();
  TextColumn get telefono => text()();
}