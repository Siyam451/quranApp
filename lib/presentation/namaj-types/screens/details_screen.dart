import 'package:flutter/material.dart';
import '../../../data/models/namaj_model.dart';

class NamazDetailsScreen extends StatelessWidget {
  final NamazModel namaz;

  const NamazDetailsScreen({super.key, required this.namaz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaz.name), // ✅ FIXED
        backgroundColor: Colors.purple,
      ),

      body: Stack(
        children: [

          /// 🌙 Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF3E5F5), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          /// 📦 CONTENT
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                /// 🔹 HEADER CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple],
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.mosque, color: Colors.white),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "${namaz.name} Prayer Guide", // ✅ FIXED
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 📜 DETAILS
                Expanded(
                  child: ListView(
                    children: [

                      /// 🌟 HOW TO PERFORM
                      _sectionCard(
                        title: "How to Perform",
                        icon: Icons.menu_book,
                        children: namaz.steps
                            .map((step) => _stepItem(step))
                            .toList(), // ✅ DYNAMIC
                      ),

                      const SizedBox(height: 20),

                      /// 🌟 BENEFITS
                      _sectionCard(
                        title: "Benefits",
                        icon: Icons.favorite,
                        children: namaz.benefits
                            .map((b) => _stepItem(b))
                            .toList(), // ✅ DYNAMIC
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🌟 SECTION CARD
  Widget _sectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔹 TITLE
          Row(
            children: [
              Icon(icon, color: Colors.purple),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// 🔹 CONTENT
          ...children,
        ],
      ),
    );
  }

  /// 🔹 STEP / BULLET ITEM
  Widget _stepItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ✔ Icon Bullet
          const Icon(
            Icons.check_circle,
            size: 18,
            color: Colors.purple,
          ),

          const SizedBox(width: 10),

          /// Text
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}