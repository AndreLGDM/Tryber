import 'package:flutter/material.dart';
import 'package:tryber/models/quiz_design.dart';

class FarmPage extends StatelessWidget {
  const FarmPage(this.novoCadastro, {super.key});

  final void Function() novoCadastro;

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
              child: Column(
                children: [
                  const QuizDesign(
                    icon: 'assets/images/casinha.png',
                    text: 'Fazenda Pedacin do Ceu',
                  ),
                  const Spacer(), // Usado para empurrar o ícone para o fim
                  Padding(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth *
                          0.7, // 10% da largura disponível
                      bottom: constraints.maxHeight *
                          0.1, // 10% da altura disponível
                    ),
                    child: IconButton(
                      onPressed: novoCadastro,
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: MediaQuery.of(context).size.height * 0.09,
                      ),
                      color: const Color(0xFF2DBCB6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
