import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/ordenes_provider.dart';
import '../data/widgets/order_card.dart';
import 'orders_form_screen.dart';
import 'orders_details_screen.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  String _filter = 'todas';

  @override
  Widget build(BuildContext context) {
    final ordenesAsync = ref.watch(ordenesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Órdenes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OrdersFormScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: ['todas', 'recibida', 'en reparación', 'lista', 'entregada', 'cancelada'].map((f) {
                final selected = _filter == f;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(f),
                    selected: selected,
                    onSelected: (_) => setState(() => _filter = f),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ordenesAsync.when(
              data: (ordenes) {
                final filtered = _filter == 'todas' ? ordenes : ordenes.where((o) => o.estado == _filter).toList();
                if (filtered.isEmpty) return const Center(child: Text('No hay órdenes.'));
                return ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final o = filtered[i];
                    return OrderCard(
                      title: 'Orden #${o.id}',
                      subtitle: 'Falla: ${o.fallaReportada}',
                      status: o.estado,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrdersDetailsScreen(orderId: o.id)));
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
