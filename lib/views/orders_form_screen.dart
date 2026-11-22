import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/clientes_provider.dart';
import '../data/providers/equipos_provider.dart';
import '../data/providers/tecnicos_provider.dart';
import '../data/providers/ordenes_provider.dart';
import '../data/database/app_database.dart';
import 'equipos_form_screen.dart';

class OrdersFormScreen extends ConsumerStatefulWidget {
  final int? orderId;
  final int? initialIdEquipo;
  final int? initialIdTecnico;
  final String? initialFalla;
  final String? initialEstado;
  const OrdersFormScreen({super.key, this.orderId, this.initialIdEquipo, this.initialIdTecnico, this.initialFalla, this.initialEstado});

  @override
  ConsumerState<OrdersFormScreen> createState() => _OrdersFormScreenState();
}

class _OrdersFormScreenState extends ConsumerState<OrdersFormScreen> {
  final _formKey = GlobalKey<FormState>();
  int? _selectedClienteId;
  int? _selectedEquipoId;
  int? _selectedTecnicoId;
  late final TextEditingController _fallaCtrl;
  String _estado = 'recibida';
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _fallaCtrl = TextEditingController(text: widget.initialFalla ?? '');
    _selectedEquipoId = widget.initialIdEquipo;
    _selectedTecnicoId = widget.initialIdTecnico;
    _estado = widget.initialEstado ?? 'recibida';
  }

  @override
  void dispose() {
    _fallaCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clientesAsync = ref.watch(clientesProvider);
    final equiposAsync = ref.watch(equiposProvider);
    final tecnicosAsync = ref.watch(tecnicosProvider);

    return Scaffold(
      appBar: AppBar(title: Text(widget.orderId == null ? 'Nueva orden' : 'Editar orden')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: clientesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error clientes: $e')),
          data: (clientes) {
            return equiposAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error equipos: $e')),
              data: (equipos) {
                return tecnicosAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error técnicos: $e')),
                  data: (tecnicos) {
                    // try infer cliente from equipo if editing
                    if (_selectedClienteId == null && _selectedEquipoId != null) {
                      final eq = equipos.where((e) => e.id == _selectedEquipoId).firstOrNull;
                      _selectedClienteId = eq?.idCliente;
                    }
                    final equiposDelCliente = _selectedClienteId == null
                        ? <Equipo>[]
                        : equipos.where((e) => e.idCliente == _selectedClienteId).toList();

                    return Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          DropdownButtonFormField<int>(
                            initialValue: _selectedClienteId,
                            decoration: const InputDecoration(labelText: 'Cliente'),
                            items: clientes.map((c) => DropdownMenuItem(value: c.id, child: Text(c.nombre))).toList(),
                            onChanged: (v) => setState(() {
                              _selectedClienteId = v;
                              _selectedEquipoId = null;
                            }),
                            validator: (v) => v == null ? 'Seleccione un cliente' : null,
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<int>(
                            key: ValueKey('equipo_$_selectedClienteId'),
                            initialValue: _selectedEquipoId,
                            decoration: const InputDecoration(labelText: 'Equipo'),
                            items: equiposDelCliente.map((e) => DropdownMenuItem(value: e.id, child: Text('${e.tipoEquipo} ${e.marca} ${e.modelo}'))).toList(),
                            onChanged: (v) => setState(() => _selectedEquipoId = v),
                            validator: (v) => v == null ? 'Seleccione un equipo' : null,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton.icon(
                              onPressed: _selectedClienteId == null
                                  ? null
                                  : () async {
                                      final nuevoId = await Navigator.of(context).push<int>(
                                        MaterialPageRoute(builder: (_) => EquiposFormScreen(initialIdCliente: _selectedClienteId)),
                                      );
                                      if (nuevoId != null && mounted) {
                                        setState(() => _selectedEquipoId = nuevoId);
                                      }
                                    },
                              icon: const Icon(Icons.add),
                              label: const Text('Registrar nuevo equipo'),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _fallaCtrl,
                            decoration: const InputDecoration(labelText: 'Falla reportada'),
                            maxLines: 2,
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<int?>(
                            initialValue: _selectedTecnicoId,
                            decoration: const InputDecoration(labelText: 'Técnico (opcional)'),
                            items: [
                              const DropdownMenuItem<int?>(value: null, child: Text('Sin asignar')),
                              ...tecnicos.map((t) => DropdownMenuItem<int?>(value: t.id, child: Text(t.nombre))),
                            ],
                            onChanged: (v) => setState(() => _selectedTecnicoId = v),
                          ),
                          if (widget.orderId != null) ...[
                            const SizedBox(height: 12),
                            DropdownButtonFormField<String>(
                              initialValue: _estado,
                              decoration: const InputDecoration(labelText: 'Estado'),
                              items: const [
                                DropdownMenuItem(value: 'recibida', child: Text('recibida')),
                                DropdownMenuItem(value: 'en reparación', child: Text('en reparación')),
                                DropdownMenuItem(value: 'lista', child: Text('lista')),
                                DropdownMenuItem(value: 'entregada', child: Text('entregada')),
                                DropdownMenuItem(value: 'cancelada', child: Text('cancelada')),
                              ],
                              onChanged: (v) => setState(() => _estado = v ?? 'recibida'),
                            ),
                          ],
                          const SizedBox(height: 20),
                          FilledButton(
                            onPressed: _saving ? null : () async {
                              if (!_formKey.currentState!.validate()) return;
                              setState(() => _saving = true);
                              try {
                                if (widget.orderId == null) {
                                  await ref.read(ordenesProvider.notifier).crearOrden(
                                    idEquipo: _selectedEquipoId!,
                                    idTecnico: _selectedTecnicoId,
                                    fallaReportada: _fallaCtrl.text.trim(),
                                  );
                                } else {
                                  DateTime? fechaEntrega;
                                  if (_estado == 'entregada') fechaEntrega = DateTime.now();
                                  await ref.read(ordenesProvider.notifier).actualizarOrden(
                                    id: widget.orderId!,
                                    idEquipo: _selectedEquipoId!,
                                    idTecnico: _selectedTecnicoId,
                                    fallaReportada: _fallaCtrl.text.trim(),
                                    estado: _estado,
                                    fechaEntrega: fechaEntrega,
                                  );
                                }
                                if (context.mounted) Navigator.pop(context);
                              } catch (e) {
                                if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                              } finally {
                                if (mounted) setState(() => _saving = false);
                              }
                            },
                            child: _saving ? const CircularProgressIndicator() : const Text('Guardar'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
