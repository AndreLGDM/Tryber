import 'package:flutter/material.dart';

class InputDesign extends StatelessWidget {
  const InputDesign({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: text,
          floatingLabelStyle: const TextStyle(color: Color(0xFF2DBCB6)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4C5C65)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF2DBCB6),
            ),
          ),
          disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF4C5C65))),
        ),
      ),
    );
  }
}
