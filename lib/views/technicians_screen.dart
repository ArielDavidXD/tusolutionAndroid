import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/carga_tecnico_provider.dart';
import '../data/providers/tecnicos_provider.dart';
import 'technician_detail_screen.dart';
import 'technicias_form_screen.dart';

class TechniciansScreen extends ConsumerWidget {
  const TechniciansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tecnicosAsync = ref.watch(tecnicosProvider);
    final cargaAsync = ref.watch(cargaTecnicosProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Técnicos')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const TechniciansFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: tecnicosAsync.when(
        data: (tecnicos) {
          if (tecnicos.isEmpty) {
            return const Center(child: Text('No hay técnicos registrados.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: tecnicos.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final t = tecnicos[i];
              final carga = cargaAsync.value?.where((c) => c.tecnico.id == t.id).firstOrNull;
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => TechnicianDetailScreen(tecnicoId: t.id)),
                    );
                  },
                  title: Text(t.nombre),
                  subtitle: Text(
                    '${t.telefono}'
                    '${carga != null ? ' • ${carga.abiertas} abiertas • ${carga.listas} listas • ${carga.entregadas} entregadas' : ''}',
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (v) async {
                      if (v == 'edit') {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => TechniciansFormScreen(technicianId: t.id, initialNombre: t.nombre, initialTelefono: t.telefono)),
                        );
                      } else if (v == 'delete') {
                        final ok = await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Eliminar técnico'),
                            content: const Text('¿Seguro que deseas eliminar este técnico?'),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
                              TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Eliminar')),
                            ],
                          ),
                        );
                        if (ok == true) {
                          await ref.read(tecnicosProvider.notifier).eliminarTecnico(t.id);
                        }
                      }
                    },
                    itemBuilder: (_) => const [
                      PopupMenuItem(value: 'edit', child: Text('Editar')),
                      PopupMenuItem(value: 'delete', child: Text('Eliminar')),
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
    );
  }
}
