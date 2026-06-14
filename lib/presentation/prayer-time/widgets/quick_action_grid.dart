import 'package:flutter/material.dart';

class QuickActionsGrid extends StatelessWidget {
  final VoidCallback onQibla;
  final VoidCallback onQuran;
  final VoidCallback onDua;
  final VoidCallback onNamaz;

  const QuickActionsGrid({super.key, required this.onQibla, required this.onQuran, required this.onDua, required this.onNamaz});

  @override
  Widget build(BuildContext context) {

    return GridView.count(

      shrinkWrap: true,

      physics:
      const NeverScrollableScrollPhysics(),

      crossAxisCount: 2,

      childAspectRatio: 1.4,

      children: [

        _item(Icons.explore,"Qibla"),

        _item(Icons.menu_book,"Quran"),

        _item(Icons.favorite,"Dua"),

        _item(Icons.mosque,"Namaz"),
      ],
    );
  }

  Widget _item(
      IconData icon,
      String title,
      ) {

    return Card(

      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(18),
      ),

      child: Column(

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          CircleAvatar(
            radius: 28,
            backgroundColor:
            Colors.purple.shade100,

            child: Icon(
              icon,
              color: Colors.purple,
            ),
          ),

          const SizedBox(height: 8),

          Text(title),
        ],
      ),
    );
  }
}