import 'package:flutter/material.dart';

class QuickActionsGrid extends StatelessWidget {

  final VoidCallback onTasbeeh;
  final VoidCallback onDhikr;
  final VoidCallback onHijri;
  final VoidCallback onStreak;

  const QuickActionsGrid({
    super.key,
    required this.onTasbeeh,
    required this.onDhikr,
    required this.onHijri,
    required this.onStreak,
  });

  @override
  Widget build(BuildContext context) {

    return GridView.count(

      shrinkWrap: true,

      physics:
      const NeverScrollableScrollPhysics(),

      crossAxisCount: 2,

      childAspectRatio: 1.4,

      children: [

        _item(
          Icons.fingerprint,
          "Tasbeeh",
          onTasbeeh,
        ),

        _item(
          Icons.auto_awesome,
          "Dhikr",
          onDhikr,
        ),

        _item(
          Icons.calendar_month,
          "Hijri",
          onHijri,
        ),

        _item(
          Icons.local_fire_department,
          "Streak",
          onStreak,
        ),
      ],
    );
  }

  Widget _item(
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {

    return InkWell(

      borderRadius:
      BorderRadius.circular(18),

      onTap: onTap,

      child: Card(

        elevation: 4,

        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(18),
        ),

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            CircleAvatar(
              radius: 28,
              backgroundColor:
              Colors.purple.shade100,

              child: Icon(
                icon,
                color: Colors.purple,
              ),
            ),

            const SizedBox(height: 8),

            Text(title),
          ],
        ),
      ),
    );
  }
}