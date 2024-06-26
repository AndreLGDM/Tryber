import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/data/global_var.dart';
import 'package:tryber/models/farm_box_design.dart';
import 'package:tryber/Objects/picket_info.dart';

class PicketPage extends StatefulWidget {
  const PicketPage(this.changeScreen,
      {super.key, required this.novoCadastro, required this.back});

  final void Function(String) novoCadastro;
  final void Function() back;
  final void Function(String) changeScreen;

  @override
  State<PicketPage> createState() {
    return _PicketPageState();
  }
}

class _PicketPageState extends State<PicketPage> {
  late GenericService picketInfoService;
  List pickets = fazendaAcessada?.pickets ?? [];

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
    List loadedpickets =
        await picketInfoService.loadList('${fazendaAcessada?.nome}_pickets');
    setState(() {
      pickets = loadedpickets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
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
            SizedBox(height: constraints.maxHeight * 0.15),
            Text(
              'PIQUETES',
              style: GoogleFonts.kanit(
                  color: const Color(0xFF2DBCB6), fontSize: 36),
            ),
            SizedBox(height: constraints.maxHeight * 0.08),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.8, // Defina a altura desejada aqui
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final picketInfo in pickets)
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0,
                              MediaQuery.of(context).size.height * 0.018),
                          child: FarmBoxDesign(
                            action: () {
                              setState(() {
                                picketAcessado = picketInfo;
                              });
                              widget.changeScreen('manage-picket');
                            },
                            icon: 'assets/images/piquete.png',
                            text: picketInfo.nome,
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
                  widget.novoCadastro('register-picket');
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
