import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonDesign extends StatelessWidget {
  const ButtonDesign({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 180,
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF2DBCB6),
              side: const BorderSide(color: Color(0xFF2DBCB6), width: 2.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            text,
            style: GoogleFonts.kanit(fontSize: 24),
            textAlign: TextAlign.center,
          )),
    );
  }
}
