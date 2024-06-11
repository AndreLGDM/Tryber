import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/input_design.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_password.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Text(
            'CRIAR CONTA',
            style:
                GoogleFonts.kanit(color: const Color(0xFF2DBCB6), fontSize: 36),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          const InputDesign(text: 'NOME'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const InputDesign(text: 'SOBRENOME'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const InputDesign(text: 'EMAIL'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const InputDesign(text: 'TELEFONE'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const InputPassword(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const InputDesign(text: 'CONFIRMAR SENHA'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ButtonDesign(text: 'CONFIRMAR', action: () {})
        ],
      ),
    );
  }
}
