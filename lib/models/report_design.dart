import 'package:flutter/material.dart';

class ReportDesign extends StatelessWidget {
  const ReportDesign({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
