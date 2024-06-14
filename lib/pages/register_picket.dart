import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/custom_dropdown.dart';
import 'package:tryber/models/input_design.dart';

class RegisterPicket extends StatelessWidget {
  RegisterPicket({super.key});

  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          CustomDropdownWidget(
            list: const ['Gado de Corte', 'Gado de Leite'],
            onChanged: (newValue) {
              selectedType = newValue;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.16),
          ButtonDesign(text: 'CONFIRMAR', action: () {})
        ],
      ),
    );
  }
}
