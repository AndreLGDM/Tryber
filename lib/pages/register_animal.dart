import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/data/list_manipulate.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/custom_dropdown.dart';
import 'package:tryber/models/input_design.dart';

class RegisterAnimal extends StatefulWidget {
  const RegisterAnimal(this.cadastrado, {super.key, required this.back});

  final void Function() cadastrado;
  final void Function(String) back;

  @override
  State<RegisterAnimal> createState() {
    return _RegisterAnimalState();
  }
}

class _RegisterAnimalState extends State<RegisterAnimal> {
  String? selectedType;
  String? selectedSubtype;
  final TextEditingController idBrincoController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  List<String> subtypesList = [];
  Key dropdownKey = UniqueKey();

  void _updateSubtypesList(String type) {
    List<String> newSubtypesList;
    switch (type) {
      case 'Bovino':
        newSubtypesList = [
          'Bezerro',
          'Garrote',
          'Novilho',
          'Novilha',
          'Boi',
          'Touro',
          'Vaca',
        ];
        break;
      case 'Equino':
        newSubtypesList = [
          'Poldro',
          'Potranca',
          'Garanhão',
          'Égua',
          'Cavalo',
        ];
        break;
      case 'Bubalino':
        newSubtypesList = [
          'Bezerro de búfalo',
          'Novilho de búfalo',
          'Búfalo',
          'Búfala'
        ];
        break;
      default:
        newSubtypesList = [];
    }

    setState(() {
      subtypesList = newSubtypesList;
      selectedSubtype = null;
      dropdownKey = UniqueKey();
    });
  }

  void cadastrarAnimal() {
    final String tipo = selectedType ?? '';
    final String subTipo = selectedSubtype ?? '';
    final String idBrinco = idBrincoController.text;
    final String peso = pesoController.text;

    if (tipo.isNotEmpty &&
        idBrinco.isNotEmpty &&
        peso.isNotEmpty &&
        subTipo.isNotEmpty) {
      addAnimal(tipo, idBrinco, peso, subTipo);

      widget.cadastrado();
      idBrincoController.clear();
      pesoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  widget.back('principal-page');
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
            text: 'TIPO',
            list: const [
              'Bovino',
              'Equino',
              'Bubalino',
            ],
            onChanged: (newValue) {
              selectedType = newValue;
              _updateSubtypesList(newValue);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomDropdownWidget(
            key: dropdownKey,
            text: 'SUBTIPO',
            list: subtypesList,
            onChanged: (newValue) {
              selectedSubtype = newValue;
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
