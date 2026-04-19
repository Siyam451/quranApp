import 'package:flutter/material.dart';
import '../../data/models/surah_model.dart';

class SurahDetailScreen extends StatefulWidget {
  final SurahModel surah;

  const SurahDetailScreen({super.key, required this.surah});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surah.englishName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// Header
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
                  Text(
                    widget.surah.name,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${widget.surah.revelationType} • ${widget.surah.numberOfAyahs} verses",
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Placeholder (next step: API ayahs)
            const Expanded(
              child: Center(
                child: Text("Load Ayahs from API next 🚀"),
              ),
            )
          ],
        ),
      ),
    );
  }
}