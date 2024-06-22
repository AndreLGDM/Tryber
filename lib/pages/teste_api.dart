import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/Services/api_service.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/data/global_var.dart';
import 'package:tryber/models/animal_info.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';

class TesteApi extends StatefulWidget {
  const TesteApi(this.changePage, {super.key});

  final void Function(String) changePage;

  @override
  State<TesteApi> createState() {
    return _TesteApiState();
  }
}

class _TesteApiState extends State<TesteApi> {
  late ApiService apiService;
  final TextEditingController urlController = TextEditingController();
  final TextEditingController idBrincoController = TextEditingController();
  final TextEditingController novaQuantidadeController =
      TextEditingController();
  late GenericService animalsService;
  List animals = picketAcessado?.animals ?? [];

  @override
  void initState() {
    super.initState();
    animalsService = GenericService<AnimalInfo>(
        fromJson: AnimalInfo.fromJson,
        toJson: (animalInfo) => animalInfo.toJson());
    loadAnimalInfo();
  }

  Future<void> loadAnimalInfo() async {
    List loadedUsers = await animalsService
        .loadList('${picketAcessado?.nome}_${picketAcessado?.tipo}.json');
    setState(() {
      animals = loadedUsers;
    });
  }

  void atualizarRacaoApi() {
    String url = urlController.text;
    apiService = ApiService('http://$url:5001');
    String idBrinco = idBrincoController.text;
    String quantidade = novaQuantidadeController.text;
    for (final animal in animals) {
      if (animal.idBrinco == idBrinco) {
        apiService.updateRacao(idBrinco, int.parse(quantidade));
        widget.changePage('manage-picket');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Container(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: () {
                widget.changePage('manage-picket');
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30,
              )),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.15),
        Text(
          'ATUALIZAR RAÇÃO',
          style:
              GoogleFonts.kanit(color: const Color(0xFF2DBCB6), fontSize: 36),
        ),
        const SizedBox(height: 100),
        InputDesign(text: 'Id Brinco', controller: idBrincoController),
        const SizedBox(height: 50),
        InputDesign(
            text: 'Nova Quantidade', controller: novaQuantidadeController),
        const SizedBox(height: 50),
        InputDesign(text: 'Url', controller: urlController),
        const SizedBox(height: 50),
        ButtonDesign(action: atualizarRacaoApi, text: 'ENVIAR')
      ],
    );
  }
}
