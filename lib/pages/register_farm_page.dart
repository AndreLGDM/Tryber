import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';

class RegisterFarmPage extends StatelessWidget {
  const RegisterFarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Text(
            'CADASTRAR FAZENDA',
            style:
                GoogleFonts.kanit(color: const Color(0xFF2DBCB6), fontSize: 36),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          const InputDesign(text: 'NOME'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const InputDesign(text: 'DESCRIÇÃO'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const InputDesign(text: 'LOCALIZAÇÃO'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.195),
          const ButtonDesign(text: 'CONFIRMAR')
        ],
      ),
    );
  }
}
