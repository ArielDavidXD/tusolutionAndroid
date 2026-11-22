import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';

final equiposProvider = AsyncNotifierProvider<EquiposViewModel, List<Equipo>>(
  EquiposViewModel.new,
);

class EquiposViewModel extends AsyncNotifier<List<Equipo>> {
  @override
  Future<List<Equipo>> build() async {
    final db = ref.watch(databaseProvider);
    return (db.select(db.equipos)..orderBy([(t) => OrderingTerm.desc(t.id)])).get();
  }

  Future<int> agregarEquipo({
    required int idCliente,
    required String tipoEquipo,
    required String marca,
    required String modelo,
    String? numeroSerie,
  }) async {
    final db = ref.read(databaseProvider);
    final id = await db.into(db.equipos).insert(
      EquiposCompanion.insert(
        idCliente: idCliente,
        tipoEquipo: tipoEquipo,
        marca: marca,
        modelo: modelo,
        numeroSerie: Value(numeroSerie),
      ),
    );
    await _refresh(db);
    return id;
  }

  Future<void> actualizarEquipo({
    required int id,
    required int idCliente,
    required String tipoEquipo,
    required String marca,
    required String modelo,
    String? numeroSerie,
  }) async {
    final db = ref.read(databaseProvider);
    await (db.update(db.equipos)..where((e) => e.id.equals(id))).write(
      EquiposCompanion(
        idCliente: Value(idCliente),
        tipoEquipo: Value(tipoEquipo),
        marca: Value(marca),
        modelo: Value(modelo),
        numeroSerie: Value(numeroSerie),
      ),
    );
    await _refresh(db);
  }

  Future<void> eliminarEquipo(int id) async {
    final db = ref.read(databaseProvider);
    await (db.delete(db.equipos)..where((e) => e.id.equals(id))).go();
    await _refresh(db);
  }

  Future<void> _refresh(AppDatabase db) async {
    state = await AsyncValue.guard(
      () => (db.select(db.equipos)..orderBy([(t) => OrderingTerm.desc(t.id)])).get(),
    );
  }
}
