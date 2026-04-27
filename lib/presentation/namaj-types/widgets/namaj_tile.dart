import 'package:flutter/material.dart';

class NamazTile extends StatelessWidget {
  final String name;
  final String subtitle;
  final VoidCallback onTap;

  const NamazTile({
    super.key,
    required this.name,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      child: ListTile(
        onTap: onTap,

        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: const Icon(Icons.mosque, color: Colors.purple),
        ),

        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Text(subtitle),

        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}