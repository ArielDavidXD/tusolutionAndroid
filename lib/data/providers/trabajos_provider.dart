import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';

final trabajosPorOrdenProvider = FutureProvider.family<List<TrabajosRealizado>, int>((ref, idOrden) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.trabajosRealizados)..where((t) => t.idOrden.equals(idOrden))..orderBy([(t) => OrderingTerm.desc(t.fecha)])).get();
});

class TrabajosViewModel {
  final Ref ref;
  TrabajosViewModel(this.ref);

  Future<void> agregarTrabajo({
    required int idOrden,
    required String descripcion,
    required double costoManoObra,
  }) async {
    final db = ref.read(databaseProvider);
    await db.into(db.trabajosRealizados).insert(
      TrabajosRealizadosCompanion.insert(
        idOrden: idOrden,
        descripcion: descripcion,
        costoManoObra: costoManoObra,
      ),
    );
    ref.invalidate(trabajosPorOrdenProvider(idOrden));
  }

  Future<void> eliminarTrabajo({required int id, required int idOrden}) async {
    final db = ref.read(databaseProvider);
    await (db.delete(db.trabajosRealizados)..where((t) => t.id.equals(id))).go();
    ref.invalidate(trabajosPorOrdenProvider(idOrden));
  }
}

final trabajosViewModelProvider = Provider<TrabajosViewModel>((ref) => TrabajosViewModel(ref));
