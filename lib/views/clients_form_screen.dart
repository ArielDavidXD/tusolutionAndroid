import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/clientes_provider.dart';

class ClientsFormScreen extends ConsumerStatefulWidget {
  final int? clientId;
  final String? initialNombre;
  final String? initialTelefono;
  const ClientsFormScreen({super.key, this.clientId, this.initialNombre, this.initialTelefono});

  @override
  ConsumerState<ClientsFormScreen> createState() => _ClientsFormScreenState();
}

class _ClientsFormScreenState extends ConsumerState<ClientsFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nombreCtrl;
  late final TextEditingController _telefonoCtrl;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _nombreCtrl = TextEditingController(text: widget.initialNombre ?? '');
    _telefonoCtrl = TextEditingController(text: widget.initialTelefono ?? '');
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _telefonoCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      if (widget.clientId == null) {
        final id = await ref.read(clientesProvider.notifier).agregarCliente(nombre: _nombreCtrl.text.trim(), telefono: _telefonoCtrl.text.trim());
        if (mounted) Navigator.pop(context, id);
      } else {
        await ref.read(clientesProvider.notifier).actualizarCliente(id: widget.clientId!, nombre: _nombreCtrl.text.trim(), telefono: _telefonoCtrl.text.trim());
        if (mounted) Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.clientId == null ? 'Nuevo cliente' : 'Editar cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreCtrl,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _telefonoCtrl,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                keyboardType: TextInputType.phone,
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _saving ? null : _save,
                  child: _saving ? const CircularProgressIndicator() : const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
