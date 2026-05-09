import 'package:flutter/material.dart';
class QiblaDescription extends StatelessWidget {
  const QiblaDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [

          /// TITLE
          Row(
            children: [

              Icon(
                Icons.menu_book_outlined,
                color: Colors.purple,
              ),

              SizedBox(width: 8),

              Text(
                "How to Use",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),

          SizedBox(height: 14),

          /// STEP 1
          Text(
            "1. Hold your phone flat and parallel to the ground.",
            style: TextStyle(
              height: 1.6,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 8),

          /// STEP 2
          Text(
            "2. Rotate yourself slowly until the purple arrow points towards the QIBLA mark.",
            style: TextStyle(
              height: 1.6,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 8),

          /// STEP 3
          Text(
            "3. Once aligned, you are facing the direction of the Holy Kaaba 🕋.",
            style: TextStyle(
              height: 1.6,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 12),

          /// INFO
          Text(
            "Tip: Move your phone in ∞ shape if compass feels inaccurate.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
