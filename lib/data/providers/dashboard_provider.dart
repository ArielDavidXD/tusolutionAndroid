import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'ordenes_provider.dart';
import 'repuestos_provider.dart';

class DashboardData {
  final int totalOrdenes;
  final int enReparacion;
  final int listas;
  final int entregadas;
  final int recibidas;
  final int canceladas;
  final List<Ordene> recientes;
  final List<Repuesto> bajoStock;

  DashboardData({
    required this.totalOrdenes,
    required this.enReparacion,
    required this.listas,
    required this.entregadas,
    required this.recibidas,
    required this.canceladas,
    required this.recientes,
    required this.bajoStock,
  });
}

final dashboardProvider = FutureProvider<DashboardData>((ref) async {
  final ordenes = await ref.watch(ordenesProvider.future);
  final repuestos = await ref.watch(repuestosProvider.future);

  final totalOrdenes = ordenes.length;
  final recibidas = ordenes.where((o) => o.estado == 'recibida').length;
  final enReparacion = ordenes.where((o) => o.estado == 'en reparación').length;
  final listas = ordenes.where((o) => o.estado == 'lista').length;
  final entregadas = ordenes.where((o) => o.estado == 'entregada').length;
  final canceladas = ordenes.where((o) => o.estado == 'cancelada').length;

  final recientes = ordenes.take(5).toList();

  final bajoStock = repuestos.where((r) => r.existencias <= 5).toList()
    ..sort((a, b) => a.existencias.compareTo(b.existencias));

  return DashboardData(
    totalOrdenes: totalOrdenes,
    enReparacion: enReparacion,
    listas: listas,
    entregadas: entregadas,
    recibidas: recibidas,
    canceladas: canceladas,
    recientes: recientes,
    bajoStock: bajoStock,
  );
});
