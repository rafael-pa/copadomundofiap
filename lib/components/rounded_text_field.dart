import 'package:copadomundofiap/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedTextField extends StatelessWidget {

  const RoundedTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.obscureText = false,
  });

  final String label;
  final Function(String) onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextField(
          style: const TextStyle(
              color: Colors.black
          ),

          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 3, color: mainColor())
            ),

            enabledBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 2, color: Colors.black)
            ),

            filled: true,
            fillColor: Colors.white,

            labelText: label,
          ),

          obscureText: obscureText,
          onChanged: onChanged,
        ),
    );
  }

}