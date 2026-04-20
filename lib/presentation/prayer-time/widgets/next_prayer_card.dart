import 'package:flutter/material.dart';

class NextPrayerCard extends StatelessWidget {
  final String nextPrayer;
  final String countdown;

  const NextPrayerCard({
    super.key,
    required this.nextPrayer,
    required this.countdown,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.purple.shade50,
      ),
      child: Column(
        children: [
          Text(
            "Next Prayer: $nextPrayer",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            countdown,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}