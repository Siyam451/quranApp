import 'package:flutter/material.dart';

class PrayerTimeTile extends StatelessWidget {

  final String prayer;
  final String time;
  final bool isNext;

  const PrayerTimeTile({
    super.key,
    required this.prayer,
    required this.time,
    required this.isNext,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      color:
      isNext
          ? Colors.purple.shade100
          : null,

      child: ListTile(

        leading: CircleAvatar(
          backgroundColor:
          isNext
              ? Colors.green
              : Colors.grey,

          child: const Icon(
            Icons.access_time,
            color: Colors.white,
          ),
        ),

        title: Text(prayer),

        trailing: Text(
          time,
          style: const TextStyle(
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),
    );
  }
}