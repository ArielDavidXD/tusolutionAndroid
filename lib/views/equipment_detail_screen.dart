import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/clientes_provider.dart';
import '../data/providers/equipos_provider.dart';
import '../data/providers/historial_providers.dart';
import '../data/widgets/order_history_tile.dart';
import 'equipos_form_screen.dart';

class EquipmentDetailScreen extends ConsumerWidget {
  final int equipoId;
  const EquipmentDetailScreen({super.key, required this.equipoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equiposAsync = ref.watch(equiposProvider);
    final clientesAsync = ref.watch(clientesProvider);
    final ordenesAsync = ref.watch(ordenesPorEquipoProvider(equipoId));

    final equipo = equiposAsync.value?.where((e) => e.id == equipoId).firstOrNull;
    final cliente = equipo != null
        ? clientesAsync.value?.where((c) => c.id == equipo.idCliente).firstOrNull
        : null;
    final ordenes = ordenesAsync.value ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(equipo != null ? '${equipo.tipoEquipo} ${equipo.marca} ${equipo.modelo}' : 'Equipo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(equipo != null ? '${equipo.tipoEquipo} ${equipo.marca} ${equipo.modelo}' : '—',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 4),
                        Text('Cliente: ${cliente?.nombre ?? '—'}'),
                        Text('Serie: ${equipo?.numeroSerie ?? 'Sin número de serie'}'),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    tooltip: 'Editar equipo',
                    onPressed: equipo == null
                        ? null
                        : () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => EquiposFormScreen(
                                  equipoId: equipo.id,
                                  initialIdCliente: equipo.idCliente,
                                  initialTipoEquipo: equipo.tipoEquipo,
                                  initialMarca: equipo.marca,
                                  initialModelo: equipo.modelo,
                                  initialNumeroSerie: equipo.numeroSerie,
                                ),
                              ),
                            );
                          },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Historial de reparaciones', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (ordenes.isEmpty) const Text('Este equipo no tiene órdenes.'),
          ...ordenes.map((o) => OrderHistoryTile(orden: o)),
        ],
      ),
    );
  }
}
