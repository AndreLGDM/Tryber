import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/data/list_manipulate.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/custom_dropdown.dart';
import 'package:tryber/models/input_design.dart';
import 'package:tryber/models/picket_info.dart';

class RegisterPicket extends StatelessWidget {
  RegisterPicket({super.key, required this.back});

  final void Function(String) back;
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController();
    final TextEditingController tamanhoController = TextEditingController();

    void cadastrarPiquete() {
      final String tipo = selectedType ?? '';
      final String nome = nomeController.text;
      final String descricao = descricaoController.text;
      final String tamanho = tamanhoController.text;

      if (nome.isNotEmpty &&
          descricao.isNotEmpty &&
          tamanho.isNotEmpty &&
          tipo.isNotEmpty) {
        pickets.add(PicketInfo(nome, tamanho, descricao, tipo));
        back('picket-page');
        nomeController.clear();
        descricaoController.clear();
        tamanhoController.clear();
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
                  back('picket-page');
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            'ADCIONAR PIQUETE',
            style: GoogleFonts.kanit(
                color: const Color(0xFF2DBCB6),
                fontSize: MediaQuery.of(context).size.width * 0.083),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          InputDesign(text: 'NOME DO PIQUETE', controller: nomeController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(text: 'TAMANHO', controller: tamanhoController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(
              text: 'DESCRIÇÃO DO PIQUETE', controller: descricaoController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          CustomDropdownWidget(
            list: const ['Gado de Corte', 'Gado de Leite'],
            onChanged: (newValue) {
              selectedType = newValue;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.16),
          ButtonDesign(text: 'CONFIRMAR', action: cadastrarPiquete)
        ],
      ),
    );
  }
}
