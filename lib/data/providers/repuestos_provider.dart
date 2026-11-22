import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';

final repuestosProvider = AsyncNotifierProvider<RepuestosViewModel, List<Repuesto>>(
  RepuestosViewModel.new,
);

class RepuestosViewModel extends AsyncNotifier<List<Repuesto>> {
  @override
  Future<List<Repuesto>> build() async {
    final db = ref.watch(databaseProvider);
    return (db.select(db.repuestos)..orderBy([(t) => OrderingTerm.asc(t.nombre)])).get();
  }

  Future<void> agregarRepuesto({
    required String nombre,
    required String codigo,
    required double precio,
    required int existencias,
  }) async {
    final db = ref.read(databaseProvider);
    await db.into(db.repuestos).insert(
      RepuestosCompanion.insert(
        nombre: nombre,
        codigo: codigo,
        precio: precio,
        existencias: existencias,
      ),
    );
    await _refresh(db);
  }

  Future<void> actualizarRepuesto({
    required int id,
    required String nombre,
    required String codigo,
    required double precio,
    required int existencias,
  }) async {
    final db = ref.read(databaseProvider);
    await (db.update(db.repuestos)..where((r) => r.id.equals(id))).write(
      RepuestosCompanion(
        nombre: Value(nombre),
        codigo: Value(codigo),
        precio: Value(precio),
        existencias: Value(existencias),
      ),
    );
    await _refresh(db);
  }

  Future<void> eliminarRepuesto(int id) async {
    final db = ref.read(databaseProvider);
    await (db.delete(db.repuestos)..where((r) => r.id.equals(id))).go();
    await _refresh(db);
  }

  Future<void> _refresh(AppDatabase db) async {
    state = await AsyncValue.guard(
      () => (db.select(db.repuestos)..orderBy([(t) => OrderingTerm.asc(t.nombre)])).get(),
    );
  }
}
