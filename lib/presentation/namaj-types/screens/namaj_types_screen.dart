import 'package:flutter/material.dart';
import 'package:quranapp/presentation/namaj-types/widgets/namaj_tile.dart';

import 'details_screen.dart';


class TypesOfNamazScreen extends StatefulWidget {
  const TypesOfNamazScreen({super.key});

  @override
  State<TypesOfNamazScreen> createState() => _TypesOfNamazScreenState();
}

class _TypesOfNamazScreenState extends State<TypesOfNamazScreen> {

  final List<Map<String, dynamic>> namazList = [
    {
      "name": "Tahajjud",
      "subtitle": "Night Prayer • Nafl",
      "benefit": "Brings you closer to Allah"
    },
    {
      "name": "Salatul Tasbeeh",
      "subtitle": "Special Prayer",
      "benefit": "Forgiveness of sins"
    },
    {
      "name": "Istikhara",
      "subtitle": "Guidance Prayer",
      "benefit": "Helps in decision making"
    },
    {
      "name": "Duha Prayer",
      "subtitle": "Forenoon Prayer",
      "benefit": "Brings barakah in rizq"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Types of Namaz"),
        backgroundColor: Colors.purple,
      ),

      body: Stack(
        children: [


          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF3E5F5), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple],
                    ),
                  ),
                  child: const Text(
                    "Salah is the key to success. Perform extra prayers to strengthen your connection with Allah.",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    itemCount: namazList.length,
                    itemBuilder: (context, index) {
                      final namaz = namazList[index];

                      return NamazTile(
                        name: namaz['name'],
                        subtitle: namaz['subtitle'],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NamazDetailsScreen(
                                name: namaz['name'],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}