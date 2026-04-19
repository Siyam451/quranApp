import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quranapp/presentation/providers/quran_ayat_provider.dart';
import '../surah-details/surah-details_screen.dart';
import 'widgets/surah_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quran App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("Assalamualaikum",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),
            const Text("Kharisma Mecca",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.deepPurple],
                ),
              ),
              child: Stack(
                children: [

                  /// 🌙 Islamic Network Image
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Opacity(
                      opacity: 0.2,
                      child: Image.network(
                        "https://cdn-icons-png.flaticon.com/512/3176/3176293.png",
                        height: 100,
                      ),
                    ),
                  ),

                  /// 📝 Text
                  const Padding(
                    padding: EdgeInsets.only(right: 80),
                    child: Text(
                      "The best of you are those who study the Quran and teach it.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
                        child: CircularProgressIndicator());
                  }

                  if (provider.errormessage != null) {
                    return Center(
                        child: Text(provider.errormessage!));
                  }

                  return ListView.builder(
                    itemCount: provider.surahs.length,
                    itemBuilder: (context, index) {
                      final surah = provider.surahs[index];

                      return SurahTile(
                        surah: surah,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SurahDetailScreen(
                                surah: surah,
                              ),
                            ),
                          );
                        },
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