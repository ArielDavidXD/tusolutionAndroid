import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';

final tecnicosProvider = AsyncNotifierProvider<TecnicosViewModel, List<Tecnico>>(
  TecnicosViewModel.new,
);

class TecnicosViewModel extends AsyncNotifier<List<Tecnico>> {
  @override
  Future<List<Tecnico>> build() async {
    final db = ref.watch(databaseProvider);
    return db.select(db.tecnicos).get();
  }

  Future<void> agregarTecnico({
    required String nombre,
    required String telefono,
  }) async {
    final db = ref.read(databaseProvider);
    await db.into(db.tecnicos).insert(
      TecnicosCompanion.insert(
        nombre: nombre,
        telefono: telefono,
      ),
    );
    state = await AsyncValue.guard(() => db.select(db.tecnicos).get());
  }

  Future<void> actualizarTecnico({
    required int id,
    required String nombre,
    required String telefono,
  }) async {
    final db = ref.read(databaseProvider);
    await (db.update(db.tecnicos)..where((tecnico) => tecnico.id.equals(id))).write(
      TecnicosCompanion(
        nombre: Value(nombre),
        telefono: Value(telefono),
      ),
    );
    state = await AsyncValue.guard(() => db.select(db.tecnicos).get());
  }

  Future<void> eliminarTecnico(int id) async {
    final db = ref.read(databaseProvider);
    await (db.delete(db.tecnicos)..where((tecnico) => tecnico.id.equals(id))).go();
    state = await AsyncValue.guard(() => db.select(db.tecnicos).get());
  }
}
