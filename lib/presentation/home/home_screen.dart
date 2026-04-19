import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/surah_provider.dart';
import 'widgets/surah_tile.dart';
import '../surah-details/surah-details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<SurahProvider>(context, listen: false)
          .fetchsurah();
    });
  }

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
              child: const Text(
                "The best of you are those who study the Quran and teach it.",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 API DATA
            Expanded(
              child: Consumer<SurahProvider>(
                builder: (context, provider, child) {

                  if (provider.surahInprogress) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  if (provider.errormessage != null) {
                    return Center(
                        child: Text(provider.errormessage!));
                  }

                  return ListView.builder(
                    itemCount: provider.surah.length,
                    itemBuilder: (context, index) {
                      final surah = provider.surah[index];

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