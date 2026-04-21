import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quranapp/presentation/dua/widgets/dua_card.dart';
import '../../providers/dua_provider.dart';


class DuaScreen extends StatefulWidget {
  const DuaScreen({super.key});

  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Duas"),
      ),
      body: Consumer<DuaProvider>(
        builder: (context, provider, child) {

          if (provider.duaisLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errormessage != null) {
            return Center(child: Text(provider.errormessage!));
          }

          return Column(
            children: [

              /// 🌙 TOP ISLAMIC QUOTE CONTAINER
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Colors.purple, Colors.deepPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Text(
                  "Always remember Allah and make dua often. "
                      "Turn back to Him in every moment — in ease and in hardship. "
                      "Indeed, hearts find peace in the remembrance of Allah.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              /// 📜 LIST OF DUAS
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: provider.duas.length,
                  itemBuilder: (context, index) {
                    final dua = provider.duas[index];

                    return DuaCard(dua: dua);
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