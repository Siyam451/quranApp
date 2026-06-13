import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MosqueDetailsScreen extends StatefulWidget {
  final String name;
  final double lat;
  final double lon;

  const MosqueDetailsScreen({
    super.key,
    required this.name,
    required this.lat,
    required this.lon,
  });

  @override
  State<MosqueDetailsScreen> createState() =>
      _MosqueDetailsScreenState();
}

class _MosqueDetailsScreenState
    extends State<MosqueDetailsScreen> {

  Position? currentPosition;
  double distanceKm = 0;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {

    final position =
    await Geolocator.getCurrentPosition();

    distanceKm =
        Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          widget.lat,
          widget.lon,
        ) /
            1000;

    setState(() {
      currentPosition = position;
    });
  }

  Future<void> navigateToMosque() async {

    final url =
        "https://www.google.com/maps/dir/?api=1&destination=${widget.lat},${widget.lon}";

    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {

    final mosquePosition =
    LatLng(
      widget.lat,
      widget.lon,
    );

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Column(

        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),

            decoration: const BoxDecoration(
              gradient: LinearGradient(
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
                  size: 50,
                  color: Colors.white,
                ),

                const SizedBox(height: 10),

                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "${distanceKm.toStringAsFixed(2)} km away",
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          Expanded(

            child: currentPosition == null

                ? const Center(
              child:
              CircularProgressIndicator(),
            )

                : FlutterMap(

              options: MapOptions(
                initialCenter:
                mosquePosition,
                initialZoom: 15,
              ),

              children: [

                TileLayer(

                  urlTemplate:
                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                  userAgentPackageName:
                  'com.example.quranapp',
                ),

                MarkerLayer(

                  markers: [

                    Marker(

                      point:
                      mosquePosition,

                      width: 50,
                      height: 50,

                      child: const Icon(
                        Icons.mosque,
                        size: 40,
                        color: Colors.green,
                      ),
                    ),

                    Marker(

                      point: LatLng(
                        currentPosition!
                            .latitude,
                        currentPosition!
                            .longitude,
                      ),

                      width: 50,
                      height: 50,

                      child: const Icon(
                        Icons.person_pin_circle,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.all(16),

            child: SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(

                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  Colors.purple,
                ),

                onPressed:
                navigateToMosque,

                icon: const Icon(
                  Icons.navigation,
                  color: Colors.white,
                ),

                label: const Text(
                  "Navigate To Mosque",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}