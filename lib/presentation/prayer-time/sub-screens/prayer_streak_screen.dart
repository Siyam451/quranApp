import 'package:flutter/material.dart';

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

        child: Column(

          children: [

            Container(

              width:
              double.infinity,

              padding:
              const EdgeInsets.all(20),

              decoration:
              BoxDecoration(

                borderRadius:
                BorderRadius.circular(
                    20),

                gradient:
                const LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.deepPurple,
                  ],
                ),
              ),

              child: Column(

                children: [

                  Text(
                    "$completed / 5",
                    style:
                    const TextStyle(
                      color:
                      Colors.white,
                      fontSize: 40,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const Text(
                    "Today's Progress",
                    style: TextStyle(
                      color:
                      Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(

              child: ListView(

                children:
                prayers.keys.map((prayer){

                  return CheckboxListTile(

                    value:
                    prayers[prayer],

                    title:
                    Text(prayer),

                    activeColor:
                    Colors.purple,

                    onChanged:
                        (value){

                      setState(() {

                        prayers[
                        prayer] =
                        value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}