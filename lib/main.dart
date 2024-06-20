import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tryber/models/body_design.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
        Locale('es', 'ES')
      ],
      locale: PlatformDispatcher
          .instance.locale, // Acessa o idioma atual do dispositivo
      home: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: BodyDesign(),
      ),
    ),
  );
}
