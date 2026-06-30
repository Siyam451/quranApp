import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quranapp/presentation/prayer-time/sub-screens/prayer-streak-widget/achievement_card.dart';
import 'package:quranapp/presentation/prayer-time/sub-screens/prayer-streak-widget/prayer_card.dart';
import 'package:quranapp/presentation/prayer-time/sub-screens/prayer-streak-widget/streak_header.dart';

import '../../../providers/prayer_streak_provider.dart';

class PrayerStreakScreen extends StatefulWidget {
  const PrayerStreakScreen({super.key});

  @override
  State<PrayerStreakScreen> createState() =>
      _PrayerStreakScreenState();
}

class _PrayerStreakScreenState
    extends State<PrayerStreakScreen> {

  final Map<String, bool> prayers = {

    "Fajr": false,
    "Dhuhr": false,
    "Asr": false,
    "Maghrib": false,
    "Isha": false,
  };

  @override
  Widget build(BuildContext context) {

    int completed =
        prayers.values
            .where((e) => e)
            .length;

    return Scaffold(

      appBar: AppBar(
        title:
        const Text(
          "Prayer Streak",
        ),
        backgroundColor:
        Colors.purple,
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(20),

        child: Consumer<PrayerStreakProvider>(
          builder: (context, provider, child) {

            return ListView(

              children: [

                StreakHeader(
                  streak: provider.streak,
                  completed: provider.completed,
                  progress: provider.progress,
                ),

                const SizedBox(height: 20),

                ...provider.prayerNames.map((prayer) {

                  return PrayerCard(

                    prayer: prayer,

                    completed:
                    provider.prayers[prayer]!,

                    onChanged: (value) {

                      provider.togglePrayer(
                        prayer,
                        value,
                      );
                    },
                  );

                }).toList(),

                const SizedBox(height: 20),

                AchievementCard(
                  streak: provider.streak,
                ),

                const SizedBox(height: 20),

                // Weekly Progress (next widget)

                // Daily Motivation (next widget)

              ],
            );
          },
        ),
      ),
    );
  }
}