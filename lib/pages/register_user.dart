import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/data/list_manipulate.dart';
import 'package:tryber/models/input_design.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_password.dart';

class RegisterUser extends StatelessWidget {
  RegisterUser(this.cadastrado, {super.key});

  final void Function() cadastrado;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    void cadastrarCliente() {
      final String nome = nomeController.text;
      final String sobrenome = sobrenomeController.text;
      final String email = emailController.text;
      final String telefone = telefoneController.text;
      final String senha = senhaController.text;
      final String confirmarSenha = confirmarSenhaController.text;

      if (nome.isNotEmpty &&
          sobrenome.isNotEmpty &&
          email.isNotEmpty &&
          telefone.isNotEmpty &&
          senha.isNotEmpty &&
          confirmarSenha.isNotEmpty) {
        if (senha == confirmarSenha) {
          addUser(nome, sobrenome, email, telefone, senha, confirmarSenha);
          cadastrado();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('As senhas não coincidem.'),
              duration: Duration(seconds: 2), // Duração da mensagem
            ),
          );
        }

        nomeController.clear();
        sobrenomeController.clear();
        emailController.clear();
        telefoneController.clear();
        senhaController.clear();
        confirmarSenhaController.clear();
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
            'CRIAR CONTA',
            style:
                GoogleFonts.kanit(color: const Color(0xFF2DBCB6), fontSize: 36),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          InputDesign(text: 'NOME', controller: nomeController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(text: 'SOBRENOME', controller: sobrenomeController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(text: 'EMAIL', controller: emailController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputDesign(text: 'TELEFONE', controller: telefoneController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputPassword('SENHA', controller: senhaController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          InputPassword('CONFIRMAR SENHA',
              controller: confirmarSenhaController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ButtonDesign(text: 'CONFIRMAR', action: cadastrarCliente)
        ],
      ),
    );
  }
}
