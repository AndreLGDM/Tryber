import 'package:flutter/material.dart';
import 'package:tryber/pages/cellphone_confirmation_page.dart';
import 'package:tryber/pages/farm_page.dart';
import 'package:tryber/pages/login_page.dart';
import 'package:tryber/pages/mail_confirmation_page.dart';
import 'package:tryber/pages/principal_page.dart';
import 'package:tryber/pages/recovey_page.dart';
import 'package:tryber/pages/register_animal.dart';
import 'package:tryber/pages/register_farm_page.dart';
import 'package:tryber/pages/register_picket.dart';
import 'package:tryber/pages/register_trough.dart';

class BodyDesign extends StatelessWidget {
  const BodyDesign({super.key});

  @override
  Widget build(BuildContext context) {
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
              height: 65,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFFFFFFF),
                child: const RegisterAnimal(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
