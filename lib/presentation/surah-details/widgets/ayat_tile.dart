import 'package:flutter/material.dart';

class AyahTile extends StatelessWidget {
  final int index;
  final String arabic;
  final String translation;

  const AyahTile({
    super.key,
    required this.index,
    required this.arabic,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 14,
                  child: Text("$index"),
                ),
                const Row(
                  children: [
                    Icon(Icons.share, size: 18),
                    SizedBox(width: 10),
                    Icon(Icons.play_arrow, size: 18),
                    SizedBox(width: 10),
                    Icon(Icons.bookmark_border, size: 18),
                  ],
                )
              ],
            ),

            const SizedBox(height: 10),

            Text(
              arabic,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            Text(
              translation,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}