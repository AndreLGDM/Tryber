import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/farm_info.dart';
import 'package:tryber/data/global_var.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/models/input_design.dart';

class RegisterFarm extends StatefulWidget {
  const RegisterFarm(this.changePage, {super.key, required this.back});

  final void Function(String) changePage;
  final void Function(String) back;

  @override
  State<StatefulWidget> createState() {
    return _RegisterFarmState();
  }
}

class _RegisterFarmState extends State<RegisterFarm> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController localizacaoController = TextEditingController();
  List farms = usuarioLogado?.farms ?? [];
  late GenericService farmInfoService;

  @override
  void initState() {
    super.initState();
    farmInfoService = GenericService<FarmInfo>(
      fromJson: FarmInfo.fromJson,
      toJson: (farmInfo) => farmInfo.toJson(),
    );
    loadFarms();
  }

  Future<void> loadFarms() async {
    List loadedFarms = await farmInfoService
        .loadList('${usuarioLogado?.nome}_${usuarioLogado?.id}.json');
    setState(() {
      farms = loadedFarms;
    });
  }

  bool isFarmRegistered(String email) {
    String nome = nomeController.text;
    for (var farm in farms) {
      if (farm.nome == nome) {
        return true;
      }
      break;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    @override
    void cadastrarFazenda() {
      final String nome = nomeController.text;
      final String descricao = descricaoController.text;
      final String localizacao = localizacaoController.text;

      if (nome.isNotEmpty && descricao.isNotEmpty && localizacao.isNotEmpty) {
        if (isFarmRegistered(nome)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Fazenda já cadastrada. Por favor, use outro nome.'),
              duration: Duration(seconds: 2),
            ),
          );
          return;
        }
        List<FarmInfo> fazendas = List.from(farms);
        setState(() {
          fazendas.add(FarmInfo(nome, descricao, localizacao, []));

          GenericService<FarmInfo>(
                  toJson: (farmInfo) => farmInfo.toJson(),
                  fromJson: FarmInfo.fromJson)
              .saveList(
                  fazendas, '${usuarioLogado?.nome}_${usuarioLogado?.id}.json');
          widget.changePage('farm-page');
        });

        nomeController.clear();
        descricaoController.clear();
        localizacaoController.clear();
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
                  widget.back('farm-page');
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            'CADASTRAR FAZENDA',
            style: GoogleFonts.kanit(
                color: const Color(0xFF2DBCB6),
                fontSize: MediaQuery.of(context).size.width * 0.083),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          InputDesign(text: 'NOME', controller: nomeController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(
            text: 'DESCRIÇÃO',
            controller: descricaoController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(
            text: 'LOCALIZAÇÃO',
            controller: localizacaoController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.195),
          ButtonDesign(text: 'CADASTRAR', action: cadastrarFazenda)
        ],
      ),
    );
  }
}
