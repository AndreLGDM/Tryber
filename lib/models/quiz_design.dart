import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizDesign extends StatelessWidget {
  const QuizDesign({super.key, required this.icon, required this.text});

  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.16,
          width: MediaQuery.of(context).size.width * 0.9,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF4C5C65),
                side: const BorderSide(width: 2.5, color: Color(0xFF4C5C65)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Image.asset(
                    icon,
                    fit: BoxFit.cover,
                    color: const Color(0xFF4C5C65),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.height * 0.0024, 0, 0, 0),
                  child: Text(
                    text,
                    style: GoogleFonts.kanit(
                        fontSize: MediaQuery.of(context).size.height * 0.023),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
