import 'package:flutter/material.dart';
class Calibration extends StatelessWidget {
  const Calibration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: const [

          Icon(
            Icons.info_outline,
            color: Colors.purple,
          ),

          SizedBox(width: 10),

          Expanded(
            child: Text(
              "Move your phone in ∞ shape if compass feels inaccurate",
              style: TextStyle(
                color: Colors.grey,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
