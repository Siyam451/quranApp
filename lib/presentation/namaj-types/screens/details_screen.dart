import 'package:flutter/material.dart';

class NamazDetailsScreen extends StatelessWidget {
  final String name;

  const NamazDetailsScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.purple,
      ),

      body: Padding(
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
              child: Text(
                "$name Prayer",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [

                  _sectionTitle("How to Perform"),

                  _bullet("Make intention (Niyyah)"),
                  _bullet("Pray in 2 rakats"),
                  _bullet("Recite Surah after Fatiha"),
                  _bullet("Complete with Salam"),

                  const SizedBox(height: 20),

                  /// 🌟 BENEFITS
                  _sectionTitle("Benefits"),

                  _bullet("Brings peace to heart"),
                  _bullet("Increases closeness to Allah"),
                  _bullet("Removes stress and anxiety"),
                  _bullet("Source of forgiveness"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}