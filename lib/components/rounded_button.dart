import 'package:copadomundofiap/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {

  const RoundedButton({
    super.key,
    required this.label,
    required this.onClick,
  });

  final String label;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: mainColor(),
            elevation: 4,
            child: InkWell(
                onTap: onClick,
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        label,
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),),),),);
  }

}