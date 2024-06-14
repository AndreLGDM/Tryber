import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextButtonDesign extends StatelessWidget {
  const TextButtonDesign(this.action, this.chave,
      {super.key, required this.text});

  final String text;
  final String chave;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: action,
        style: TextButton.styleFrom(
            textStyle: GoogleFonts.kanit(),
            overlayColor: Colors.transparent,
            foregroundColor: const Color(0xFF4C5C65)),
        key: ValueKey(chave),
        child: Text(text));
  }
}
