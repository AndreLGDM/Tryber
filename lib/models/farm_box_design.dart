import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmBoxDesign extends StatelessWidget {
  const FarmBoxDesign(
      {super.key,
      required this.icon,
      required this.text,
      required this.action});

  final String text;
  final String icon;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.16,
          width: MediaQuery.of(context).size.width * 0.9,
          child: OutlinedButton(
            onPressed: action,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF4C5C65),
                side: const BorderSide(width: 2.5, color: Color(0xFF4C5C65)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.025,
                      MediaQuery.of(context).size.height * 0.002,
                      0,
                      0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Image.asset(
                      icon,
                      fit: BoxFit.cover,
                      color: const Color(0xFF4C5C65),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1),
                    child: Text(
                      text,
                      style: GoogleFonts.kanit(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.0221),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
