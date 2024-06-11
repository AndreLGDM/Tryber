import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/custom_dropdown.dart';
import 'package:tryber/models/input_design.dart';

class RegisterAnimal extends StatelessWidget {
  const RegisterAnimal({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Text(
            'CADASTRAR ANIMAL',
            style:
                GoogleFonts.kanit(color: const Color(0xFF2DBCB6), fontSize: 36),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          const CustomDropdownWidget(
            list: [
              'Bezerro',
              'Cabrito',
              'Cavalo',
              'Galinha',
              'Porco',
              'Ovelha'
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const InputDesign(text: 'ID DO BRINCO'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const InputDesign(text: 'PESO'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          ButtonDesign(text: 'CONFIRMAR', action: () {})
        ],
      ),
    );
  }
}
