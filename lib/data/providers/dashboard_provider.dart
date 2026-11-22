import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';

class DashboardData {
  final int totalOrdenes;
  final int enReparacion;
  final int listas;
  final int entregadas;
  final int recibidas;
  final List<Ordene> recientes;
  final List<Repuesto> bajoStock;

  DashboardData({
    required this.totalOrdenes,
    required this.enReparacion,
    required this.listas,
    required this.entregadas,
    required this.recibidas,
    required this.recientes,
    required this.bajoStock,
  });
}

final dashboardProvider = FutureProvider<DashboardData>((ref) async {
  final db = ref.watch(databaseProvider);

  final ordenes = await db.select(db.ordenes).get();
  final totalOrdenes = ordenes.length;
  final recibidas = ordenes.where((o) => o.estado == 'recibida').length;
  final enReparacion = ordenes.where((o) => o.estado == 'en reparación').length;
  final listas = ordenes.where((o) => o.estado == 'lista').length;
  final entregadas = ordenes.where((o) => o.estado == 'entregada').length;

  final recientes = (await (db.select(db.ordenes)
        ..orderBy([(t) => OrderingTerm.desc(t.fechaRecepcion)])
        ..limit(5))
      .get());

  final bajoStock = (await (db.select(db.repuestos)
        ..where((r) => r.existencias.isSmallerOrEqualValue(5))
        ..orderBy([(t) => OrderingTerm.asc(t.existencias)]))
      .get());

  return DashboardData(
    totalOrdenes: totalOrdenes,
    enReparacion: enReparacion,
    listas: listas,
    entregadas: entregadas,
    recibidas: recibidas,
    recientes: recientes,
    bajoStock: bajoStock,
  );
});
