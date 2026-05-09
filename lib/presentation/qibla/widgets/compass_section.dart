import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
class CompassSection extends StatelessWidget {
  const CompassSection({
    super.key,
    required this.size,
    required this.qiblahDirection,
  });

  final Size size;
  final QiblahDirection qiblahDirection;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [

        /// OUTER GLOW
        Container(
          width: size.width * 0.78,
          height: size.width * 0.78,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple.withOpacity(0.05),
          ),
        ),

        /// MAIN COMPASS
        Container(
          width: size.width * 0.65,
          height: size.width * 0.65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.15),
                blurRadius: 25,
                offset: const Offset(0, 12),
              ),
            ],
          ),
        ),

        /// 🕋 FIXED QIBLA POINT
        Positioned(
          top: 25,
          child: Column(
            children: const [

              Icon(
                Icons.location_on,
                color: Colors.green,
                size: 42,
              ),

              Text(
                "QIBLA",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),

        /// 🧭 ROTATING ARROW
        Transform.rotate(
          angle:
          (qiblahDirection.qiblah *
              (pi / 180) *
              -1),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Icon(
                Icons.navigation,
                size: 100,
                color: Colors.purple,
              ),

              const SizedBox(height: 10),

              const Text(
                "Move Phone",
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}