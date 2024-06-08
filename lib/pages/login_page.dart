import 'package:flutter/material.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';
import 'package:tryber/models/input_password.dart';
import 'package:tryber/models/text_button_design.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var padding = screenSize.width * 0.1;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: screenSize.height * 0.1),
            Center(
              child: SizedBox(
                width: screenSize.width * 0.6,
                height: screenSize.height * 0.1,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            SizedBox(height: screenSize.height * 0.1),
            const InputDesign(text: 'Email'),
            SizedBox(height: screenSize.height * 0.05),
            const InputPassword(),
            SizedBox(height: screenSize.height * 0.06),
            const ButtonDesign(text: 'LOGIN'),
            SizedBox(height: screenSize.height * 0.02),
            const TextButtonDesign('esqueceu_senha_login',
                text: 'Esqueceu a Senha ?'),
            SizedBox(height: screenSize.height * 0.02),
            const ButtonDesign(text: 'CADASTRAR'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenSize.width * 0.05,
                  height: screenSize.width * 0.05,
                  child: Image.asset(
                    'assets/images/google_1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: TextButtonDesign('logar_google_login',
                      text: 'Logar com o Google'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
