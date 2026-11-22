import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';
import 'ordenes_provider.dart';

class CargaTecnico {
  final Tecnico tecnico;
  final int totalAsignadas;
  final int abiertas;
  final int listas;
  final int entregadas;
  final int canceladas;

  CargaTecnico({
    required this.tecnico,
    required this.totalAsignadas,
    required this.abiertas,
    required this.listas,
    required this.entregadas,
    required this.canceladas,
  });
}

final cargaTecnicosProvider = FutureProvider<List<CargaTecnico>>((ref) async {
  final db = ref.watch(databaseProvider);
  final tecnicos = await db.select(db.tecnicos).get();
  final ordenes = await ref.watch(ordenesProvider.future);

  return tecnicos.map((t) {
    final suyas = ordenes.where((o) => o.idTecnico == t.id).toList();
    return CargaTecnico(
      tecnico: t,
      totalAsignadas: suyas.length,
      abiertas: suyas.where((o) => o.estado == 'recibida' || o.estado == 'en reparación').length,
      listas: suyas.where((o) => o.estado == 'lista').length,
      entregadas: suyas.where((o) => o.estado == 'entregada').length,
      canceladas: suyas.where((o) => o.estado == 'cancelada').length,
    );
  }).toList();
});
