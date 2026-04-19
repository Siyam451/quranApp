import 'package:flutter/material.dart';
import 'package:quranapp/data/models/surah_with_ayat_model.dart';

class SurahTile extends StatelessWidget {
  final SurahWithAyahModel surah;
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
            "${surah.revelationType} • ${surah.ayahs.length} Ayahs"
        ),
        trailing: Text(
          surah.name,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}