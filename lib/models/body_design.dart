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

class BodyDesign extends StatefulWidget {
  const BodyDesign({super.key});

  @override
  State<BodyDesign> createState() {
    return _BodyDesignState();
  }
}

class _BodyDesignState extends State<BodyDesign> {
  var activeScreen = 'login-screen';

  void changeScreenWithParam(String text) {
    setState(() {
      activeScreen = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidgets = {
      'login-screen': LoginPage(
          changeScreenWithParam, changeScreenWithParam, changeScreenWithParam,
          selectedLocal: PlatformDispatcher.instance.locale),
      'register-user':
          RegisterUser(changeScreenWithParam, back: changeScreenWithParam),
      'recovery-page': RecoveyPage(back: changeScreenWithParam),
      'farm-page': FarmPage(changeScreenWithParam,
          changeScreen: changeScreenWithParam,
          abrirFazenda: changeScreenWithParam),
      'register-farm':
          RegisterFarm(changeScreenWithParam, back: changeScreenWithParam),
      'manage-farm': ManageFarm(changeScreen: changeScreenWithParam),
      'edit-farm': EditFarm(back: changeScreenWithParam),
      'register-animal':
          RegisterAnimal(changeScreenWithParam, back: changeScreenWithParam),
      'register-trough': RegisterTrough(back: changeScreenWithParam),
      'register-picket': RegisterPicket(back: changeScreenWithParam),
      'picket-page': PicketPage(changeScreenWithParam,
          back: changeScreenWithParam, novoCadastro: changeScreenWithParam),
      'report-page': ReportPage(back: changeScreenWithParam),
      'farm-report': FarmReport(back: changeScreenWithParam),
      'manage-picket': ManagePicket(
          back: changeScreenWithParam, changeScreen: changeScreenWithParam),
      'config-page': const ConfigPage(),
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
