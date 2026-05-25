import 'package:flutter/material.dart';

class MosqueCard
    extends StatelessWidget {

  final String name;

  const MosqueCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 0,

      child: ListTile(

        leading:
        const CircleAvatar(
          backgroundColor:
          Colors.purple,

          child:
          Icon(
            Icons.mosque,
            color:
            Colors.white,
          ),
        ),

        title:
        Text(name),

        subtitle:
        const Text(
          "Nearby Mosque",
        ),

        trailing:
        const Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}