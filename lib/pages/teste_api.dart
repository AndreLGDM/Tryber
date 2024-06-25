import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/Objects/trough_info.dart';
import 'package:tryber/Services/api_service.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/data/global_var.dart';
import 'package:tryber/Objects/animal_info.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/custom_dropdown.dart';
import 'package:tryber/models/input_design.dart';
import 'package:tryber/models/input_portion.dart';

class TesteApi extends StatefulWidget {
  const TesteApi({super.key, required this.back});

  final void Function() back;

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
    List loadedTroughAnimals = await troughAnimalsService
        .loadList('${cochoSelecionado?.codigo}_Animals.json');
    setState(() {
      troughAnimals = loadedTroughAnimals;
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
        widget.back;
        break;
      }
    }
  }

  void vincularAnimal() {
    final String animalId = selectedAnimal ?? '';
    final String cochoId = selectedTrough ?? '';
    if (animalId.isNotEmpty && cochoId.isNotEmpty) {
      for (final trough in troughs) {
        cochoSelecionado = trough;
        loadTroughAnimalsInfo();
        for (final animalInfo in troughAnimals) {
          if (animalInfo.idBrinco == animalId) {
            setState(() {
              troughAnimalsService.deleteItem(
                  animalInfo, '${cochoSelecionado?.codigo}_Animals.json');
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Animal removido de ${cochoSelecionado?.codigo}.'),
                duration: const Duration(seconds: 2),
              ),
            );
            break;
          }
        }
      }
      for (final trough in troughs) {
        if (trough.codigo == cochoId) {
          cochoSelecionado = trough;
          loadTroughAnimalsInfo();
          for (final animal in animals) {
            if (animal.idBrinco == animalId) {
              List<AnimalInfo> animaisCocho = List.from(troughAnimals);
              setState(() {
                animaisCocho.add(animal);
                GenericService<AnimalInfo>(
                    fromJson: AnimalInfo.fromJson,
                    toJson: (animalCochoInfo) =>
                        animalCochoInfo.toJson()).saveList(
                    animaisCocho, '${cochoSelecionado?.codigo}_Animals.json');
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('Animal Vinculado a ${cochoSelecionado?.codigo}.'),
                  duration: const Duration(seconds: 2),
                ),
              );
              break;
            }
          }
        }
      }
      if (urlController.text.isNotEmpty &&
          idBrincoController.text.isNotEmpty &&
          novaQuantidadeController.text.isEmpty) {
        atualizarRacaoApi();
      }
      widget.back;
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            'VINCULAR ANIMAL',
            style: GoogleFonts.kanit(
                color: const Color(0xFF2DBCB6),
                fontSize: MediaQuery.of(context).size.height * 0.04),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          InputDesign(text: 'URL', controller: urlController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
          ButtonDesign(action: vincularAnimal, text: 'VINCULAR')
        ],
      ),
    );
  }
}
