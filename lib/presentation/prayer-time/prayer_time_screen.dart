import 'dart:async';
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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  ///  Get next prayer
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

  void startCountdown(DateTime nextTime) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      setState(() {
        remaining = nextTime.difference(now);
      });
    });
  }

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
          title: const Text("Prayer Time")),
      body: Consumer<PrayerProvider>(
        builder: (context, provider, child) {

          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          final prayer = provider.prayerTime;

          if (prayer == null) {
            return const Center(child: Text("No data"));
          }


          WidgetsBinding.instance.addPostFrameCallback((_) {
            calculateNextPrayer(prayer);
          });

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(prayer.date.readableDate,
                          style: const TextStyle(color: Colors.white)),
                      const SizedBox(height: 5),
                      Text(prayer.date.hijriDate,
                          style: const TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),

                const SizedBox(height: 15),


                NextPrayerCard(
                  nextPrayer: nextPrayer,
                  countdown: format(remaining),
                ),

                const SizedBox(height: 15),


                Expanded(
                  child: ListView(
                    children: [
                      PrayerTile("Fajr", prayer.timings.fajr, Icons.nightlight, nextPrayer),
                      PrayerTile("Dhuhr", prayer.timings.dhuhr, Icons.sunny, nextPrayer),
                      PrayerTile("Asr", prayer.timings.asr, Icons.cloud, nextPrayer),
                      PrayerTile("Maghrib", prayer.timings.maghrib, Icons.nights_stay, nextPrayer),
                      PrayerTile("Isha", prayer.timings.isha, Icons.dark_mode, nextPrayer),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(" Note : The Prophet (ﷺ) said: "
                      "'The first thing a person will be asked about on Judgment Day is his prayer' ",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}