import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

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
      child: TextFormField(
        obscureText: isObscure,
        decoration: const InputDecoration(
          labelText: 'Senha',
          floatingLabelStyle: TextStyle(color: Color(0xFF2DBCB6)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4C5C65)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2DBCB6)),
          ),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF4C5C65))),
        ),
      ),
    );
  }
}
