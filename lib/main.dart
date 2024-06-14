import 'package:flutter/material.dart';
import 'package:tryber/models/body_design.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BodyDesign(),
      ),
    ),
  );
}
