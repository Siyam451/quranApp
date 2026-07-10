import 'package:flutter/material.dart';

class WeeklyProgress extends StatelessWidget {

  final List<bool> progress;

  const WeeklyProgress({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {

    final days = [
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
      "Sun",
    ];

    return Card(

      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            const Row(

              children: [

                Icon(
                  Icons.calendar_month,
                  color: Colors.purple,
                ),

                SizedBox(width: 8),

                Text(
                  "Weekly Progress",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(

              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children:

              List.generate(days.length, (index) {

                return Column(

                  children: [

                    Text(
                      days[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    AnimatedContainer(

                      duration:
                      const Duration(milliseconds: 300),

                      width: 42,
                      height: 42,

                      decoration: BoxDecoration(

                        shape: BoxShape.circle,

                        color: progress[index]
                            ? Colors.green
                            : Colors.grey.shade300,
                      ),

                      child: Icon(

                        progress[index]
                            ? Icons.check
                            : Icons.close,

                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}