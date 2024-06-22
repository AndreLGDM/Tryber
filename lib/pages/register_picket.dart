import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/custom_dropdown.dart';
import 'package:tryber/models/input_design.dart';
import 'package:tryber/Objects/picket_info.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/data/global_var.dart';

class RegisterPicket extends StatefulWidget {
  const RegisterPicket({super.key, required this.back});

  final void Function() back;

  @override
  State<RegisterPicket> createState() {
    return _RegisterPicketState();
  }
}

class _RegisterPicketState extends State<RegisterPicket> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController tamanhoController = TextEditingController();
  String? selectedType;
  List pickets = fazendaAcessada?.pickets ?? [];
  late GenericService picketInfoService;

  @override
  void initState() {
    super.initState();
    picketInfoService = GenericService<PicketInfo>(
      fromJson: PicketInfo.fromJson,
      toJson: (picketInfo) => picketInfo.toJson(),
    );
    loadPickets();
  }

  Future<void> loadPickets() async {
    List loadedFarms =
        await picketInfoService.loadList('${fazendaAcessada?.nome}.json');
    setState(() {
      pickets = loadedFarms;
    });
  }

  void cadastrarPiquete() {
    final String tipo = selectedType ?? '';
    final String nome = nomeController.text;
    final String descricao = descricaoController.text;
    final String tamanho = tamanhoController.text;

    if (nome.isNotEmpty &&
        descricao.isNotEmpty &&
        tamanho.isNotEmpty &&
        tipo.isNotEmpty) {
      List<PicketInfo> piquetes = List.from(pickets);
      setState(() {
        piquetes.add(PicketInfo(nome, tamanho, descricao, tipo, [], []));
        GenericService<PicketInfo>(
                toJson: (picketInfo) => picketInfo.toJson(),
                fromJson: PicketInfo.fromJson)
            .saveList(piquetes, '${fazendaAcessada?.nome}.json');
        widget.back();
      });

      nomeController.clear();
      descricaoController.clear();
      tamanhoController.clear();
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
                onPressed: widget.back,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            'ADICIONAR PIQUETE',
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
            text: 'TIPO',
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
