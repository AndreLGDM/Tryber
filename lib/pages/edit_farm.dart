import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';

class EditFarm extends StatelessWidget {
  EditFarm({super.key, required this.back});

  final void Function(String) back;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController localizacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  back('principal-page');
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            'EDITAR FAZENDA',
            style:
                GoogleFonts.kanit(color: const Color(0xFF2DBCB6), fontSize: 36),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: InputDesign(text: 'NOME', controller: nomeController),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Icon(Icons.edit),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: InputDesign(
                    text: 'DESCRIÇÃO', controller: descricaoController),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Icon(Icons.edit),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: InputDesign(
                    text: 'LOCALIZAÇÃO', controller: localizacaoController),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Icon(Icons.edit),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.195),
          ButtonDesign(text: 'SALVAR', action: () {})
        ],
      ),
    );
  }
}
