import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/mosque_provider.dart';

import 'widgets/mosque_card.dart';

class MosqueScreen
    extends StatefulWidget {

  const MosqueScreen({
    super.key,
  });

  @override
  State<MosqueScreen>
  createState()
  =>
      _MosqueScreenState();
}

class _MosqueScreenState
    extends State<MosqueScreen>{

  @override
  void initState() {
    super.initState();

    Future.microtask(
          () {

        context
            .read<
            MosqueProvider>()
            .loadMosques();

      },
    );
  }

  @override
  Widget build(
      BuildContext context){

    return Scaffold(

      appBar:
      AppBar(

        backgroundColor:
        Colors.purple,

        title:
        const Text(
          "Nearby Mosques",
        ),
      ),

      body:
      Consumer<
          MosqueProvider>(

        builder:
            (
            context,
            p,
            _){

          if(
          p.loading){
            if (p.error != null) {
              return Center(
                child: Text(
                  p.error!,
                ),
              );
            }

            return
              const Center(
                child:
                CircularProgressIndicator(),
              );
          }

          return Column(

            children: [

              Container(

                margin:
                const EdgeInsets.all(16),

                padding:
                const EdgeInsets.all(18),

                decoration:
                BoxDecoration(

                  borderRadius:
                  BorderRadius.circular(
                      16),

                  gradient:
                  const LinearGradient(

                    colors: [

                      Colors.purple,

                      Colors.deepPurple,

                    ],
                  ),
                ),

                child:
                const Text(

                  "Find nearby mosques and pray in congregation 🕌",

                  style:
                  TextStyle(
                    color:
                    Colors.white,
                  ),
                ),
              ),

              Text(
                "${p.mosques.length} mosques found",
              ),

              Expanded(

                child:
                ListView.builder(

                  itemCount:
                  p.mosques.length,

                  itemBuilder:
                      (
                      c,
                      i){

                    return MosqueCard(

                      name:
                      p.mosques[i]
                          .name,
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