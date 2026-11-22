import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/clientes_provider.dart';
import '../data/providers/historial_providers.dart';
import '../data/widgets/order_history_tile.dart';
import 'clients_form_screen.dart';
import 'equipment_detail_screen.dart';
import 'equipos_form_screen.dart';

class ClientDetailScreen extends ConsumerWidget {
  final int clientId;
  const ClientDetailScreen({super.key, required this.clientId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientesAsync = ref.watch(clientesProvider);
    final equiposAsync = ref.watch(equiposPorClienteProvider(clientId));
    final ordenesAsync = ref.watch(ordenesPorClienteProvider(clientId));

    final cliente = clientesAsync.value?.where((c) => c.id == clientId).firstOrNull;
    final equipos = equiposAsync.value ?? [];
    final ordenes = ordenesAsync.value ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(cliente?.nombre ?? 'Cliente')),
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
                        Text(cliente?.nombre ?? '—',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 4),
                        Text('Teléfono: ${cliente?.telefono ?? '—'}'),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    tooltip: 'Editar cliente',
                    onPressed: cliente == null
                        ? null
                        : () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ClientsFormScreen(
                                  clientId: cliente.id,
                                  initialNombre: cliente.nombre,
                                  initialTelefono: cliente.telefono,
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
          Row(
            children: [
              Text('Equipos', style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => EquiposFormScreen(initialIdCliente: clientId),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Nuevo equipo'),
              ),
            ],
          ),
          if (equipos.isEmpty) const Text('Sin equipos registrados.'),
          ...equipos.map(
            (e) => Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => EquipmentDetailScreen(equipoId: e.id)),
                  );
                },
                title: Text('${e.tipoEquipo} ${e.marca} ${e.modelo}'),
                subtitle: Text(e.numeroSerie == null ? 'Sin número de serie' : 'Serie: ${e.numeroSerie}'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Historial de reparaciones', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (ordenes.isEmpty) const Text('Este cliente aún no tiene órdenes.'),
          ...ordenes.map(
            (o) {
              final eq = equipos.where((e) => e.id == o.idEquipo).firstOrNull;
              return OrderHistoryTile(
                orden: o,
                equipoLabel: eq != null ? '${eq.tipoEquipo} ${eq.marca} ${eq.modelo}' : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
