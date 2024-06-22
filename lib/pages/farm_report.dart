import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/report_design.dart';

class FarmReport extends StatelessWidget {
  const FarmReport({super.key, required this.back});

  final void Function() back;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      Container(
        alignment: Alignment.centerLeft,
        child: IconButton(
            onPressed: back,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            )),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      Text(
        'RELATÓRIO',
        style: GoogleFonts.kanit(
            color: const Color(0xFF2DBCB6),
            fontSize: MediaQuery.of(context).size.width * 0.083),
      ),
      const SizedBox(height: 50),
      const ReportDesign(),
    ]);
  }
}
