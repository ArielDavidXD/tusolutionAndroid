import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';

final ordenesProvider = AsyncNotifierProvider<OrdenesViewModel, List<Ordene>>(
  OrdenesViewModel.new,
);

class OrdenesViewModel extends AsyncNotifier<List<Ordene>> {
  @override
  Future<List<Ordene>> build() async {
    final db = ref.watch(databaseProvider);
    return (db.select(db.ordenes)..orderBy([(t) => OrderingTerm.desc(t.fechaRecepcion)])).get();
  }

  Future<int> crearOrden({
    required int idEquipo,
    int? idTecnico,
    required String fallaReportada,
  }) async {
    final db = ref.read(databaseProvider);
    final id = await db.into(db.ordenes).insert(
      OrdenesCompanion.insert(
        idEquipo: idEquipo,
        idTecnico: Value(idTecnico),
        fallaReportada: fallaReportada,
      ),
    );
    await _refresh(db);
    return id;
  }

  Future<void> actualizarOrden({
    required int id,
    required int idEquipo,
    int? idTecnico,
    required String fallaReportada,
    required String estado,
    DateTime? fechaEntrega,
  }) async {
    final db = ref.read(databaseProvider);
    await (db.update(db.ordenes)..where((o) => o.id.equals(id))).write(
      OrdenesCompanion(
        idEquipo: Value(idEquipo),
        idTecnico: Value(idTecnico),
        fallaReportada: Value(fallaReportada),
        estado: Value(estado),
        fechaEntrega: Value(fechaEntrega),
      ),
    );
    await _refresh(db);
  }

  Future<void> cambiarEstado({
    required int id,
    required String estado,
    DateTime? fechaEntrega,
  }) async {
    final db = ref.read(databaseProvider);
    await (db.update(db.ordenes)..where((o) => o.id.equals(id))).write(
      OrdenesCompanion(
        estado: Value(estado),
        fechaEntrega: Value(fechaEntrega),
      ),
    );
    await _refresh(db);
  }

  Future<void> _refresh(AppDatabase db) async {
    state = await AsyncValue.guard(
      () => (db.select(db.ordenes)..orderBy([(t) => OrderingTerm.desc(t.fechaRecepcion)])).get(),
    );
  }
}
