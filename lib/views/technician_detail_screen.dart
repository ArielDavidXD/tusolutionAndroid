import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/carga_tecnico_provider.dart';
import '../data/providers/equipos_provider.dart';
import '../data/providers/ordenes_provider.dart';
import '../data/widgets/order_history_tile.dart';
import '../data/widgets/summary_card.dart';
import 'technicias_form_screen.dart';

class TechnicianDetailScreen extends ConsumerWidget {
  final int tecnicoId;
  const TechnicianDetailScreen({super.key, required this.tecnicoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cargaAsync = ref.watch(cargaTecnicosProvider);
    final ordenesAsync = ref.watch(ordenesProvider);
    final equiposAsync = ref.watch(equiposProvider);

    final carga = cargaAsync.value?.where((c) => c.tecnico.id == tecnicoId).firstOrNull;
    final ordenes = (ordenesAsync.value ?? []).where((o) => o.idTecnico == tecnicoId).toList();
    final equipos = equiposAsync.value ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(carga?.tecnico.nombre ?? 'Técnico'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Editar técnico',
            onPressed: carga == null
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => TechniciansFormScreen(
                          technicianId: carga.tecnico.id,
                          initialNombre: carga.tecnico.nombre,
                          initialTelefono: carga.tecnico.telefono,
                        ),
                      ),
                    );
                  },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Teléfono: ${carga?.tecnico.telefono ?? '—'}'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SizedBox(width: 160, child: SummaryCard(title: 'Asignadas', value: '${carga?.totalAsignadas ?? 0}', icon: Icons.receipt_long)),
              SizedBox(width: 160, child: SummaryCard(title: 'Abiertas', value: '${carga?.abiertas ?? 0}', icon: Icons.build, color: Colors.orange)),
              SizedBox(width: 160, child: SummaryCard(title: 'Listas', value: '${carga?.listas ?? 0}', icon: Icons.check_circle_outline, color: Colors.green)),
              SizedBox(width: 160, child: SummaryCard(title: 'Entregadas', value: '${carga?.entregadas ?? 0}', icon: Icons.done_all, color: Colors.teal)),
              SizedBox(width: 160, child: SummaryCard(title: 'Canceladas', value: '${carga?.canceladas ?? 0}', icon: Icons.cancel_outlined, color: Colors.red)),
            ],
          ),
          const SizedBox(height: 16),
          Text('Órdenes asignadas', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (ordenes.isEmpty) const Text('Este técnico no tiene órdenes asignadas.'),
          ...ordenes.map((o) {
            final eq = equipos.where((e) => e.id == o.idEquipo).firstOrNull;
            return OrderHistoryTile(
              orden: o,
              equipoLabel: eq != null ? '${eq.tipoEquipo} ${eq.marca} ${eq.modelo}' : null,
            );
          }),
        ],
      ),
    );
  }
}
