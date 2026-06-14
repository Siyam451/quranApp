import 'package:flutter/material.dart';

class NextPrayerCard extends StatelessWidget {

  final String prayer;
  final String countdown;

  const NextPrayerCard({
    super.key,
    required this.prayer,
    required this.countdown,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(18),
      ),

      child: Padding(

        padding:
        const EdgeInsets.all(16),

        child: Column(

          children: [

            Text(
              "🕌 Next Prayer: $prayer",
              style: const TextStyle(
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              countdown,
              style: const TextStyle(
                fontSize: 28,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: .6,
            ),
          ],
        ),
      ),
    );
  }
}