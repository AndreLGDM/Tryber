import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  const InputPassword(this.text, {super.key, required this.controller});

  final String text;
  final TextEditingController? controller;

  @override
  State<InputPassword> createState() {
    return _InputPasswordState();
  }
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    bool isObscure = true;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: DefaultTextEditingShortcuts(
        child: TextFormField(
          cursorColor: const Color(0xFF2DBCB6),
          cursorWidth: MediaQuery.of(context).size.width * 0.002,
          controller: widget.controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            labelText: widget.text,
            floatingLabelStyle: const TextStyle(color: Color(0xFF2DBCB6)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF4C5C65)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF2DBCB6)),
            ),
            disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4C5C65))),
          ),
        ),
      ),
    );
  }
}
