import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPortion extends StatelessWidget {
  const InputPortion({super.key, required this.text, this.controller});

  final String text;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: TextSelectionTheme(
        data: const TextSelectionThemeData(
          selectionHandleColor: Color(0xFF2DBCB6),
        ),
        child: DefaultTextEditingShortcuts(
          child: TextFormField(
            cursorColor: const Color(0xFF2DBCB6),
            cursorWidth: MediaQuery.of(context).size.width * 0.002,
            controller: controller,
            decoration: InputDecoration(
              labelText: text,
              labelStyle: GoogleFonts.kanit(
                  color: const Color(0xFF4C5C65),
                  fontSize: MediaQuery.of(context).size.height * 0.014),
              floatingLabelStyle: const TextStyle(color: Color(0xFF2DBCB6)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4C5C65)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF2DBCB6),
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF4C5C65))),
            ),
          ),
        ),
      ),
    );
  }
}
