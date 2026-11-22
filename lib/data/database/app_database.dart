import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:tusolution/data/database/tables/clientes.dart';
import 'package:tusolution/data/database/tables/equipos.dart';
import 'package:tusolution/data/database/tables/orden_repuestos.dart';
import 'package:tusolution/data/database/tables/ordenes.dart';
import 'package:tusolution/data/database/tables/repuestos.dart';
import 'package:tusolution/data/database/tables/trabajos_realizados.dart';

import 'tables/tecnicos.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Tecnicos, Clientes, Repuestos, Equipos, Ordenes, TrabajosRealizados, OrdenRepuestos])
class AppDatabase extends _$AppDatabase {

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      // v1->v2: allow existencias >= 0 (constraint change handled by recreate in dev if needed)
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'tu_solution');
  }

  Future<int> insertarTecnicos({
    required String nombre,
    required String telefono,
}){
    return into(tecnicos).insert(
      TecnicosCompanion.insert(nombre: nombre, telefono: telefono)
    );
  }

  Future<List<Tecnico>> obtenerTecnicos(){
    return select(tecnicos).get();
}

  Future<bool> actualizarTecnico({
    required int id,
    required String nombre,
    required String telefono,
  }) async {
    final filasModificadas = await (update(tecnicos)
      ..where((t) => t.id.equals(id)))
        .write(
      TecnicosCompanion(
        nombre: Value(nombre),
        telefono: Value(telefono),
      ),
    );

    return filasModificadas > 0;
  }

  Future<int> eliminarTecnico(int id) {
    return (delete(tecnicos)
      ..where((t) => t.id.equals(id)))
        .go();
  }
}