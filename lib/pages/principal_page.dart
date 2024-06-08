import 'package:flutter/material.dart';
import 'package:tryber/models/quiz_design.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 86,
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
      const SizedBox(height: 15),
      Expanded(
        child: SingleChildScrollView(
          child: Container(
            child: const Column(
              children: [
                QuizDesign(
                    icon: 'assets/images/casinha.png', text: 'EDITAR FAZENDA'),
                SizedBox(height: 30),
                QuizDesign(icon: 'assets/images/paper.png', text: 'RELATORIOS'),
                SizedBox(height: 30),
                QuizDesign(
                    icon: 'assets/images/cow.png', text: 'CADASTRAR ANIMAL'),
                SizedBox(height: 30),
                QuizDesign(
                    icon: 'assets/images/cow_eating.png',
                    text: 'CADASTRAR COCHO'),
                SizedBox(height: 30),
                QuizDesign(
                    icon: 'assets/images/tractor.png',
                    text: 'VINCULAR EQUIPAMENTO'),
                SizedBox(height: 30),
                QuizDesign(
                    icon: 'assets/images/piquete.png',
                    text: 'ADCIONAR PIQUETE'),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
