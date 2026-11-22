import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../views/orders_details_screen.dart';
import '../database/app_database.dart';
import '../providers/historial_providers.dart';
import '../providers/tecnicos_provider.dart';
import 'status_badge.dart';

class OrderHistoryTile extends ConsumerWidget {
  final Ordene orden;
  final String? equipoLabel;
  const OrderHistoryTile({super.key, required this.orden, this.equipoLabel});

  String _fecha(DateTime f) => '${f.day}/${f.month}/${f.year}';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tecnicosAsync = ref.watch(tecnicosProvider);
    final totalAsync = ref.watch(totalOrdenProvider(orden.id));
    final tecnico = orden.idTecnico != null
        ? tecnicosAsync.value?.where((t) => t.id == orden.idTecnico).firstOrNull
        : null;
    final total = totalAsync.value ?? 0;

    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => OrdersDetailsScreen(orderId: orden.id)),
          );
        },
        title: Text(
          'Orden #${orden.id}${equipoLabel != null ? ' • $equipoLabel' : ''}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${_fecha(orden.fechaRecepcion)} • Técnico: ${tecnico?.nombre ?? 'Sin asignar'}\n'
          'Falla: ${orden.fallaReportada} • Total: \$${total.toStringAsFixed(2)}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        isThreeLine: true,
        trailing: StatusBadge(status: orden.estado),
      ),
    );
  }
}
