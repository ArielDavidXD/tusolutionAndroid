import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/ordenes_provider.dart';
import '../data/providers/equipos_provider.dart';
import '../data/providers/clientes_provider.dart';
import '../data/providers/tecnicos_provider.dart';
import '../data/providers/trabajos_provider.dart';
import '../data/providers/orden_repuestos_provider.dart';
import '../data/providers/repuestos_provider.dart';
import '../data/widgets/status_badge.dart';
import 'orders_form_screen.dart';

class OrdersDetailsScreen extends ConsumerWidget {
  final int orderId;
  const OrdersDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordenesAsync = ref.watch(ordenesProvider);
    final equiposAsync = ref.watch(equiposProvider);
    final clientesAsync = ref.watch(clientesProvider);
    final tecnicosAsync = ref.watch(tecnicosProvider);
    final trabajosAsync = ref.watch(trabajosPorOrdenProvider(orderId));
    final ordenRepuestosAsync = ref.watch(ordenRepuestosPorOrdenProvider(orderId));
    final repuestosAsync = ref.watch(repuestosProvider);

    final orden = ordenesAsync.value?.where((o) => o.id == orderId).firstOrNull;

    return Scaffold(
      appBar: AppBar(
        title: Text('Orden #$orderId'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Editar orden',
            onPressed: orden == null
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => OrdersFormScreen(
                          orderId: orden.id,
                          initialIdEquipo: orden.idEquipo,
                          initialIdTecnico: orden.idTecnico,
                          initialFalla: orden.fallaReportada,
                          initialEstado: orden.estado,
                        ),
                      ),
                    );
                  },
          ),
        ],
      ),
      body: ordenesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (ordenes) {
          if (orden == null) return const Center(child: Text('Orden no encontrada'));
          final equipo = equiposAsync.value?.where((e) => e.id == orden.idEquipo).firstOrNull;
          final cliente = (equipo != null) ? clientesAsync.value?.where((c) => c.id == equipo.idCliente).firstOrNull : null;
          final tecnico = orden.idTecnico != null ? tecnicosAsync.value?.where((t) => t.id == orden.idTecnico).firstOrNull : null;

          final trabajos = trabajosAsync.value ?? [];
          final totalManoObra = trabajos.fold<double>(0, (s, t) => s + t.costoManoObra);
          final ordenReps = ordenRepuestosAsync.value ?? [];
          final repuestosList = repuestosAsync.value ?? [];
          double totalRepuestos = 0;
          for (final orp in ordenReps) {
            totalRepuestos += orp.cantidad * orp.precioUnitario;
          }
          final total = totalManoObra + totalRepuestos;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        const Text('Estado', style: TextStyle(fontWeight: FontWeight.bold)),
                        StatusBadge(status: orden.estado),
                      ]),
                      const SizedBox(height: 8),
                      Text('Cliente: ${cliente?.nombre ?? '—'}'),
                      Text('Equipo: ${equipo != null ? "${equipo.tipoEquipo} ${equipo.marca} ${equipo.modelo}" : '—'}'),
                      Text('Técnico: ${tecnico?.nombre ?? 'Sin asignar'}'),
                      const SizedBox(height: 8),
                      Text('Falla: ${orden.fallaReportada}'),
                      Text('Total estimado: \$${total.toStringAsFixed(2)} (Mano obra: \$${totalManoObra.toStringAsFixed(2)} + Repuestos: \$${totalRepuestos.toStringAsFixed(2)})'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: () => _cambiarEstado(context, ref, orden.estado), child: const Text('Cambiar estado'))),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Trabajos realizados', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...trabajos.map((t) => ListTile(
                title: Text(t.descripcion),
                subtitle: Text('\$${t.costoManoObra.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () async {
                    await ref.read(trabajosViewModelProvider).eliminarTrabajo(id: t.id, idOrden: orderId);
                  },
                ),
              )),
              TextButton.icon(
                onPressed: () => _addTrabajo(context, ref),
                icon: const Icon(Icons.add),
                label: const Text('Agregar trabajo'),
              ),
              const Divider(),
              const Text('Repuestos utilizados', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...ordenReps.map((orp) {
                final rep = repuestosList.where((r) => r.id == orp.idRepuesto).firstOrNull;
                return ListTile(
                  title: Text(rep?.nombre ?? 'Repuesto #${orp.idRepuesto}'),
                  subtitle: Text('Cant: ${orp.cantidad} x \$${orp.precioUnitario.toStringAsFixed(2)} = \$${(orp.cantidad * orp.precioUnitario).toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () async {
                      final err = await ref.read(ordenRepuestosViewModelProvider).eliminarRepuestoDeOrden(idOrdenRepuesto: orp.id, idOrden: orderId, idRepuesto: orp.idRepuesto, cantidad: orp.cantidad);
                      if (err != null && context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
                    },
                  ),
                );
              }),
              TextButton.icon(
                onPressed: () => _addRepuesto(context, ref, repuestosList),
                icon: const Icon(Icons.add),
                label: const Text('Agregar repuesto'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _cambiarEstado(BuildContext context, WidgetRef ref, String current) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['recibida', 'en reparación', 'lista', 'entregada', 'cancelada'].map((s) => ListTile(
            title: Text(s),
            onTap: () async {
              Navigator.pop(context);
              DateTime? fechaEntrega;
              if (s == 'entregada') fechaEntrega = DateTime.now();
              await ref.read(ordenesProvider.notifier).cambiarEstado(id: orderId, estado: s, fechaEntrega: fechaEntrega);
            },
          )).toList(),
        ),
      ),
    );
  }

  void _addTrabajo(BuildContext context, WidgetRef ref) {
    final descCtrl = TextEditingController();
    final costoCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Agregar trabajo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Descripción')),
            TextField(controller: costoCtrl, decoration: const InputDecoration(labelText: 'Costo mano de obra'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          TextButton(onPressed: () async {
            final costo = double.tryParse(costoCtrl.text.trim()) ?? 0;
            if (descCtrl.text.trim().isEmpty || costo < 0) return;
            await ref.read(trabajosViewModelProvider).agregarTrabajo(idOrden: orderId, descripcion: descCtrl.text.trim(), costoManoObra: costo);
            if (context.mounted) Navigator.pop(context);
          }, child: const Text('Guardar')),
        ],
      ),
    );
  }

  void _addRepuesto(BuildContext context, WidgetRef ref, List repuestosList) {
    int? selectedId;
    final cantCtrl = TextEditingController(text: '1');
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Agregar repuesto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(labelText: 'Repuesto'),
                items: repuestosList.map<DropdownMenuItem<int>>((r) => DropdownMenuItem(value: r.id as int, child: Text('${r.nombre} (stock: ${r.existencias})'))).toList(),
                onChanged: (v) => setState(() => selectedId = v),
              ),
              TextField(controller: cantCtrl, decoration: const InputDecoration(labelText: 'Cantidad'), keyboardType: TextInputType.number),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
            TextButton(onPressed: () async {
              final cant = int.tryParse(cantCtrl.text.trim()) ?? 0;
              if (selectedId == null || cant <= 0) return;
              final err = await ref.read(ordenRepuestosViewModelProvider).agregarRepuestoAOrden(idOrden: orderId, idRepuesto: selectedId!, cantidad: cant);
              if (context.mounted) {
                Navigator.pop(context);
                if (err != null) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
              }
            }, child: const Text('Agregar')),
          ],
        ),
      ),
    );
  }
}
