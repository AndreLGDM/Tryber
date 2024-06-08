import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';

class RegisterTrough extends StatelessWidget {
  const RegisterTrough({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        Text(
          'CADASTRAR COCHO',
          style:
              GoogleFonts.kanit(color: const Color(0xFF2DBCB6), fontSize: 36),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.075),
        const InputDesign(text: 'CÓDIGO DO COCHO'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        const InputDesign(text: 'DESCRIÇÃO'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        const InputDesign(text: 'NÚMEROS DE BAIAS'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        const InputDesign(text: 'TIPO DE RAÇÃO'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.055),
        const ButtonDesign(text: 'CONFIRMAR')
      ],
    );
  }
}
