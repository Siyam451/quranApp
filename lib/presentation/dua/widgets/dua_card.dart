import 'package:flutter/material.dart';
import '../../../data/models/dua_model.dart';
import '../dua_details_screen.dart';


class DuaCard extends StatelessWidget {
  final DuaModel dua;

  const DuaCard({required this.dua});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),

        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Text("${dua.id}"),
        ),

        title: Text(
          dua.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        trailing: const Icon(Icons.arrow_forward_ios, size: 16),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DuaDetailsScreen(dua: dua),
            ),
          );
        },
      ),
    );
  }
}