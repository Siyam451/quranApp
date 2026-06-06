import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MosqueDetailsScreen extends StatelessWidget {

  final String name;
  final double lat;
  final double lon;

  const MosqueDetailsScreen({
    super.key,
    required this.name,
    required this.lat,
    required this.lon,
  });

  Future<void> openGoogleMap() async {

    final url =
        "https://www.google.com/maps/search/?api=1&query=$lat,$lon";

    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                borderRadius:
                BorderRadius.circular(16),

                gradient: const LinearGradient(

                  colors: [
                    Colors.purple,
                    Colors.deepPurple,
                  ],
                ),
              ),

              child: Column(

                children: [

                  const Icon(
                    Icons.mosque,
                    color: Colors.white,
                    size: 60,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                title: const Text(
                  "Coordinates",
                ),
                subtitle: Text(
                  "$lat , $lon",
                ),
              ),
            ),

            const Spacer(),

            SizedBox(

              width: double.infinity,

              height: 55,

              child: ElevatedButton.icon(

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  Colors.purple,
                ),

                onPressed: openGoogleMap,

                icon: const Icon(
                  Icons.map,
                  color: Colors.white,
                ),

                label: const Text(
                  "Open In Google Maps",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}