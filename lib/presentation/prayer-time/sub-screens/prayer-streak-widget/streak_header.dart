import 'package:flutter/material.dart';

class StreakHeader extends StatelessWidget {
  final int streak;
  final int completed;
  final double progress;

  const StreakHeader({
    super.key,
    required this.streak,
    required this.completed,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xff8E24AA),
            Color(0xff6A1B9A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [

          Row(
            children: const [

              Icon(
                Icons.local_fire_department,
                color: Colors.orange,
                size: 30,
              ),

              SizedBox(width: 10),

              Text(
                "Prayer Streak",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Stack(
            alignment: Alignment.center,
            children: [

              SizedBox(
                width: 140,
                height: 140,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 10,
                  backgroundColor: Colors.white24,
                  valueColor:
                  const AlwaysStoppedAnimation(
                    Colors.orange,
                  ),
                ),
              ),

              Column(
                children: [

                  Text(
                    "$completed/5",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text(
                    "Completed",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              )
            ],
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [

              Column(
                children: [

                  const Text(
                    "Current Streak",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [

                      const Icon(
                        Icons.local_fire_department,
                        color: Colors.orange,
                      ),

                      const SizedBox(width: 5),

                      Text(
                        "$streak Days",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              Column(
                children: [

                  const Text(
                    "Today's Progress",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Container(
                    width: 90,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                    child: FractionallySizedBox(
                      alignment:
                      Alignment.centerLeft,
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius:
                          BorderRadius.circular(
                              20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}