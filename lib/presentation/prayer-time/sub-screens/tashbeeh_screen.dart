import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/tashbeeh_provider.dart';


class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Tasbeeh Counter",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Consumer<TasbeehProvider>(

        builder:
            (
            context,
            provider,
            child){

          final progress =
              provider.count /
                  provider.target;

          return Padding(

            padding:
            const EdgeInsets.all(20),

            child: Column(

              children: [

                Container(

                  width:
                  double.infinity,

                  padding:
                  const EdgeInsets.all(
                      20),

                  decoration:
                  BoxDecoration(

                    borderRadius:
                    BorderRadius.circular(
                        20),

                    gradient:
                    const LinearGradient(

                      colors: [

                        Colors.purple,

                        Colors.deepPurple,
                      ],
                    ),
                  ),

                  child: Column(

                    children: [

                      const Text(
                        "Current Dhikr",
                        style: TextStyle(
                          color:
                          Colors.white70,
                        ),
                      ),

                      const SizedBox(
                          height: 10),

                      Text(
                        provider.currentDhikr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius:
                          BorderRadius.circular(12),
                        ),

                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(

                            dropdownColor: Colors.purple,

                            value:
                            provider.currentDhikr,

                            iconEnabledColor:
                            Colors.white,

                            style: const TextStyle(
                              color: Colors.white,
                            ),

                            items:
                            provider.dhikrs.map(
                                  (dhikr) {

                                return DropdownMenuItem(
                                  value: dhikr,

                                  child: Text(
                                    dhikr,
                                  ),
                                );
                              },
                            ).toList(),

                            onChanged: (value) {

                              if (value != null) {

                                provider.changeDhikr(
                                  value,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                    height: 30),

                Stack(

                  alignment:
                  Alignment.center,

                  children: [

                    SizedBox(

                      width: 220,
                      height: 220,

                      child:
                      CircularProgressIndicator(

                        value:
                        progress > 1
                            ? 1
                            : progress,

                        strokeWidth:
                        12,

                        backgroundColor:
                        Colors.grey
                            .shade300,

                        color:
                        Colors.purple,
                      ),
                    ),

                    Column(

                      children: [

                        Text(

                          "${provider.count}",

                          style:
                          const TextStyle(

                            fontSize: 50,

                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        Text(
                          "/ ${provider.target}",
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                    height: 30),

                Row(

                  mainAxisAlignment:
                  MainAxisAlignment.center,

                  children: [

                    _targetButton(
                      provider,
                      33,
                    ),

                    _targetButton(
                      provider,
                      99,
                    ),

                    _targetButton(
                      provider,
                      100,
                    ),
                  ],
                ),

                const Spacer(),

                SizedBox(

                  width:
                  double.infinity,

                  height: 65,

                  child:
                  ElevatedButton(

                    style:
                    ElevatedButton.styleFrom(

                      backgroundColor:
                      Colors.purple,

                      shape:
                      RoundedRectangleBorder(

                        borderRadius:
                        BorderRadius.circular(
                            20),
                      ),
                    ),

                    onPressed:
                    provider.increment,

                    child: const Text(

                      "TAP TO COUNT",

                      style: TextStyle(

                        fontSize: 18,

                        color:
                        Colors.white,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                    height: 15),

                OutlinedButton.icon(

                  onPressed:
                  provider.reset,

                  icon:
                  const Icon(
                    Icons.refresh,
                  ),

                  label:
                  const Text(
                    "Reset Counter",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _targetButton(
      TasbeehProvider provider,
      int value){

    final selected =
        provider.target ==
            value;

    return Padding(

      padding:
      const EdgeInsets.symmetric(
          horizontal: 6),

      child:
      ChoiceChip(

        label:
        Text(
          "$value",
        ),

        selected:
        selected,

        onSelected:
            (_){

          provider.changeTarget(
              value);
        },
      ),
    );
  }
}