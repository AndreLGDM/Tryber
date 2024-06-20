import 'package:flutter/material.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.02,
                    MediaQuery.of(context).size.height * 0.015,
                    MediaQuery.of(context).size.height * 0.015,
                    0),
                child: Transform.scale(
                  scale: MediaQuery.of(context).size.height * 0.0012,
                  child: const Icon(
                    Icons.account_circle,
                    size: 70,
                    color: Color(0xFF4C5C65),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
