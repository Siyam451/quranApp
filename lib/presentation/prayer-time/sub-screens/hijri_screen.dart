import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/hijri_provider.dart';
import 'hijri_calender_screen.dart';

class HijriScreen extends StatelessWidget {
  const HijriScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Hijri Calendar",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: ListView(

        padding: const EdgeInsets.all(16),

        children: [

          Consumer<HijriProvider>(
            builder: (context, p, _) {

              if (p.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (p.error != null) {
                return Center(
                  child: Text(p.error!),
                );
              }

              final h = p.hijri!;

              return Column(
                children: [

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.purple,
                          Colors.deepPurple,
                        ],
                      ),
                    ),

                    child: Column(
                      children: [

                        const Icon(
                          Icons.calendar_month,
                          size: 50,
                          color: Colors.white,
                        ),

                        const SizedBox(height: 15),

                        Text(
                          h.hijriDate,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "${h.weekday}, ${h.gregorianDate}",
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton.icon(

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      icon: const Icon(
                        Icons.calendar_view_month,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "View Full Hijri Calendar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),

                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            const FullHijriCalendarScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 20),

          const SizedBox(height: 20),

          _sectionTitle("Islamic Events"),

          const SizedBox(height: 10),

          _eventCard(
            "🌙 Ramadan",
            "Starts in 245 days",
          ),

          _eventCard(
            "🕌 Eid-ul-Fitr",
            "Starts in 275 days",
          ),

          _eventCard(
            "🐐 Eid-ul-Adha",
            "Starts in 345 days",
          ),

          _eventCard(
            "⭐ Ashura",
            "10 Muharram",
          ),

          const SizedBox(height: 20),

          _sectionTitle("Islamic Months"),

          const SizedBox(height: 10),

          GridView.count(

            shrinkWrap: true,

            physics:
            const NeverScrollableScrollPhysics(),

            crossAxisCount: 2,

            childAspectRatio: 3,

            children: const [

              _MonthChip("Muharram"),

              _MonthChip("Safar"),

              _MonthChip("Rabi al-Awwal"),

              _MonthChip("Rabi al-Thani"),

              _MonthChip("Jumada al-Ula"),

              _MonthChip("Jumada al-Thani"),

              _MonthChip("Rajab"),

              _MonthChip("Sha'ban"),

              _MonthChip("Ramadan"),

              _MonthChip("Shawwal"),

              _MonthChip("Dhul Qa'dah"),

              _MonthChip("Dhul Hijjah"),
            ],
          ),

          const SizedBox(height: 20),

          _sectionTitle("Today's Reminder"),

          const SizedBox(height: 10),

          Card(

            elevation: 3,

            shape: RoundedRectangleBorder(

              borderRadius:
              BorderRadius.circular(16),
            ),

            child: const Padding(

              padding: EdgeInsets.all(20),

              child: Column(

                children: [

                  Icon(
                    Icons.menu_book,
                    color: Colors.purple,
                    size: 35,
                  ),

                  SizedBox(height: 15),

                  Text(

                    "\"Indeed, the number of months with Allah is twelve months...\"",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Surah At-Tawbah (9:36)",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title){

    return Text(

      title,

      style: const TextStyle(

        fontSize: 20,

        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _eventCard(
      String title,
      String subtitle){

    return Card(

      margin:
      const EdgeInsets.only(bottom: 10),

      child: ListTile(

        leading:
        const CircleAvatar(

          backgroundColor:
          Colors.purple,

          child: Icon(
            Icons.event,
            color: Colors.white,
          ),
        ),

        title: Text(title),

        subtitle: Text(subtitle),
      ),
    );
  }
}

class _MonthChip extends StatelessWidget {

  final String month;

  const _MonthChip(this.month);

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 2,

      child: Center(

        child: Text(

          month,

          textAlign: TextAlign.center,

          style: const TextStyle(

            fontWeight:
            FontWeight.w600,
          ),
        ),
      ),
    );
  }
}