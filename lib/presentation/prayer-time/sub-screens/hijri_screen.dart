import 'package:flutter/material.dart';

class HijriScreen extends StatelessWidget {
  const HijriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hijri Calendar"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Container(
              width: double.infinity,
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

              child: const Column(
                children: [

                  Text(
                    "18 Muharram 1448 AH",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Islamic Date",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _eventCard("🌙 Ramadan"),
            _eventCard("🕌 Eid-ul-Fitr"),
            _eventCard("🐐 Eid-ul-Adha"),
            _eventCard("⭐ Ashura"),
          ],
        ),
      ),
    );
  }

  static Widget _eventCard(String title) {
    return Card(
      child: ListTile(
        title: Text(title),
      ),
    );
  }
}