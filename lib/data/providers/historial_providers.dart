import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';
import 'equipos_provider.dart';
import 'ordenes_provider.dart';

final equiposPorClienteProvider = FutureProvider.family<List<Equipo>, int>((ref, idCliente) async {
  final equipos = await ref.watch(equiposProvider.future);
  return equipos.where((e) => e.idCliente == idCliente).toList();
});

final ordenesPorEquipoProvider = FutureProvider.family<List<Ordene>, int>((ref, idEquipo) async {
  final ordenes = await ref.watch(ordenesProvider.future);
  return ordenes.where((o) => o.idEquipo == idEquipo).toList();
});

final ordenesPorClienteProvider = FutureProvider.family<List<Ordene>, int>((ref, idCliente) async {
  final equipos = await ref.watch(equiposPorClienteProvider(idCliente).future);
  final idsEquipos = equipos.map((e) => e.id).toSet();
  final ordenes = await ref.watch(ordenesProvider.future);
  return ordenes.where((o) => idsEquipos.contains(o.idEquipo)).toList();
});

final totalOrdenProvider = FutureProvider.family<double, int>((ref, idOrden) async {
  final db = ref.watch(databaseProvider);
  final trabajos = await (db.select(db.trabajosRealizados)..where((t) => t.idOrden.equals(idOrden))).get();
  final reps = await (db.select(db.ordenRepuestos)..where((t) => t.idOrden.equals(idOrden))).get();
  var total = trabajos.fold<double>(0, (s, t) => s + t.costoManoObra);
  for (final r in reps) {
    total += r.cantidad * r.precioUnitario;
  }
  return total;
});
