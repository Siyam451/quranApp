import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/prayer_provider.dart';
import 'widgets/prayer_tile.dart';
import 'widgets/next_prayer_card.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  String nextPrayer = "";
  Duration remaining = Duration.zero;

  Timer? _timer;

  final AudioPlayer _player = AudioPlayer();

  bool _azanPlayed = false;

  @override
  void dispose() {
    _timer?.cancel();
    _player.dispose();
    super.dispose();
  }

  /// Play Azan
  Future<void> playAzan() async {
    try {
      await _player.play(
        AssetSource('audio/azan.mp3'),
      );
    } catch (e) {
      debugPrint("Azan error: $e");
    }
  }

  /// Calculate next prayer
  void calculateNextPrayer(prayer) {
    final now = DateTime.now();

    final times = {
      "Fajr": prayer.timings.fajr,
      "Dhuhr": prayer.timings.dhuhr,
      "Asr": prayer.timings.asr,
      "Maghrib": prayer.timings.maghrib,
      "Isha": prayer.timings.isha,
    };

    for (var entry in times.entries) {
      final parts = entry.value.split(":");

      final prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      if (prayerTime.isAfter(now)) {
        nextPrayer = entry.key;

        startCountdown(prayerTime);

        break;
      }
    }
  }

  /// Countdown timer
  void startCountdown(DateTime nextTime) {
    _timer?.cancel();

    _azanPlayed = false;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (_) async {
        final now = DateTime.now();

        final diff = nextTime.difference(now);

        /// When prayer time arrives
        if (diff.inSeconds <= 0 && !_azanPlayed) {
          _azanPlayed = true;

          await playAzan();

          final provider = Provider.of<PrayerProvider>(
            context,
            listen: false,
          );

          calculateNextPrayer(
            provider.prayerTime,
          );

          return;
        }

        if (mounted) {
          setState(() {
            remaining = diff;
          });
        }
      },
    );
  }

  /// Format countdown
  String format(Duration d) {
    return "${d.inHours.toString().padLeft(2, '0')}:"
        "${(d.inMinutes % 60).toString().padLeft(2, '0')}:"
        "${(d.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Prayer Time"),
      ),

      body: Consumer<PrayerProvider>(
        builder: (context, provider, child) {

          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.error != null) {
            return Center(
              child: Text(provider.error!),
            );
          }

          final prayer = provider.prayerTime;

          if (prayer == null) {
            return const Center(
              child: Text("No data"),
            );
          }

          /// Run only once
          if (nextPrayer.isEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              calculateNextPrayer(prayer);
            });
          }

          return Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [

                /// Date Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),

                    gradient: const LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.deepPurple,
                      ],
                    ),
                  ),

                  child: Column(
                    children: [

                      Text(
                        prayer.date.readableDate,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        prayer.date.hijriDate,

                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                /// Next Prayer Card
                NextPrayerCard(
                  nextPrayer: nextPrayer,
                  countdown: format(remaining),
                ),

                const SizedBox(height: 15),

                /// Prayer List
                Expanded(
                  child: ListView(
                    children: [

                      PrayerTile(
                        "Fajr",
                        prayer.timings.fajr,
                        Icons.nightlight,
                        nextPrayer,
                      ),

                      PrayerTile(
                        "Dhuhr",
                        prayer.timings.dhuhr,
                        Icons.sunny,
                        nextPrayer,
                      ),

                      PrayerTile(
                        "Asr",
                        prayer.timings.asr,
                        Icons.cloud,
                        nextPrayer,
                      ),

                      PrayerTile(
                        "Maghrib",
                        prayer.timings.maghrib,
                        Icons.nights_stay,
                        nextPrayer,
                      ),

                      PrayerTile(
                        "Isha",
                        prayer.timings.isha,
                        Icons.dark_mode,
                        nextPrayer,
                      ),
                    ],
                  ),
                ),

                /// Footer Quote
                Padding(
                  padding: const EdgeInsets.all(12.0),

                  child: Text(
                    "Note : The Prophet (ﷺ) said: "
                        "'The first thing a person will be asked about on Judgment Day is his prayer'",

                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}