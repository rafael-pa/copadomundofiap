import 'package:copadomundofiap/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InnerText extends StatelessWidget {

  const InnerText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
          text,
          style: GoogleFonts.montserrat(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)),
    );
  }

}