import 'package:flutter/material.dart';

class PrayerCard extends StatelessWidget {

  final String prayer;
  final bool completed;
  final ValueChanged<bool> onChanged;

  const PrayerCard({
    super.key,
    required this.prayer,
    required this.completed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(

      duration: const Duration(milliseconds: 300),

      margin: const EdgeInsets.only(bottom: 14),

      decoration: BoxDecoration(

        color: completed
            ? Colors.green.shade50
            : Theme.of(context).cardColor,

        borderRadius:
        BorderRadius.circular(18),

        border: Border.all(

          color: completed
              ? Colors.green
              : Colors.grey.shade300,

          width: 1.3,
        ),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(.05),

            blurRadius: 10,

            offset: const Offset(0,5),
          ),
        ],
      ),

      child: ListTile(

        contentPadding:
        const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 6,
        ),

        leading: CircleAvatar(

          radius: 24,

          backgroundColor:

          completed
              ? Colors.green
              : Colors.purple,

          child: Icon(

            completed
                ? Icons.check
                : Icons.mosque,

            color: Colors.white,
          ),
        ),

        title: Text(

          prayer,

          style: const TextStyle(

            fontSize: 17,

            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(

          completed
              ? "Prayer Completed"
              : "Pending",

          style: TextStyle(

            color:

            completed
                ? Colors.green
                : Colors.orange,
          ),
        ),

        trailing: Switch(

          value: completed,

          activeColor: Colors.green,

          onChanged: onChanged,
        ),
      ),
    );
  }
}