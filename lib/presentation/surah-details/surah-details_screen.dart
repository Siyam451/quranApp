import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quranapp/data/models/surah_with_ayat_model.dart';
import '../../providers/audio_provider.dart';
import '../../providers/quran_ayat_provider.dart';

class SurahDetailScreen extends StatefulWidget {
  final SurahWithAyahModel surah;

  const SurahDetailScreen({
    super.key,
    required this.surah,
  });

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.surah.englishName),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.surah.name,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${widget.surah.revelationType} • ${widget.surah.ayahs.length} verses",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),

                  Consumer<AudioProvider>(
                    builder: (context, audio, _) {
                      final url =
                          "https://server8.mp3quran.net/afs/${widget.surah.number.toString().padLeft(3, '0')}.mp3";

                      return IconButton(
                        icon: Icon(
                          audio.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          audio.playAudio(url);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Consumer<QuranAyatProvider>(
                builder: (context, provider, child) {

                  if (provider.QuranAyatInprogress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (provider.errormessage != null) {
                    return Center(
                      child: Text(provider.errormessage!),
                    );
                  }

                  final ayahs = provider.getAyahsBySurah(
                    widget.surah.number,
                  );

                  if (ayahs.isEmpty) {
                    return const Center(
                      child: Text("No Ayahs found"),
                    );
                  }

                  return ListView.builder(
                    itemCount: ayahs.length,
                    itemBuilder: (context, index) {
                      final ayah = ayahs[index];

                      return Card(
                        color: const Color(0xFF9C27B0),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 14,
                                    child: Text(
                                      "${ayah.numberInSurah}",
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              Text(
                                ayah.text,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 20,
                                  height: 1.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}