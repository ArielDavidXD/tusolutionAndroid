import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/dashboard_provider.dart';
import '../data/widgets/summary_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashAsync = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tu Solution')),
      body: dashAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (d) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  SizedBox(width: 160, child: SummaryCard(title: 'Total', value: '${d.totalOrdenes}', icon: Icons.receipt_long)),
                  SizedBox(width: 160, child: SummaryCard(title: 'Recibidas', value: '${d.recibidas}', icon: Icons.inbox)),
                  SizedBox(width: 160, child: SummaryCard(title: 'En reparación', value: '${d.enReparacion}', icon: Icons.build)),
                  SizedBox(width: 160, child: SummaryCard(title: 'Listas', value: '${d.listas}', icon: Icons.check_circle_outline)),
                  SizedBox(width: 160, child: SummaryCard(title: 'Entregadas', value: '${d.entregadas}', icon: Icons.done_all)),
                ],
              ),
              const SizedBox(height: 16),
              Text('Órdenes recientes', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              if (d.recientes.isEmpty) const Text('No hay órdenes recientes.'),
              ...d.recientes.map((o) => ListTile(
                title: Text('Orden #${o.id}'),
                subtitle: Text('${o.estado} • ${o.fallaReportada}'),
              )),
              const SizedBox(height: 16),
              Text('Inventario bajo (<=5)', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              if (d.bajoStock.isEmpty) const Text('Sin alertas de stock bajo.'),
              ...d.bajoStock.map((r) => ListTile(
                title: Text(r.nombre),
                subtitle: Text('Stock: ${r.existencias} • Código: ${r.codigo}'),
              )),
            ],
          );
        },
      ),
    );
  }
}
