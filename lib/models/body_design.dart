import 'package:flutter/material.dart';
import 'package:tryber/pages/farm_page.dart';
import 'package:tryber/pages/login_page.dart';
import 'package:tryber/pages/register_farm.dart';
import 'package:tryber/pages/register_picket.dart';
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

  void navegarCadastrarFazenda() {
    setState(() {
      activeScreen = 'register-page';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = activeScreen == 'login-screen'
        ? LoginPage(login)
        : activeScreen == 'farm-page'
            ? FarmPage(navegarCadastrarFazenda)
            : const RegisterFarm();
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
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
        ),
      ),
    );
  }
}
