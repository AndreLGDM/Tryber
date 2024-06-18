import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportBoxDesign extends StatelessWidget {
  const ReportBoxDesign(
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
          height: MediaQuery.of(context).size.height * 0.11,
          width: MediaQuery.of(context).size.width * 0.85,
          child: OutlinedButton(
            onPressed: action,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF4C5C65),
                side: const BorderSide(width: 2.5, color: Color(0xFF4C5C65)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.085,
                  child: Image.asset(
                    icon,
                    fit: BoxFit.cover,
                    color: const Color(0xFF4C5C65),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      text,
                      style: GoogleFonts.kanit(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.01, 0, 0, 0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.14,
                    child: const FittedBox(
                      fit: BoxFit.cover,
                      child: Icon(
                        Icons.error_outline,
                        color: Color(0xFF2DBCB6),
                      ),
                    ),
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
