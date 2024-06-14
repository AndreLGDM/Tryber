import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/data/list_manipulate.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/custom_dropdown.dart';
import 'package:tryber/models/input_design.dart';

class RegisterAnimal extends StatelessWidget {
  RegisterAnimal(this.cadastrado, {super.key, required this.back});

  void Function() cadastrado;
  void Function(String) back;
  String? selectedType;
  final TextEditingController idBrincoController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void cadastrarAnimal() {
      final String tipo = selectedType ?? '';
      final String idBrinco = idBrincoController.text;
      final String peso = pesoController.text;

      if (tipo.isNotEmpty && idBrinco.isNotEmpty && peso.isNotEmpty) {
        addAnimal(tipo, idBrinco, peso);

        cadastrado();
        idBrincoController.clear();
        pesoController.clear();
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  back('principal-page');
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            'CADASTRAR ANIMAL',
            style: GoogleFonts.kanit(
                color: const Color(0xFF2DBCB6),
                fontSize: MediaQuery.of(context).size.width * 0.083),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          CustomDropdownWidget(
            list: const [
              'Bezerro',
              'Cabrito',
              'Cavalo',
              'Galinha',
              'Porco',
              'Ovelha'
            ],
            onChanged: (newValue) {
              selectedType = newValue;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(text: 'ID DO BRINCO', controller: idBrincoController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(text: 'PESO', controller: pesoController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          ButtonDesign(text: 'CONFIRMAR', action: cadastrarAnimal)
        ],
      ),
    );
  }
}
