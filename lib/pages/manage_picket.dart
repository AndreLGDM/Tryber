import 'package:flutter/material.dart';
import 'package:tryber/models/farm_box_design.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagePicket extends StatelessWidget {
  const ManagePicket(
      {super.key, required this.back, required this.changeScreen});

  final void Function(String) changeScreen;
  final void Function(String) back;

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
                child: IconButton(
                    onPressed: () {
                      back('picket-page');
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.013),
              child: Text(
                'GERENCIAR PIQUETES',
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
                    changeScreen('register-animal');
                  },
                  icon: 'assets/images/cow.png',
                  text: 'CADASTRAR ANIMAL'),
              const SizedBox(height: 30),
              FarmBoxDesign(
                  action: () {
                    changeScreen('register-trough');
                  },
                  icon: 'assets/images/cow_eating.png',
                  text: 'CADASTRAR COCHO'),
              const SizedBox(height: 30),
              FarmBoxDesign(
                  action: () {},
                  icon: 'assets/images/link.png',
                  text: 'VINCULAR ANIMAL'),
            ],
          ),
        ),
      ),
    ]);
  }
}
