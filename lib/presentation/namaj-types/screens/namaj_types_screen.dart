import 'package:flutter/material.dart';
import 'package:quranapp/presentation/namaj-types/widgets/namaj_tile.dart';

import '../../../data/models/namaj_model.dart';
import 'details_screen.dart';


class TypesOfNamazScreen extends StatefulWidget {
  const TypesOfNamazScreen({super.key});

  @override
  State<TypesOfNamazScreen> createState() => _TypesOfNamazScreenState();
}

class _TypesOfNamazScreenState extends State<TypesOfNamazScreen> {

  final List<NamazModel> namazList = [

    NamazModel(
      name: "Ishraq",
      steps: [
        "Pray about 15-20 minutes after sunrise",
        "Performed in 2 or 4 rakats",
        "Remain seated in dhikr after Fajr until prayer time",
      ],
      benefits: [
        "Reward of a complete Hajj and Umrah",
        "Sins are forgiven",
        "Protection from hellfire",
      ],
    ),
    NamazModel(
      name: "Duha (Chasht)",
      steps: [
        "Pray after the sun has risen high (mid-morning)",
        "Minimum 2 rakats, can pray up to 12",
        "Best performed when the heat of the sun is felt",
      ],
      benefits: [
        "Charity on behalf of every joint in your body",
        "Sufficient for all daily needs",
        "A palace in Jannah for praying 12 rakats",
      ],
    ),
    NamazModel(
      name: "Salatul Hajat",
      steps: [
        "Perform Wudu thoroughly",
        "Pray 2 rakats with full concentration",
        "After Salam, praise Allah and send Salawat on the Prophet",
        "Make specific dua for your need or problem",
      ],
      benefits: [
        "Seeking divine intervention for specific needs",
        "Relief from distress or hardship",
      ],
    ),
    NamazModel(
      name: "Salatul Tawbah",
      steps: [
        "Perform fresh Wudu",
        "Pray 2 rakats of Nafl",
        "Beg for Allah’s forgiveness with true remorse",
        "Resolve never to return to the sin",
      ],
      benefits: [
        "Wipes away the sin committed",
        "Direct path to repentance and mercy",
      ],
    ),
    NamazModel(
      name: "Salatul Kusuf",
      steps: [
        "Performed during a solar or lunar eclipse",
        "Two rakats with exceptionally long standing and bowing",
        "Includes two bowings (Ruku) in each rakat",
        "Prayed in congregation (preferably)",
      ],
      benefits: [
        "Recognition of Allah’s power over the universe",
        "Sunnah during celestial events",
      ],
    ),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Types of Namaz",style: TextStyle(color: Colors.white),),
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
                        name: namaz.name,
                        subtitle: "Tap to see details", // or create field
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NamazDetailsScreen(
                                namaz: namaz,
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