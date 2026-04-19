import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  const Customtextformfield({
    super.key, required this.hintText, required this.labelText, this.controller, required this.keyboardtype, this.validator, required this.icons});

  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final TextInputType keyboardtype;
  final String? Function(String?)? validator;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardtype,
        validator: validator,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            prefixIcon: Icon(icons),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide : BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue,width: 1.5),
          ),

          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple,width: 1.5),
          ),
        ),





      ),
    );
  }
}
