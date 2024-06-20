import 'package:flutter/material.dart';
import 'package:tryber/models/farm_info.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/models/farm_box_design.dart';
import 'package:tryber/data/global_var.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmPage extends StatefulWidget {
  const FarmPage(this.novoCadastro,
      {super.key, required this.changeScreen, required this.abrirFazenda});

  final void Function(String) novoCadastro;
  final void Function(String) abrirFazenda;
  final void Function(String) changeScreen;

  @override
  State<StatefulWidget> createState() {
    return _FarmPageState();
  }
}

class _FarmPageState extends State<FarmPage> {
  late GenericService farmInfoService;
  List farms = usuarioLogado?.farms ?? [];

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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.1,
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.02,
                        MediaQuery.of(context).size.height * 0.015,
                        MediaQuery.of(context).size.height * 0.015,
                        0),
                    child: Transform.scale(
                      scale: MediaQuery.of(context).size.height * 0.0012,
                      child: IconButton(
                        onPressed: () {
                          widget.changeScreen('config-page');
                        },
                        icon: Icon(
                          Icons.account_circle,
                          size: MediaQuery.of(context).size.height * 0.055,
                        ),
                        color: const Color(0xFF4C5C65),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.013),
                    child: Text(
                      'FAZENDAS',
                      style: GoogleFonts.kanit(
                          color: const Color(0xFF2DBCB6),
                          fontSize: MediaQuery.of(context).size.width * 0.065),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.03),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final farmInfo in farms)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: FarmBoxDesign(
                            action: () {
                              widget.abrirFazenda('manage-farm');
                            },
                            icon: 'assets/images/casinha.png',
                            text: farmInfo.nome,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: constraints.maxWidth * 0.7, // 10% da largura disponível
                bottom:
                    constraints.maxHeight * 0.02, // 10% da altura disponível
              ),
              child: IconButton(
                onPressed: () {
                  widget.novoCadastro('register-farm');
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  size: MediaQuery.of(context).size.height * 0.09,
                ),
                color: const Color(0xFF2DBCB6),
              ),
            ),
          ],
        );
      },
    );
  }
}
