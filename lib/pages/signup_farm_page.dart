import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';

class SignupFarmPage extends StatelessWidget {
  const SignupFarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Text(
          'CADASTRAR FAZENDA',
          style:
              GoogleFonts.kanit(color: const Color(0xFF2DBCB6), fontSize: 36),
        ),
        const SizedBox(height: 50),
        const InputDesign(text: 'NOME'),
        const SizedBox(height: 25),
        const InputDesign(text: 'DESCRIÇÃO'),
        const SizedBox(height: 25),
        const InputDesign(text: 'LOCALIZAÇÃO'),
        const SizedBox(height: 100),
        const ButtonDesign(text: 'CONFIRMAR')
      ],
    );
  }
}
