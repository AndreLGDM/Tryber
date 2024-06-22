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
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
        Locale('es', 'ES'),
        Locale('fr', 'FR'),
        Locale('ar', 'AE'),
        Locale('bn', 'BD'),
        Locale('de', 'DE'),
        Locale('hi', 'IN'),
        Locale('id', 'ID'),
        Locale('it', 'IT'),
        Locale('ja', 'JP'),
        Locale('ko', 'KR'),
        Locale('ms', 'MY'),
        Locale('ru', 'RU'),
        Locale('th', 'TH'),
        Locale('tr', 'TR'),
        Locale('vi', 'VN'),
        Locale('zh', 'CN'),
      ],
      locale: PlatformDispatcher.instance.locale,
      home: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: BodyDesign(),
      ),
    ),
  );
}
