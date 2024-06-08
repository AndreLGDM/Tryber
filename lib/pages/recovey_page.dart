import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';

class RecoveyPage extends StatelessWidget {
  const RecoveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const SizedBox(height: 86),
      Center(
        child: SizedBox(
          width: 232,
          height: 81,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
      const SizedBox(height: 200),
      const InputDesign(text: 'Email de recuperação'),
      const SizedBox(height: 70),
      const ButtonDesign(text: 'CONFIRMAR'),
      const SizedBox(height: 10),
      Text('Confirmar pelo celular', style: GoogleFonts.kanit())
    ]);
  }
}
