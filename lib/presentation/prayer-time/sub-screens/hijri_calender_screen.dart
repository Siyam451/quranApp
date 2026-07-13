import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/hijri_calender_provider.dart';


class FullHijriCalendarScreen extends StatelessWidget {
  const FullHijriCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hijri Calendar"),
        backgroundColor: Colors.purple,
      ),

      body: Consumer<HijriCalendarProvider>(
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

          return Column(
            children: [

              /// Month Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(
                      onPressed: provider.previousMonth,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),

                    Text(
                      provider.currentHijriMonth,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      onPressed: provider.nextMonth,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(),

              /// Calendar List
              Expanded(
                child: ListView.builder(
                  itemCount: provider.days.length,
                  itemBuilder: (context, index) {

                    final day = provider.days[index];

                    final selected =
                        provider.selectedDay == day;

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      color: selected
                          ? Colors.purple.shade100
                          : null,

                      child: ListTile(

                        leading: CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Text(
                            day.hijriDay,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),

                        title: Text(
                          "${day.hijriDay} ${day.hijriMonth}",
                        ),

                        subtitle: Text(
                          "${day.weekday} • ${day.gregorianDate}",
                        ),

                        trailing: selected
                            ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                            : null,

                        onTap: () {
                          provider.selectDay(day);
                        },
                      ),
                    );
                  },
                ),
              ),

              /// Selected Day Details
              if (provider.selectedDay != null)

                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(20),

                  decoration: const BoxDecoration(

                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.deepPurple,
                      ],
                    ),
                  ),

                  child: Column(

                    children: [

                      const Text(
                        "Selected Date",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "${provider.selectedDay!.hijriDay} "
                            "${provider.selectedDay!.hijriMonth} "
                            "${provider.selectedDay!.hijriYear} AH",

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        provider.selectedDay!.gregorianDate,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}