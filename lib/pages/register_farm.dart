import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/data/list_manipulate.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';

class RegisterFarm extends StatefulWidget {
  const RegisterFarm(this.changePage, {super.key});

  final void Function() changePage;

  @override
  State<StatefulWidget> createState() {
    return _RegisterFarmState();
  }
}

class _RegisterFarmState extends State<RegisterFarm> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController localizacaoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void cadastrarFazenda() {
      final String nome = nomeController.text;
      final String descricao = descricaoController.text;
      final String localizacao = localizacaoController.text;

      if (nome.isNotEmpty && descricao.isNotEmpty && localizacao.isNotEmpty) {
        setState(() {
          addFarm(nome, descricao, localizacao);
          widget.changePage();
        });

        nomeController.clear();
        descricaoController.clear();
        localizacaoController.clear();
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            'CADASTRAR FAZENDA',
            style:
                GoogleFonts.kanit(color: const Color(0xFF2DBCB6), fontSize: 36),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          InputDesign(text: 'NOME', controller: nomeController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(
            text: 'DESCRIÇÃO',
            controller: descricaoController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(
            text: 'LOCALIZAÇÃO',
            controller: localizacaoController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.195),
          ButtonDesign(text: 'CADASTRAR', action: cadastrarFazenda)
        ],
      ),
    );
  }
}
