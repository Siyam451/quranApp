import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  final int streak;

  const AchievementCard({
    super.key,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Row(
              children: [

                Icon(
                  Icons.emoji_events,
                  color: Colors.amber,
                ),

                SizedBox(width: 8),

                Text(
                  "Achievements",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            _badge(
              title: "7 Day Streak",
              icon: Icons.looks_one,
              unlocked: streak >= 7,
            ),

            const SizedBox(height: 12),

            _badge(
              title: "30 Day Streak",
              icon: Icons.looks_two,
              unlocked: streak >= 30,
            ),

            const SizedBox(height: 12),

            _badge(
              title: "100 Day Streak",
              icon: Icons.looks_3,
              unlocked: streak >= 100,
            ),

            const SizedBox(height: 12),

            _badge(
              title: "365 Day Master",
              icon: Icons.workspace_premium,
              unlocked: streak >= 365,
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge({
    required String title,
    required IconData icon,
    required bool unlocked,
  }) {

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(

        color: unlocked
            ? Colors.green.shade50
            : Colors.grey.shade100,

        borderRadius: BorderRadius.circular(14),

        border: Border.all(
          color: unlocked
              ? Colors.green
              : Colors.grey.shade300,
        ),
      ),

      child: Row(

        children: [

          CircleAvatar(

            radius: 22,

            backgroundColor:
            unlocked
                ? Colors.green
                : Colors.grey,

            child: Icon(
              unlocked
                  ? icon
                  : Icons.lock,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                Text(
                  unlocked
                      ? "Unlocked 🎉"
                      : "Locked",
                  style: TextStyle(
                    color: unlocked
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          if (unlocked)
            const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
        ],
      ),
    );
  }
}