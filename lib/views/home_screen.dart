import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/dashboard_provider.dart';
import '../data/providers/theme_provider.dart';
import '../data/widgets/summary_card.dart';
import 'orders_details_screen.dart';

class HomeScreen extends ConsumerWidget {
  final VoidCallback? onGoToOrders;
  final VoidCallback? onGoToInventory;
  const HomeScreen({super.key, this.onGoToOrders, this.onGoToInventory});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashAsync = ref.watch(dashboardProvider);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Solution'),
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.palette_outlined),
            tooltip: 'Cambiar tema',
            initialValue: themeMode,
            onSelected: (mode) => ref.read(themeModeProvider.notifier).cambiarTema(mode),
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: ThemeMode.system,
                child: Row(children: [Icon(Icons.brightness_auto), SizedBox(width: 8), Text('Sistema')]),
              ),
              PopupMenuItem(
                value: ThemeMode.light,
                child: Row(children: [Icon(Icons.light_mode), SizedBox(width: 8), Text('Claro')]),
              ),
              PopupMenuItem(
                value: ThemeMode.dark,
                child: Row(children: [Icon(Icons.dark_mode), SizedBox(width: 8), Text('Oscuro')]),
              ),
            ],
          ),
        ],
      ),
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
                  SizedBox(width: 160, child: SummaryCard(title: 'Total', value: '${d.totalOrdenes}', icon: Icons.receipt_long, onTap: onGoToOrders)),
                  SizedBox(width: 160, child: SummaryCard(title: 'Recibidas', value: '${d.recibidas}', icon: Icons.inbox, color: Colors.blueGrey, onTap: onGoToOrders)),
                  SizedBox(width: 160, child: SummaryCard(title: 'En reparación', value: '${d.enReparacion}', icon: Icons.build, color: Colors.orange, onTap: onGoToOrders)),
                  SizedBox(width: 160, child: SummaryCard(title: 'Listas', value: '${d.listas}', icon: Icons.check_circle_outline, color: Colors.green, onTap: onGoToOrders)),
                  SizedBox(width: 160, child: SummaryCard(title: 'Entregadas', value: '${d.entregadas}', icon: Icons.done_all, color: Colors.teal, onTap: onGoToOrders)),
                  SizedBox(width: 160, child: SummaryCard(title: 'Canceladas', value: '${d.canceladas}', icon: Icons.cancel_outlined, color: Colors.red, onTap: onGoToOrders)),
                ],
              ),
              const SizedBox(height: 16),
              Text('Órdenes recientes', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              if (d.recientes.isEmpty) const Text('No hay órdenes recientes.'),
              ...d.recientes.map((o) => Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => OrdersDetailsScreen(orderId: o.id)),
                    );
                  },
                  title: Text('Orden #${o.id}'),
                  subtitle: Text('${o.estado} • ${o.fallaReportada}'),
                  trailing: const Icon(Icons.chevron_right),
                ),
              )),
              const SizedBox(height: 16),
              Text('Inventario bajo (<=5)', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              if (d.bajoStock.isEmpty) const Text('Sin alertas de stock bajo.'),
              ...d.bajoStock.map((r) => Card(
                child: ListTile(
                  onTap: onGoToInventory,
                  leading: const Icon(Icons.warning_amber_rounded, color: Colors.orange),
                  title: Text(r.nombre),
                  subtitle: Text('Stock: ${r.existencias} • Código: ${r.codigo}'),
                  trailing: const Icon(Icons.chevron_right),
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}
