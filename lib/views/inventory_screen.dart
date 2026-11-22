import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/repuestos_provider.dart';
import 'part_form_screen.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final repuestosAsync = ref.watch(repuestosProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Inventario')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PartFormScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Buscar por nombre o código'),
              onChanged: (v) => setState(() => _query = v.trim().toLowerCase()),
            ),
          ),
          Expanded(
            child: repuestosAsync.when(
              data: (repuestos) {
                final filtered = repuestos.where((r) {
                  if (_query.isEmpty) return true;
                  return r.nombre.toLowerCase().contains(_query) || r.codigo.toLowerCase().contains(_query);
                }).toList();
                if (filtered.isEmpty) return const Center(child: Text('No hay repuestos.'));
                return ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final r = filtered[i];
                    final low = r.existencias <= 5;
                    return Card(
                      color: low ? Colors.red.withOpacity(0.06) : null,
                      child: ListTile(
                        title: Text(r.nombre),
                        subtitle: Text('Código: ${r.codigo} • Stock: ${r.existencias} • \$${r.precio.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (low)
                              const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Icons.warning_amber_rounded, color: Colors.orange),
                              ),
                            PopupMenuButton<String>(
                              onSelected: (v) async {
                                if (v == 'edit') {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => PartFormScreen(partId: r.id, initialNombre: r.nombre, initialCodigo: r.codigo, initialPrecio: r.precio, initialExistencias: r.existencias)));
                                } else if (v == 'delete') {
                                  final ok = await showDialog<bool>(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text('Eliminar repuesto'),
                                      content: const Text('¿Seguro que deseas eliminar este repuesto?'),
                                      actions: [
                                        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
                                        TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Eliminar')),
                                      ],
                                    ),
                                  );
                                  if (ok == true) {
                                    await ref.read(repuestosProvider.notifier).eliminarRepuesto(r.id);
                                  }
                                }
                              },
                              itemBuilder: (_) => const [
                                PopupMenuItem(value: 'edit', child: Text('Editar')),
                                PopupMenuItem(value: 'delete', child: Text('Eliminar')),
                              ],
                            ),
                          ],
                        ),
                      ),
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
