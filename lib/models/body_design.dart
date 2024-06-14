import 'package:flutter/material.dart';
import 'package:tryber/pages/farm_page.dart';
import 'package:tryber/pages/login_page.dart';
import 'package:tryber/pages/principal_page.dart';
import 'package:tryber/pages/recovey_page.dart';
import 'package:tryber/pages/register_farm.dart';
import 'package:tryber/pages/register_user.dart';

class BodyDesign extends StatefulWidget {
  const BodyDesign({super.key});

  @override
  State<BodyDesign> createState() {
    return _BodyDesignState();
  }
}

class _BodyDesignState extends State<BodyDesign> {
  var activeScreen = 'login-screen';

  void login() {
    setState(() {
      activeScreen = 'farm-page';
    });
  }

  void clienteCadastrado() {
    setState(() {
      activeScreen = 'login-screen';
    });
  }

  void cadastrarCliente() {
    setState(() {
      activeScreen = 'register-user';
    });
  }

  void navegarCadastrarFazenda() {
    setState(() {
      activeScreen = 'register-farm';
    });
  }

  void clicarFazenda() {
    setState(() {
      activeScreen = 'principal-page';
    });
  }

  void recuperacaoSenha() {
    setState(() {
      activeScreen = 'recovery-page';
    });
  }

  void voltarTela(String text) {
    setState(() {
      activeScreen = text;
    });
  }

  void cadastrarFazenda() {
    setState(() {
      activeScreen = 'farm-page';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = activeScreen == 'login-screen'
        ? LoginPage(login, cadastrarCliente, recuperacaoSenha)
        : activeScreen == 'register-user'
            ? RegisterUser(clienteCadastrado)
            : activeScreen == 'recovery-page'
                ? RecoveyPage(back: voltarTela)
                : activeScreen == 'farm-page'
                    ? FarmPage(navegarCadastrarFazenda, clicarFazenda)
                    : activeScreen == 'register-farm'
                        ? RegisterFarm(cadastrarFazenda)
                        : const PrincipalPage();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/margem.png',
          height: MediaQuery.of(context).size.height * 0.065,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: Container(
            color: const Color(0xFFFFFFFF),
            child: screenWidget,
          ),
        ),
      ],
    );
  }
}
