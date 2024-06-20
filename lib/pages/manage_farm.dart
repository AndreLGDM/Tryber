import 'package:flutter/material.dart';
import 'package:tryber/models/farm_box_design.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageFarm extends StatelessWidget {
  const ManageFarm({super.key, required this.changeScreen});

  final void Function(String) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.1,
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
                scale: MediaQuery.of(context).size.height * 0.001,
                child: Icon(
                  Icons.account_circle,
                  size: MediaQuery.of(context).size.height * 0.055,
                  color: const Color(0xFF4C5C65),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.013),
              child: Text(
                'GERENCIAR FAZENDA',
                style: GoogleFonts.kanit(
                    color: const Color(0xFF2DBCB6),
                    fontSize: MediaQuery.of(context).size.width * 0.065),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FarmBoxDesign(
                  action: () {
                    changeScreen('edit-farm');
                  },
                  icon: 'assets/images/casinha.png',
                  text: 'EDITAR FAZENDA'),
              const SizedBox(height: 30),
              FarmBoxDesign(
                  action: () {
                    changeScreen('report-page');
                  },
                  icon: 'assets/images/paper.png',
                  text: 'RELATORIOS'),
              const SizedBox(height: 30),
              FarmBoxDesign(
                  action: () {
                    changeScreen('picket-page');
                  },
                  icon: 'assets/images/piquete.png',
                  text: 'PIQUETE'),
            ],
          ),
        ),
      ),
    ]);
  }
}
