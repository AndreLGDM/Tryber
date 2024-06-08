import 'package:flutter/material.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';
import 'package:tryber/models/text_button_design.dart';

class CellphoneConfirmationPage extends StatelessWidget {
  const CellphoneConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(height: 86),
        Center(
          child: SizedBox(
            width: 232,
            height: 81,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        const SizedBox(height: 50),
        SizedBox(
          width: 296,
          height: 180,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF2DBCB6), width: 2.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                  'Enviamos um sms de\nconfirmação\npara (55)95555-5555',
                  textAlign: TextAlign.center),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const InputDesign(text: 'Código de confirmação'),
        const SizedBox(height: 50),
        const ButtonDesign(text: 'CONFIRMAR'),
        const SizedBox(height: 20),
        const TextButtonDesign('button_confirmar_pelo_celular',
            text: 'Confirmar pelo celular')
      ]),
    );
  }
}
