import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonDesign extends StatelessWidget {
  const ButtonDesign({super.key, required this.action, required this.text});

  final String text;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.075,
      width: MediaQuery.of(context).size.width * 0.402,
      child: OutlinedButton(
          onPressed: action,
          style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF2DBCB6),
              side: const BorderSide(color: Color(0xFF2DBCB6), width: 2.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Expanded(
            child: Text(
              text,
              style: GoogleFonts.kanit(
                  fontSize: MediaQuery.of(context).size.height * 0.024),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
