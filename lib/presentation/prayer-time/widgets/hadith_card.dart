import 'package:flutter/material.dart';

class HadithCard extends StatelessWidget {

  const HadithCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding:
        const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: const [

            Text(
              "📖 Daily Reminder",
              style: TextStyle(
                fontWeight:
                FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "The first thing a servant will be asked about on the Day of Judgment is his prayer.",
            ),
          ],
        ),
      ),
    );
  }
}