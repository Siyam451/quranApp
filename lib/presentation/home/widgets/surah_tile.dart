import 'package:flutter/material.dart';
import '../../../data/models/surah_model.dart';

class SurahTile extends StatelessWidget {
  final SurahModel surah;
  final VoidCallback onTap;

  const SurahTile({
    super.key,
    required this.surah,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Text("${surah.number}"),
        ),
        title: Text(
          surah.englishName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "${surah.revelationType} • ${surah.numberOfAyahs} Ayahs",
        ),
        trailing: Text(
          surah.name, // Arabic
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}