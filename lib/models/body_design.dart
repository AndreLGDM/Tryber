import 'package:flutter/material.dart';
import 'package:tryber/pages/edit_farm.dart';
import 'package:tryber/pages/farm_page.dart';
import 'package:tryber/pages/login_page.dart';
import 'package:tryber/pages/picket_page.dart';
import 'package:tryber/pages/principal_page.dart';
import 'package:tryber/pages/recovey_page.dart';
import 'package:tryber/pages/register_animal.dart';
import 'package:tryber/pages/register_farm.dart';
import 'package:tryber/pages/register_picket.dart';
import 'package:tryber/pages/register_trough.dart';
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

  void navegarCadastrarPicket() {
    setState(() {
      activeScreen = 'register-picket';
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

  void changeScreenWithParam(String text) {
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
    final screenWidgets = {
      'login-screen': LoginPage(login, cadastrarCliente, recuperacaoSenha),
      'register-user':
          RegisterUser(clienteCadastrado, back: changeScreenWithParam),
      'recovery-page': RecoveyPage(back: changeScreenWithParam),
      'farm-page': FarmPage(navegarCadastrarFazenda, clicarFazenda),
      'register-farm':
          RegisterFarm(cadastrarFazenda, back: changeScreenWithParam),
      'principal-page': PrincipalPage(changeScreen: changeScreenWithParam),
      'edit-farm': EditFarm(back: changeScreenWithParam),
      'register-animal':
          RegisterAnimal(clicarFazenda, back: changeScreenWithParam),
      'register-trough': RegisterTrough(back: changeScreenWithParam),
      'register-picket': RegisterPicket(back: changeScreenWithParam),
      'picket-page':
          PicketPage(back: changeScreenWithParam, navegarCadastrarPicket),
    };

    Widget screenWidget = screenWidgets[activeScreen] ??
        LoginPage(login, cadastrarCliente, recuperacaoSenha);

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
