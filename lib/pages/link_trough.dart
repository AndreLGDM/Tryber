import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/Objects/picket_info.dart';
import 'package:tryber/Objects/trough_info.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/data/global_var.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/custom_dropdown.dart';

class LinkTrough extends StatefulWidget {
  const LinkTrough({super.key, required this.back});

  final void Function() back;

  @override
  State<LinkTrough> createState() {
    return _LinkTroughState();
  }
}

class _LinkTroughState extends State<LinkTrough> {
  Key dropdownKey = UniqueKey();
  String? selectedTrough;
  late GenericService troughsService;
  late GenericService picketsService;
  List pickets = fazendaAcessada?.pickets ?? [];
  List troughs = fazendaAcessada?.cochos ?? [];
  List cochosPiquete = [];

  @override
  void initState() {
    super.initState();
    troughsService = GenericService<TroughInfo>(
        fromJson: TroughInfo.fromJson,
        toJson: (troughInfo) => troughInfo.toJson());
    picketsService = GenericService<PicketInfo>(
        fromJson: PicketInfo.fromJson,
        toJson: (picketInfo) => picketInfo.toJson());
    loadPicketInfo();
    loadTroughInfo();
  }

  Future<void> loadCochosPiquete(String diretorio) async {
    List loadedTroughs = await troughsService.loadList(diretorio);
    setState(() {
      cochosPiquete = loadedTroughs;
    });
  }

  Future<void> loadTroughInfo() async {
    List loadedTroughs =
        await troughsService.loadList('${fazendaAcessada?.nome}_troughs');
    setState(() {
      troughs = loadedTroughs;
      dropdownKey = UniqueKey();
    });
  }

  Future<void> loadPicketInfo() async {
    List loadedPickets =
        await picketsService.loadList('${fazendaAcessada?.nome}_pickets');
    setState(() {
      pickets = loadedPickets;
    });
  }

  bool isTroughLinked() {
    String codigo = selectedTrough ?? '';
    for (var cocho in cochosPiquete) {
      if (cocho.codigo == codigo) {
        return true;
      }
      break;
    }
    return false;
  }

  void vincularCocho() async {
    final String codigoCocho = selectedTrough ?? '';
    bool cochoVinculado = false;
    if (codigoCocho.isNotEmpty) {
      for (final piquete in pickets) {
        if (piquete.nome != picketAcessado?.nome) {
          await loadCochosPiquete('${piquete.nome}_troughs');
          List<TroughInfo> cochos = List.from(cochosPiquete);
          if (cochos.isNotEmpty) {
            for (final cocho in cochosPiquete) {
              if (cocho.codigo == codigoCocho) {
                cochoVinculado = true;
                break;
              }
            }
          }
        }
      }
      if (!cochoVinculado) {
        for (final cocho in troughs) {
          if (cocho.codigo == codigoCocho) {
            await loadCochosPiquete('${picketAcessado?.nome}_troughs');
            List<TroughInfo> cochos = List.from(cochosPiquete);
            if (isTroughLinked()) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Cocho já vinculado ao ${picketAcessado?.nome}! Tente vincular outro cocho.'),
                  duration: const Duration(seconds: 2),
                ),
              );
              return;
            }
            setState(() {
              cochos.add(cocho);
              GenericService<TroughInfo>(
                fromJson: TroughInfo.fromJson,
                toJson: (cochoInfo) => cochoInfo.toJson(),
              ).saveList(cochos, '${picketAcessado?.nome}_troughs');
            });
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Cocho vinculado a ${picketAcessado?.nome} com sucesso!'),
                duration: const Duration(seconds: 2),
              ),
            );
            break;
          }
        }
      } else {
        showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Confirmação',
                  style: GoogleFonts.kanit(),
                ),
                content: Text(
                    'O cocho já esta vinculado a outro piquete, tem certeza que deseja vincular ao ${picketAcessado?.nome} ?'),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      for (final cocho in troughs) {
                        if (cocho.codigo == codigoCocho) {
                          for (final piquete in pickets) {
                            if (piquete.nome != picketAcessado?.nome) {
                              await loadCochosPiquete(
                                  '${piquete.nome}_troughs');
                              for (final cochoPiquete in cochosPiquete) {
                                if (cochoPiquete.codigo == cocho.codigo) {
                                  List<TroughInfo> cochoList =
                                      List.from(cochosPiquete);
                                  cochoList.remove(cochoPiquete);
                                  GenericService<TroughInfo>(
                                    fromJson: TroughInfo.fromJson,
                                    toJson: (cochoInfo) => cochoInfo.toJson(),
                                  ).saveList(
                                      cochoList, '${piquete.nome}_troughs');
                                  await loadCochosPiquete(
                                      '${picketAcessado?.nome}_troughs');
                                  if (isTroughLinked()) {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Cocho já vinculado ao ${picketAcessado?.nome}! Tente vincular outro cocho.'),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                    return;
                                  }
                                  List<TroughInfo> cochos =
                                      List.from(cochosPiquete);
                                  setState(() {
                                    cochos.add(cocho);
                                    GenericService<TroughInfo>(
                                      fromJson: TroughInfo.fromJson,
                                      toJson: (cochoInfo) => cochoInfo.toJson(),
                                    ).saveList(cochos,
                                        '${picketAcessado?.nome}_troughs');
                                  });
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Cocho removido de ${piquete.nome} e vinculado a ${picketAcessado?.nome} com sucesso!'),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                  break;
                                }
                              }
                            }
                          }
                          break;
                        }
                      }
                    },
                    child: Text('SIM',
                        style: GoogleFonts.kanit(color: Colors.green)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Operação cancelada!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text('NÃO',
                        style: GoogleFonts.kanit(color: Colors.red)),
                  )
                ],
              );
            });
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
                onPressed: widget.back,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            'VINCULAR COCHO',
            style: GoogleFonts.kanit(
                color: const Color(0xFF2DBCB6),
                fontSize: MediaQuery.of(context).size.height * 0.04),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          CustomDropdownWidget(
              key: dropdownKey,
              text: 'SELECIONAR COCHO',
              list: troughs
                  .map((trough) => (trough as TroughInfo).codigo)
                  .toList(),
              onChanged: (newValue) {
                selectedTrough = newValue;
              }),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          ButtonDesign(action: vincularCocho, text: 'VINCULAR')
        ],
      ),
    );
  }
}
