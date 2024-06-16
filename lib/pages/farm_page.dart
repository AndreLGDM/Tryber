import 'package:flutter/material.dart';
import 'package:tryber/models/farm_info.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/models/quiz_design.dart';
import 'package:tryber/data/global_user.dart';
import 'package:tryber/models/user_info.dart';

class FarmPage extends StatefulWidget {
  const FarmPage(this.novoCadastro, this.abrirFazenda, {super.key});

  final void Function() novoCadastro;
  final void Function() abrirFazenda;

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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 5, 0),
                child: Transform.scale(
                  scale: 1,
                  child: const Icon(
                    Icons.account_circle,
                    size: 70,
                    color: Color(0xFF4C5C65),
                  ),
                ),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.03),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.8, // Defina a altura desejada aqui
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final farmInfo in farms)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: QuizDesign(
                            action: widget.abrirFazenda,
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
                onPressed: widget.novoCadastro,
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
