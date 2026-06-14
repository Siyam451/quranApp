import 'package:flutter/material.dart';

class PrayerHeaderCard extends StatelessWidget {

  final String city;
  final String nextPrayer;
  final String countdown;

  const PrayerHeaderCard({
    super.key,
    required this.city,
    required this.nextPrayer,
    required this.countdown,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        borderRadius:
        BorderRadius.circular(24),

        gradient: const LinearGradient(
          colors: [
            Colors.purple,
            Colors.deepPurple,
          ],
        ),
      ),

      child: Column(

        children: [

          const Text(
            "Assalamualaikum 👋",
            style: TextStyle(
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            city,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            countdown,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            "Time Remaining Until $nextPrayer",
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}