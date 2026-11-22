import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/providers/repuestos_provider.dart';

class PartFormScreen extends ConsumerStatefulWidget {
  final int? partId;
  final String? initialNombre;
  final String? initialCodigo;
  final double? initialPrecio;
  final int? initialExistencias;
  const PartFormScreen({super.key, this.partId, this.initialNombre, this.initialCodigo, this.initialPrecio, this.initialExistencias});

  @override
  ConsumerState<PartFormScreen> createState() => _PartFormScreenState();
}

class _PartFormScreenState extends ConsumerState<PartFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nombreCtrl;
  late final TextEditingController _codigoCtrl;
  late final TextEditingController _precioCtrl;
  late final TextEditingController _existCtrl;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _nombreCtrl = TextEditingController(text: widget.initialNombre ?? '');
    _codigoCtrl = TextEditingController(text: widget.initialCodigo ?? '');
    _precioCtrl = TextEditingController(text: widget.initialPrecio?.toString() ?? '');
    _existCtrl = TextEditingController(text: widget.initialExistencias?.toString() ?? '0');
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _codigoCtrl.dispose();
    _precioCtrl.dispose();
    _existCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final precio = double.tryParse(_precioCtrl.text.trim()) ?? -1;
      final exist = int.tryParse(_existCtrl.text.trim()) ?? -1;
      if (widget.partId == null) {
        await ref.read(repuestosProvider.notifier).agregarRepuesto(nombre: _nombreCtrl.text.trim(), codigo: _codigoCtrl.text.trim(), precio: precio, existencias: exist);
      } else {
        await ref.read(repuestosProvider.notifier).actualizarRepuesto(id: widget.partId!, nombre: _nombreCtrl.text.trim(), codigo: _codigoCtrl.text.trim(), precio: precio, existencias: exist);
      }
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.partId == null ? 'Nuevo repuesto' : 'Editar repuesto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: _nombreCtrl, decoration: const InputDecoration(labelText: 'Nombre'), validator: (v) => (v==null||v.trim().isEmpty)?'Requerido':null),
              const SizedBox(height: 12),
              TextFormField(controller: _codigoCtrl, decoration: const InputDecoration(labelText: 'Código (único)'), validator: (v) => (v==null||v.trim().isEmpty)?'Requerido':null),
              const SizedBox(height: 12),
              TextFormField(controller: _precioCtrl, decoration: const InputDecoration(labelText: 'Precio'), keyboardType: TextInputType.number, validator: (v){
                final p = double.tryParse(v ?? '');
                if (p == null || p <= 0) return 'Precio > 0';
                return null;
              }),
              const SizedBox(height: 12),
              TextFormField(controller: _existCtrl, decoration: const InputDecoration(labelText: 'Existencias'), keyboardType: TextInputType.number, validator: (v){
                final n = int.tryParse(v ?? '');
                if (n == null || n < 0) return 'Existencias >= 0';
                return null;
              }),
              const SizedBox(height: 20),
              FilledButton(onPressed: _saving ? null : _save, child: _saving ? const CircularProgressIndicator() : const Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }
}
