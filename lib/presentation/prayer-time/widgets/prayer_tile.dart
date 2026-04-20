import 'package:flutter/material.dart';

class PrayerTile extends StatelessWidget {
  final String name;
  final String time;
  final IconData icon;
  final String nextPrayer;

  const PrayerTile(this.name, this.time, this.icon, this.nextPrayer, {super.key});

  @override
  Widget build(BuildContext context) {
    final isNext = name == nextPrayer;

    return Card(
      color: isNext ? Colors.purple.shade50 : Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Icon(icon, color: Colors.purple),
        ),
        title: Text(name),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time),
            if (isNext)
              const Text("Next", style: TextStyle(color: Colors.purple)),
          ],
        ),
      ),
    );
  }
}