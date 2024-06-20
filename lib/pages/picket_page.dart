import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/farm_box_design.dart';
import 'package:tryber/data/list_manipulate.dart';

class PicketPage extends StatelessWidget {
  const PicketPage(this.changeScreen,
      {super.key, required this.novoCadastro, required this.back});

  final void Function(String) novoCadastro;
  final void Function(String) back;
  final void Function(String) changeScreen;

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
                  onPressed: () {
                    back('manage-farm');
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            SizedBox(height: constraints.maxHeight * 0.15),
            Text(
              'PIQUETE',
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
                      for (final PicketInfo in pickets)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: FarmBoxDesign(
                            action: () {
                              changeScreen('manage-picket');
                            },
                            icon: 'assets/images/piquete.png',
                            text: PicketInfo.nome,
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
                  novoCadastro('register-picket');
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
