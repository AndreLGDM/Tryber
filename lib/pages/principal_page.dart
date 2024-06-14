import 'package:flutter/material.dart';
import 'package:tryber/models/quiz_design.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key, required this.changeScreen});

  final void Function(String) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.1,
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.height * 0.015,
              MediaQuery.of(context).size.height * 0.015,
              0),
          child: Transform.scale(
            scale: MediaQuery.of(context).size.height * 0.001,
            child: const Icon(
              Icons.account_circle,
              size: 70,
              color: Color(0xFF4C5C65),
            ),
          ),
        ),
      ),
      const SizedBox(height: 15),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              QuizDesign(
                  action: () {
                    changeScreen('edit-farm');
                  },
                  icon: 'assets/images/casinha.png',
                  text: 'EDITAR FAZENDA'),
              const SizedBox(height: 30),
              QuizDesign(
                  action: () {
                    changeScreen('report-page');
                  },
                  icon: 'assets/images/paper.png',
                  text: 'RELATORIOS'),
              const SizedBox(height: 30),
              QuizDesign(
                  action: () {
                    changeScreen('register-animal');
                  },
                  icon: 'assets/images/cow.png',
                  text: 'CADASTRAR ANIMAL'),
              const SizedBox(height: 30),
              QuizDesign(
                  action: () {},
                  icon: 'assets/images/cow_eating.png',
                  text: 'CADASTRAR COCHO'),
              const SizedBox(height: 30),
              QuizDesign(
                  action: () {},
                  icon: 'assets/images/tractor.png',
                  text: 'VINCULAR EQUIPAMENTO'),
              const SizedBox(height: 30),
              QuizDesign(
                  action: () {},
                  icon: 'assets/images/piquete.png',
                  text: 'ADCIONAR PIQUETE'),
            ],
          ),
        ),
      ),
    ]);
  }
}
