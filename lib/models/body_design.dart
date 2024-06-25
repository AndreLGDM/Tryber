import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:tryber/pages/config_page.dart';
import 'package:tryber/pages/edit_farm.dart';
import 'package:tryber/pages/farm_page.dart';
import 'package:tryber/pages/farm_report.dart';
import 'package:tryber/pages/login_page.dart';
import 'package:tryber/pages/manage_picket.dart';
import 'package:tryber/pages/picket_page.dart';
import 'package:tryber/pages/manage_farm.dart';
import 'package:tryber/pages/recovey_page.dart';
import 'package:tryber/pages/register_animal.dart';
import 'package:tryber/pages/register_farm.dart';
import 'package:tryber/pages/register_picket.dart';
import 'package:tryber/pages/register_trough.dart';
import 'package:tryber/pages/register_user.dart';
import 'package:tryber/pages/report_page.dart';
import 'package:tryber/pages/teste_api.dart';

class BodyDesign extends StatefulWidget {
  const BodyDesign({super.key});

  @override
  State<BodyDesign> createState() {
    return _BodyDesignState();
  }
}

class _BodyDesignState extends State<BodyDesign> {
  var activeScreen = 'login-screen';
  var previousScreen = '';

  void changeScreenWithParam(String text) {
    setState(() {
      previousScreen = activeScreen;
      activeScreen = text;
    });
  }

  void goBack() {
    setState(() {
      activeScreen = previousScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidgets = {
      'login-screen': LoginPage(
          changeScreenWithParam, changeScreenWithParam, changeScreenWithParam,
          selectedLocal: PlatformDispatcher.instance.locale),
      'register-user': RegisterUser(changeScreenWithParam, back: goBack),
      'recovery-page': RecoveyPage(back: goBack),
      'farm-page': FarmPage(changeScreenWithParam,
          changeScreen: changeScreenWithParam,
          abrirFazenda: changeScreenWithParam),
      'register-farm': RegisterFarm(changeScreenWithParam, back: goBack),
      'manage-farm': ManageFarm(changeScreen: changeScreenWithParam),
      'edit-farm': EditFarm(back: goBack),
      'register-animal': RegisterAnimal(changeScreenWithParam, back: goBack),
      'register-trough': RegisterTrough(back: goBack),
      'register-picket': RegisterPicket(back: goBack),
      'picket-page': PicketPage(changeScreenWithParam,
          back: goBack, novoCadastro: changeScreenWithParam),
      'report-page': ReportPage(back: goBack),
      'farm-report': FarmReport(back: goBack),
      'manage-picket':
          ManagePicket(back: goBack, changeScreen: changeScreenWithParam),
      'config-page': ConfigPage(back: goBack),
      'teste-api': TesteApi(back: goBack),
    };

    Widget screenWidget = screenWidgets[activeScreen] ??
        LoginPage(
            changeScreenWithParam, changeScreenWithParam, changeScreenWithParam,
            selectedLocal: PlatformDispatcher.instance.locale);

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
