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
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.07),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.82,
          height: MediaQuery.of(context).size.height * 0.22,
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        const InputDesign(text: 'Código de confirmação'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.075),
        ButtonDesign(text: 'CONFIRMAR', action: () {}),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        const TextButtonDesign('button_confirmar_pelo_celular',
            text: 'Confirmar pelo celular')
      ]),
    );
  }
}
