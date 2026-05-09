import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
class DegreeCard extends StatelessWidget {
  const DegreeCard({
    super.key,
    required this.qiblahDirection,
  });

  final QiblahDirection qiblahDirection;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [

          const Text(
            "Current Qibla Direction",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 8),

          /// ✅ FIXED DEGREE
          Text(
            "${((qiblahDirection.qiblah + 360) % 360).toStringAsFixed(2)}°",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),

          const SizedBox(height: 10),

          /// ✅ QIBLA STATUS
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: (((qiblahDirection.qiblah + 360) % 360) <= 5)
                  ? Colors.green.withOpacity(0.15)
                  : Colors.orange.withOpacity(0.15),
            ),
            child: Text(

              (((qiblahDirection.qiblah + 360) % 360) <= 5)
                  ? "Facing Qibla ✅"
                  : "Adjust Direction 🧭",

              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (((qiblahDirection.qiblah + 360) % 360) <= 5)
                    ? Colors.green
                    : Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}