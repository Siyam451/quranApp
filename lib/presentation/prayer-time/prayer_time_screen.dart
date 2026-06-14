import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quranapp/presentation/prayer-time/widgets/prayer_tile.dart';
import 'package:quranapp/presentation/prayer-time/widgets/quick_action_grid.dart';

import '../../data/services/ajan_services.dart';
import '../../providers/prayer_provider.dart';
import 'widgets/hadith_card.dart';
import 'widgets/next_prayer_card.dart';
import 'widgets/prayer_header_card.dart';


class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() =>
      _PrayerTimeScreenState();
}

class _PrayerTimeScreenState
    extends State<PrayerTimeScreen> {

  String nextPrayer = "";

  Duration remaining =
      Duration.zero;

  Timer? _timer;

  bool azanPlayed = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void calculateNextPrayer(prayer) {

    final now =
    DateTime.now();

    final times = {

      "Fajr":
      prayer.timings.fajr,

      "Dhuhr":
      prayer.timings.dhuhr,

      "Asr":
      prayer.timings.asr,

      "Maghrib":
      prayer.timings.maghrib,

      "Isha":
      prayer.timings.isha,
    };

    for (var entry in times.entries) {

      final parts =
      entry.value.split(":");

      final prayerTime =
      DateTime(

        now.year,
        now.month,
        now.day,

        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      if (prayerTime.isAfter(now)) {

        nextPrayer =
            entry.key;

        startCountdown(
          prayerTime,
        );

        break;
      }
    }
  }

  void startCountdown(
      DateTime nextTime) {

    _timer?.cancel();

    azanPlayed = false;

    _timer = Timer.periodic(

      const Duration(
          seconds: 1),

          (_) async {

        final now =
        DateTime.now();

        final diff =
        nextTime.difference(now);

        if (diff.inSeconds <= 0 &&
            !azanPlayed) {

          azanPlayed = true;

          await AzanService
              .playAzan();
        }

        if (mounted) {

          setState(() {

            remaining =
                diff;
          });
        }
      },
    );
  }

  String format(
      Duration d) {

    return
      "${d.inHours.toString().padLeft(2, '0')}:"
          "${(d.inMinutes % 60).toString().padLeft(2, '0')}:"
          "${(d.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor:
        Colors.purple,

        title: const Text(
          "Prayer Time",
          style: TextStyle(
            color:
            Colors.white,
          ),
        ),
      ),

      body:
      Consumer<PrayerProvider>(

        builder:
            (
            context,
            provider,
            child) {

          if (provider.isLoading) {

            return const Center(
              child:
              CircularProgressIndicator(),
            );
          }

          if (provider.error != null) {

            return Center(
              child:
              Text(
                provider.error!,
              ),
            );
          }

          final prayer =
              provider.prayerTime;

          if (prayer == null) {

            return const Center(
              child:
              Text(
                "No Data",
              ),
            );
          }

          if (nextPrayer.isEmpty) {

            WidgetsBinding
                .instance
                .addPostFrameCallback(
                  (_) {

                calculateNextPrayer(
                  prayer,
                );
              },
            );
          }

          return SingleChildScrollView(

            padding:
            const EdgeInsets.all(
                16),

            child: Column(

              children: [

                PrayerHeaderCard(

                  city:
                  "Chattogram, Bangladesh",

                  nextPrayer:
                  nextPrayer,

                  countdown:
                  format(
                    remaining,
                  ),
                ),

                const SizedBox(
                    height: 20),

                 QuickActionsGrid(
                  onQibla: () {},
                  onQuran: () {},
                  onDua: () {},
                  onNamaz: () {},
                ),

                const SizedBox(
                    height: 20),

                NextPrayerCard(

                  prayer:
                  nextPrayer,

                  countdown:
                  format(
                    remaining,
                  ),
                ),

                const SizedBox(
                    height: 20),

                const HadithCard(),

                const SizedBox(
                    height: 20),

                PrayerTimeTile(

                  prayer:
                  "Fajr",

                  time:
                  prayer.timings.fajr,

                  isNext:
                  nextPrayer ==
                      "Fajr",
                ),

                PrayerTimeTile(

                  prayer:
                  "Dhuhr",

                  time:
                  prayer.timings.dhuhr,

                  isNext:
                  nextPrayer ==
                      "Dhuhr",
                ),

                PrayerTimeTile(

                  prayer:
                  "Asr",

                  time:
                  prayer.timings.asr,

                  isNext:
                  nextPrayer ==
                      "Asr",
                ),

                PrayerTimeTile(

                  prayer:
                  "Maghrib",

                  time:
                  prayer.timings.maghrib,

                  isNext:
                  nextPrayer ==
                      "Maghrib",
                ),

                PrayerTimeTile(

                  prayer:
                  "Isha",

                  time:
                  prayer.timings.isha,

                  isNext:
                  nextPrayer ==
                      "Isha",
                ),

                const SizedBox(
                    height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}