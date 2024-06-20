import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/report_box_design.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key, required this.back});

  final void Function(String) back;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      Text(
        'RELATORIOS',
        style: GoogleFonts.kanit(
            color: const Color(0xFF2DBCB6),
            fontSize: MediaQuery.of(context).size.width * 0.083),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: ReportBoxDesign(
                  action: () {},
                  icon: 'assets/images/piquete.png',
                  text: 'Piquete dois bois',
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width *
              0.7, // 10% da largura disponível
          top: MediaQuery.of(context).size.height * 0.0001,
        ),
        child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/pdf.png',
              height: 80,
            )),
      )
    ]);
  }
}
