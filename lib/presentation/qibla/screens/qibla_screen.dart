import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import '../widgets/calibaration.dart';
import '../widgets/compass_section.dart';
import '../widgets/degree_card.dart';
import '../widgets/header_card.dart';
import '../widgets/qibla_description.dart';

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


                        HeaderCard(),

                        const SizedBox(height: 40),

                        CompassSection(size: size, qiblahDirection: qiblahDirection),

                        const SizedBox(height: 40),

                        DegreeCard(qiblahDirection: qiblahDirection),

                        const SizedBox(height: 25),

                        QiblaDescription(),

                        const SizedBox(height: 30),


                        Calibration(),

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







