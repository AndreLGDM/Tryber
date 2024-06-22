import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key, required this.back});

  final void Function() back;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                child: Text(
                  'PERFIL',
                  style: GoogleFonts.kanit(
                      color: const Color(0xFF4C5C65),
                      fontSize: MediaQuery.of(context).size.width * 0.043),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.7,
                    MediaQuery.of(context).size.height * 0.015,
                    MediaQuery.of(context).size.height * 0.015,
                    0),
                child: IconButton(
                    onPressed: back,
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
