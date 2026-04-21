import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../data/models/dua_model.dart';

class DuaDetailsScreen extends StatefulWidget {
  final DuaModel dua;

  const DuaDetailsScreen({super.key, required this.dua});

  @override
  State<DuaDetailsScreen> createState() => _DuaDetailsScreenState();
}

class _DuaDetailsScreenState extends State<DuaDetailsScreen> {
  bool isLoading = true;
  List<dynamic> duas = [];

  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  Future<void> fetchDetails() async {
    try {
      final url = widget.dua.textUrl.replaceFirst("http://", "https://");

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);


        setState(() {
          duas = [];

          if (data is Map) {
            data.forEach((key, value) {
              if (value is List) {
                duas.addAll(value);
              }
            });
          }

          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      print(e);
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.dua.title),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : duas.isEmpty
          ? const Center(child: Text("No Dua Found")) // ✅ HERE
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: duas.length,
        itemBuilder: (context, index) {
          final item = duas[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔢 Ayah Number (optional)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.purple.shade100,
                        child: Text("${item['ID'] ?? index + 1}"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// 🕌 Arabic Text (TOP)
                  Text(
                    item['ARABIC_TEXT'] ?? "",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 22,
                      height: 2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// 🌍 Translation (BOTTOM)
                  Text(
                    item['TRANSLATED_TEXT'] ??
                        item['LANGUAGE_ARABIC_TRANSLATED_TEXT'] ??
                        "",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}