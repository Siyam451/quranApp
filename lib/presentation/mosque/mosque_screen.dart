import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/mosque_provider.dart';
import 'mosque_details_screen.dart';
import 'widgets/mosque_card.dart';

class MosqueScreen extends StatefulWidget {
  const MosqueScreen({super.key});

  @override
  State<MosqueScreen> createState() => _MosqueScreenState();
}

class _MosqueScreenState extends State<MosqueScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<MosqueProvider>().loadMosques();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Nearby Mosques",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Consumer<MosqueProvider>(
        builder: (context, provider, child) {

          if (provider.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.error != null) {
            return Center(
              child: Text(provider.error!),
            );
          }

          return Column(
            children: [

              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),

                  gradient: const LinearGradient(
                    colors: [
                      Colors.purple,
                      Colors.deepPurple,
                    ],
                  ),
                ),

                child: const Text(
                  "Find nearby mosques and pray in congregation 🕌",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${provider.mosques.length} Mosques Found",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: provider.mosques.isEmpty

                    ? const Center(
                  child: Text(
                    "No nearby mosques found 🕌",
                  ),
                )

                    : ListView.builder(

                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),

                  itemCount:
                  provider.mosques.length,

                  itemBuilder:
                      (context, index) {

                    final mosque =
                    provider.mosques[index];

                    return MosqueCard(

                      name:
                      mosque.name,

                      onTap: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) =>
                                MosqueDetailsScreen(

                                  name:
                                  mosque.name,

                                  lat:
                                  mosque.lat,

                                  lon:
                                  mosque.lon,
                                ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}