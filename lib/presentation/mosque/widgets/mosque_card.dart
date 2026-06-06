import 'package:flutter/material.dart';

class MosqueCard extends StatelessWidget {

  final String name;
  final VoidCallback onTap;

  const MosqueCard({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 0,

      child: ListTile(

        onTap: onTap,

        leading: const CircleAvatar(
          backgroundColor: Colors.purple,
          child: Icon(
            Icons.mosque,
            color: Colors.white,
          ),
        ),

        title: Text(name),

        subtitle: const Text(
          "Nearby Mosque",
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}