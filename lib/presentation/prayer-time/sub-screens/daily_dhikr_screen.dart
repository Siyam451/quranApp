import 'package:flutter/material.dart';

class DailyDhikrScreen extends StatelessWidget {
  const DailyDhikrScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Daily Dhikr",
        ),
        backgroundColor: Colors.purple,
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Container(

              width: double.infinity,

              padding:
              const EdgeInsets.all(20),

              decoration: BoxDecoration(

                borderRadius:
                BorderRadius.circular(20),

                gradient:
                const LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.deepPurple,
                  ],
                ),
              ),

              child: const Column(

                children: [

                  Text(
                    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
                    textAlign:
                    TextAlign.center,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "SubhanAllahi Wa Bihamdihi",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Card(

              child: Padding(

                padding:
                EdgeInsets.all(16),

                child: Text(
                  "Whoever recites this 100 times a day, his sins are forgiven even if they are like the foam of the sea.",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}