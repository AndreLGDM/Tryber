import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/Objects/trough_info.dart';
import 'package:tryber/Services/api_service.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/data/global_var.dart';
import 'package:tryber/Objects/animal_info.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/custom_dropdown.dart';
import 'package:tryber/models/input_portion.dart';

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
  Key dropdownKey = UniqueKey();
  Key dropdownKey2 = UniqueKey();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController idBrincoController = TextEditingController();
  final TextEditingController novaQuantidadeController =
      TextEditingController();
  String? selectedAnimal;
  String? selectedTrough;
  late GenericService animalsService;
  late GenericService troughsService;
  late GenericService troughAnimalsService;
  List animals = picketAcessado?.animals ?? [];
  List troughs = picketAcessado?.cochos ?? [];
  List troughAnimals = cochoSelecionado?.animals ?? [];

  @override
  void initState() {
    super.initState();
    animalsService = GenericService<AnimalInfo>(
        fromJson: AnimalInfo.fromJson,
        toJson: (animalInfo) => animalInfo.toJson());
    troughsService = GenericService<TroughInfo>(
        fromJson: TroughInfo.fromJson,
        toJson: (troughInfo) => troughInfo.toJson());
    troughAnimalsService = GenericService<AnimalInfo>(
        fromJson: AnimalInfo.fromJson,
        toJson: (animalInfo) => animalInfo.toJson());
    loadTroughInfo();
    loadAnimalInfo();
    loadTroughAnimalsInfo();
  }

  Future<void> loadAnimalInfo() async {
    List loadedAnimals = await animalsService
        .loadList('${picketAcessado?.nome}_${picketAcessado?.tipo}.json');
    setState(() {
      animals = loadedAnimals;
      dropdownKey = UniqueKey();
    });
  }

  Future<void> loadTroughInfo() async {
    List loadedTroughs =
        await troughsService.loadList('${picketAcessado?.nome}_trough.json');
    setState(() {
      troughs = loadedTroughs;
      dropdownKey2 = UniqueKey();
    });
  }

  Future<void> loadTroughAnimalsInfo() async {
    List loadedTroughAnimals = await troughsService
        .loadList('${cochoSelecionado?.codigo}_Animals.json');
    setState(() {
      troughs = loadedTroughAnimals;
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
        break;
      }
    }
  }

  void vincularAnimal() {
    final String animal = selectedAnimal ?? '';
    final String cocho = selectedTrough ?? '';
    if (animal.isNotEmpty && cocho.isNotEmpty) {
      for (final trough in troughs) {
        for (final animalInfo in trough.animals) {
          if (animalInfo.idBrinco == animal) {
            cochoSelecionado = trough;
            troughAnimalsService.deleteItem(
                animalInfo, '${cochoSelecionado?.codigo}_Animals.json');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Animal Removido de ${cochoSelecionado?.codigo}.'),
                duration: const Duration(seconds: 2),
              ),
            );
            return;
          }
        }
        if (trough.codigo == cocho) {
          cochoSelecionado = trough;
          for (final animal in animals) {
            if (animal.idBrinco == animal) {
              List<AnimalInfo> animaisCocho = List.from(trough.animals);
              animaisCocho.add(animal as AnimalInfo);
            }
          }
        }
      }
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
                  widget.changePage('manage-picket');
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            'VINCULAR ANIMAL',
            style: GoogleFonts.kanit(
                color: const Color(0xFF2DBCB6),
                fontSize: MediaQuery.of(context).size.height * 0.04),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          CustomDropdownWidget(
              key: dropdownKey,
              text: 'SELECIONE O ANIMAL',
              list: animals
                  .map((animal) => (animal as AnimalInfo).idBrinco)
                  .toList(),
              onChanged: (newValue) {
                selectedAnimal = newValue;
              }),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          CustomDropdownWidget(
              key: dropdownKey2,
              text: 'SELECIONAR COCHO',
              list: troughs
                  .map((trough) => (trough as TroughInfo).codigo)
                  .toList(),
              onChanged: (newValue) {
                selectedTrough = newValue;
              }),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.2),
                child: const InputPortion(text: 'QUANTIDADE DE RAÇÃO'),
              ),
              const InputPortion(text: 'PORÇÃO DE RAÇÃO'),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          ButtonDesign(action: atualizarRacaoApi, text: 'VINCULAR')
        ],
      ),
    );
  }
}
