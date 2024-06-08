import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';

class RegisterPicket extends StatelessWidget {
  const RegisterPicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        Text(
          'ADCIONAR PIQUETE',
          style:
              GoogleFonts.kanit(color: const Color(0xFF2DBCB6), fontSize: 36),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.075),
        const InputDesign(text: 'NOME DO PIQUETE'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        const InputDesign(text: 'TAMANHO'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        const InputDesign(text: 'DESCRIÇÃO DO PIQUETE'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.195),
        const ButtonDesign(text: 'CONFIRMAR')
      ],
    );
  }
}
