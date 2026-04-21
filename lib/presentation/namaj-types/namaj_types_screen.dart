import 'package:flutter/material.dart';

class NamajTypesScreen extends StatefulWidget {
  const NamajTypesScreen({super.key});

  @override
  State<NamajTypesScreen> createState() => _NamajTypesScreenState();
}

class _NamajTypesScreenState extends State<NamajTypesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Types of Namaj'),
      ),
      body: Column(
        children: [
          ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(

                  ),
                );

          })
        ],
      ),
    );
  }
}
