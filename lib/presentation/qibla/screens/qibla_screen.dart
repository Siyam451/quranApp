import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import '../widgets/header_card.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: const Text(
          "Qibla Direction",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Stack(
        children: [

          /// 🌈 BACKGROUND GRADIENT
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF3E5F5),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),


          /// 📡 QIBLA STREAM
          StreamBuilder<QiblahDirection>(
            stream: FlutterQiblah.qiblahStream,
            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final qiblahDirection = snapshot.data!;

              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [

                        const SizedBox(height: 10),

                        /// 🌟 HEADER CARD
                        HeaderCard(),

                        const SizedBox(height: 40),

                        /// 🧭 COMPASS SECTION
                        Stack(
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
                        ),

                        const SizedBox(height: 40),

                        /// 📐 DEGREE CARD
                        Container(
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
                        ),

                        const SizedBox(height: 25),

                        /// 📖 HOW QIBLA WORKS
                        Container(
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
                        ),

                        const SizedBox(height: 30),

                        /// 📍 CALIBRATION HELP
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Row(
                            children: const [

                              Icon(
                                Icons.info_outline,
                                color: Colors.purple,
                              ),

                              SizedBox(width: 10),

                              Expanded(
                                child: Text(
                                  "Move your phone in ∞ shape if compass feels inaccurate",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

