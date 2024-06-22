import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';

class RecoveyPage extends StatelessWidget {
  const RecoveyPage({super.key, required this.back});

  final void Function() back;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Container(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: () {
                back();
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30,
              )),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.11),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        const InputDesign(text: 'Email de recuperação'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.07),
        ButtonDesign(text: 'CONFIRMAR', action: () {}),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Text('Confirmar pelo celular', style: GoogleFonts.kanit())
      ]),
    );
  }
}
