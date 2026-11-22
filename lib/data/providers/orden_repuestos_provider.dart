import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';
import 'repuestos_provider.dart';

final ordenRepuestosPorOrdenProvider = FutureProvider.family<List<OrdenRepuesto>, int>((ref, idOrden) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ordenRepuestos)..where((t) => t.idOrden.equals(idOrden))).get();
});

class OrdenRepuestosViewModel {
  final Ref ref;
  OrdenRepuestosViewModel(this.ref);

  Future<String?> agregarRepuestoAOrden({
    required int idOrden,
    required int idRepuesto,
    required int cantidad,
  }) async {
    if (cantidad <= 0) return 'La cantidad debe ser mayor a 0';
    final db = ref.read(databaseProvider);
    try {
      await db.transaction(() async {
        final repuesto = await (db.select(db.repuestos)..where((r) => r.id.equals(idRepuesto))).getSingleOrNull();
        if (repuesto == null) {
          throw Exception('Repuesto no encontrado');
        }
        if (repuesto.existencias < cantidad) {
          throw Exception('Existencias insuficientes. Disponibles: ${repuesto.existencias}');
        }
        await db.into(db.ordenRepuestos).insert(
          OrdenRepuestosCompanion.insert(
            idOrden: idOrden,
            idRepuesto: idRepuesto,
            cantidad: cantidad,
            precioUnitario: repuesto.precio,
          ),
        );
        final nuevasExistencias = repuesto.existencias - cantidad;
        await (db.update(db.repuestos)..where((r) => r.id.equals(idRepuesto))).write(
          RepuestosCompanion(existencias: Value(nuevasExistencias)),
        );
      });
      ref.invalidate(ordenRepuestosPorOrdenProvider(idOrden));
      ref.invalidate(repuestosProvider);
      return null; // ok
    } catch (e) {
      return e.toString().replaceFirst('Exception: ', '');
    }
  }

  Future<String?> eliminarRepuestoDeOrden({
    required int idOrdenRepuesto,
    required int idOrden,
    required int idRepuesto,
    required int cantidad,
  }) async {
    final db = ref.read(databaseProvider);
    try {
      await db.transaction(() async {
        final repuesto = await (db.select(db.repuestos)..where((r) => r.id.equals(idRepuesto))).getSingleOrNull();
        await (db.delete(db.ordenRepuestos)..where((t) => t.id.equals(idOrdenRepuesto))).go();
        if (repuesto != null) {
          final nuevasExistencias = repuesto.existencias + cantidad;
          await (db.update(db.repuestos)..where((r) => r.id.equals(idRepuesto))).write(
            RepuestosCompanion(existencias: Value(nuevasExistencias)),
          );
        }
      });
      ref.invalidate(ordenRepuestosPorOrdenProvider(idOrden));
      ref.invalidate(repuestosProvider);
      return null;
    } catch (e) {
      return e.toString().replaceFirst('Exception: ', '');
    }
  }
}

final ordenRepuestosViewModelProvider = Provider<OrdenRepuestosViewModel>((ref) => OrdenRepuestosViewModel(ref));
