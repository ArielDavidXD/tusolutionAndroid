import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/clientes_provider.dart';
import '../data/providers/equipos_provider.dart';

class EquiposFormScreen extends ConsumerStatefulWidget {
  final int? equipoId;
  final int? initialIdCliente;
  final String? initialTipoEquipo;
  final String? initialMarca;
  final String? initialModelo;
  final String? initialNumeroSerie;
  const EquiposFormScreen({
    super.key,
    this.equipoId,
    this.initialIdCliente,
    this.initialTipoEquipo,
    this.initialMarca,
    this.initialModelo,
    this.initialNumeroSerie,
  });

  @override
  ConsumerState<EquiposFormScreen> createState() => _EquiposFormScreenState();
}

class _EquiposFormScreenState extends ConsumerState<EquiposFormScreen> {
  final _formKey = GlobalKey<FormState>();
  int? _selectedClienteId;
  late final TextEditingController _tipoCtrl;
  late final TextEditingController _marcaCtrl;
  late final TextEditingController _modeloCtrl;
  late final TextEditingController _serieCtrl;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _selectedClienteId = widget.initialIdCliente;
    _tipoCtrl = TextEditingController(text: widget.initialTipoEquipo ?? '');
    _marcaCtrl = TextEditingController(text: widget.initialMarca ?? '');
    _modeloCtrl = TextEditingController(text: widget.initialModelo ?? '');
    _serieCtrl = TextEditingController(text: widget.initialNumeroSerie ?? '');
  }

  @override
  void dispose() {
    _tipoCtrl.dispose();
    _marcaCtrl.dispose();
    _modeloCtrl.dispose();
    _serieCtrl.dispose();
    super.dispose();
  }

  Future<void> _guardar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      if (widget.equipoId == null) {
        final id = await ref.read(equiposProvider.notifier).agregarEquipo(
              idCliente: _selectedClienteId!,
              tipoEquipo: _tipoCtrl.text.trim(),
              marca: _marcaCtrl.text.trim(),
              modelo: _modeloCtrl.text.trim(),
              numeroSerie: _serieCtrl.text.trim().isEmpty ? null : _serieCtrl.text.trim(),
            );
        if (mounted) Navigator.pop(context, id);
      } else {
        await ref.read(equiposProvider.notifier).actualizarEquipo(
              id: widget.equipoId!,
              idCliente: _selectedClienteId!,
              tipoEquipo: _tipoCtrl.text.trim(),
              marca: _marcaCtrl.text.trim(),
              modelo: _modeloCtrl.text.trim(),
              numeroSerie: _serieCtrl.text.trim().isEmpty ? null : _serieCtrl.text.trim(),
            );
        if (mounted) Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final clientesAsync = ref.watch(clientesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(widget.equipoId == null ? 'Nuevo equipo' : 'Editar equipo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: clientesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error clientes: $e')),
          data: (clientes) {
            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  DropdownButtonFormField<int>(
                    initialValue: _selectedClienteId,
                    decoration: const InputDecoration(labelText: 'Cliente'),
                    items: clientes.map((c) => DropdownMenuItem(value: c.id, child: Text(c.nombre))).toList(),
                    onChanged: (v) => setState(() => _selectedClienteId = v),
                    validator: (v) => v == null ? 'Seleccione un cliente' : null,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: _tipoCtrl.text.isEmpty ? null : _tipoCtrl.text,
                    decoration: const InputDecoration(labelText: 'Tipo de equipo'),
                    items: const ['Celular', 'Tablet', 'Laptop', 'Otro']
                        .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                        .toList(),
                    onChanged: (v) => setState(() => _tipoCtrl.text = v ?? ''),
                    validator: (v) => (v == null || v.isEmpty) ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _marcaCtrl,
                    decoration: const InputDecoration(labelText: 'Marca'),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _modeloCtrl,
                    decoration: const InputDecoration(labelText: 'Modelo'),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _serieCtrl,
                    decoration: const InputDecoration(labelText: 'Número de serie (opcional)'),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: _saving ? null : _guardar,
                    child: _saving ? const CircularProgressIndicator() : const Text('Guardar'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
