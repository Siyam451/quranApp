import 'package:flutter/material.dart';

class QuickActionsGrid extends StatelessWidget {

  final VoidCallback onTasbeeh;

  const QuickActionsGrid({
    super.key,
    required this.onTasbeeh,
  });

  @override
  Widget build(BuildContext context) {

    return GridView.count(

      shrinkWrap: true,

      physics:
      const NeverScrollableScrollPhysics(),

      crossAxisCount: 2,

      childAspectRatio: 1.4,

      children: [

        _item(
          Icons.explore,
          "Qibla",
              () {},
        ),

        _item(
          Icons.menu_book,
          "Quran",
              () {},
        ),

        _item(
          Icons.fingerprint,
          "Tasbeeh",
          onTasbeeh,
        ),

        _item(
          Icons.mosque,
          "Namaz",
              () {},
        ),
      ],
    );
  }

  Widget _item(
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {

    return InkWell(

      borderRadius:
      BorderRadius.circular(18),

      onTap: onTap,

      child: Card(

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
      ),
    );
  }
}