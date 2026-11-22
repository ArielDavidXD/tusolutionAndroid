import 'package:flutter/material.dart';
import 'status_badge.dart';

class OrderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: StatusBadge(status: status),
      ),
    );
  }
}
