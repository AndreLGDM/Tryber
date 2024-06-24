import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/Objects/trough_info.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/data/global_var.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';

class RegisterTrough extends StatefulWidget {
  const RegisterTrough({super.key, required this.back});

  final void Function() back;

  @override
  State<RegisterTrough> createState() {
    return _RegisterTroughState();
  }
}

class _RegisterTroughState extends State<RegisterTrough> {
  final TextEditingController codigoController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController numeroBaiasController = TextEditingController();
  final TextEditingController tipoRacaoController = TextEditingController();
  List trough = picketAcessado?.cochos ?? [];
  late GenericService troughInfoService;

  @override
  void initState() {
    super.initState();
    troughInfoService = GenericService<TroughInfo>(
      fromJson: TroughInfo.fromJson,
      toJson: (cochoInfo) => cochoInfo.toJson(),
    );
    loadTrough();
  }

  Future<void> loadTrough() async {
    List loadedTroughs = await troughInfoService
        .loadList('${picketAcessado?.nome}_trought}.json');
    setState(() {
      trough = loadedTroughs;
    });
  }

  void cadastrarCocho() {
    final String codigo = codigoController.text;
    final String descricao = descricaoController.text;
    final String numeroBaias = numeroBaiasController.text;
    final String tipoRacao = tipoRacaoController.text;

    if (codigo.isEmpty ||
        descricao.isEmpty ||
        numeroBaias.isEmpty ||
        tipoRacao.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    List<TroughInfo> cochos = List.from(trough);
    setState(() {
      cochos.add(TroughInfo(codigo, descricao, numeroBaias, tipoRacao, []));
      GenericService<TroughInfo>(
              toJson: (troughInfo) => troughInfo.toJson(),
              fromJson: TroughInfo.fromJson)
          .saveList(cochos, '${picketAcessado?.nome}_trough.json');
    });

    widget.back();
    codigoController.clear();
    descricaoController.clear();
    numeroBaiasController.clear();
    tipoRacaoController.clear();
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
            'CADASTRAR COCHO',
            style: GoogleFonts.kanit(
                color: const Color(0xFF2DBCB6),
                fontSize: MediaQuery.of(context).size.width * 0.083),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          InputDesign(text: 'CÓDIGO DO COCHO', controller: codigoController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(text: 'DESCRIÇÃO', controller: descricaoController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(
              text: 'NÚMEROS DE BAIAS', controller: numeroBaiasController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(text: 'TIPO DE RAÇÃO', controller: tipoRacaoController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.055),
          ButtonDesign(text: 'CONFIRMAR', action: cadastrarCocho)
        ],
      ),
    );
  }
}
