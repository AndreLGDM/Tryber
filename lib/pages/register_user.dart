import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryber/models/input_design.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_password.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/Objects/user_info.dart';
import 'package:tryber/data/global_var.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser(this.cadastrado, {super.key, required this.back});

  final void Function(String) cadastrado;
  final void Function() back;

  @override
  State<RegisterUser> createState() {
    return _RegisterUserState();
  }
}

class _RegisterUserState extends State<RegisterUser> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  List users = usuarioLogado?.farms ?? [];
  late GenericService userInfoService;

  @override
  void initState() {
    super.initState();
    userInfoService = GenericService<UserInfo>(
      fromJson: UserInfo.fromJson,
      toJson: (userInfo) => userInfo.toJson(),
    );
    loadUsers();
  }

  Future<void> loadUsers() async {
    List loadedUsers = await userInfoService.loadList('users');
    setState(() {
      users = loadedUsers;
    });
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return false;
    }

    final validDomains = [
      'gmail.com',
      'yahoo.com',
      'hotmail.com',
      'outlook.com',
      'live.com',
      'icloud.com',
      'aol.com',
      'mail.com',
      'protonmail.com',
      'yandex.com',
      'zoho.com',
      'gmx.com',
      'tutanota.com',
      'fastmail.com',
      'unipampa.edu.br',
      'usp.br',
      'unicamp.br',
      'ufrgs.br',
      'ufrj.br',
      'ufmg.br',
      'ufscar.br',
      'ufc.br',
      'ufpe.br',
      'ifsc.edu.br',
      'ifsp.edu.br',
      'udesc.br',
      'pucsp.br',
      'pucrs.br',
      'uff.br',
      'unb.br'
    ];

    final domain = email.split('@')[1];
    if (!validDomains.contains(domain)) {
      return false;
    }
    return true;
  }

  bool isEmailRegistered(String email) {
    String email = emailController.text;
    for (var user in users) {
      if (user.email == email) {
        return true;
      }
      break;
    }
    return false;
  }

  bool isValidPhoneNumber(String phoneNumber) {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (phoneNumber.length != 11) {
      return false;
    }

    String ddd = phoneNumber.substring(0, 2);

    // Lista de DDDs válidos para o Brasil
    List<String> validDDDs = [
      // Centro-Oeste
      '61', '62', '64', '65', '66', '67',
      // Nordeste
      '82', '71', '73', '74', '75', '77', '85', '88', '98', '99', '83', '81',
      '87', '86', '89', '84', '79',
      // Norte
      '68', '96', '92', '97', '91', '93', '94', '69', '95', '63',
      // Sudeste
      '27', '28', '31', '32', '33', '34', '35', '37', '38', '21', '22', '24',
      '11', '12', '13', '14', '15', '16', '17', '18', '19',
      // Sul
      '41', '42', '43', '44', '45', '46', '51', '53', '54', '55', '47', '48',
      '49'
    ];

    if (!validDDDs.contains(ddd)) {
      return false;
    }

    String numeroSemDDD = phoneNumber.substring(2);
    if (!numeroSemDDD.startsWith('9')) {
      return false;
    }

    return true;
  }

  bool isStrongPassword(String password) {
    // Deve conter ao menos um símbolo, uma letra maiúscula e um número
    final symbolRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final uppercaseRegex = RegExp(r'[A-Z]');
    final numberRegex = RegExp(r'\d');

    return password.length >= 6 &&
        symbolRegex.hasMatch(password) &&
        uppercaseRegex.hasMatch(password) &&
        numberRegex.hasMatch(password);
  }

  void cadastrarCliente() {
    final String nome = nomeController.text.trim();
    final String sobrenome = sobrenomeController.text.trim();
    final String email = emailController.text.trim();
    final String telefone = telefoneController.text.trim();
    final String senha = senhaController.text;
    final String confirmarSenha = confirmarSenhaController.text;
    final int id = users.length + 1;

    if (nome.isEmpty ||
        sobrenome.isEmpty ||
        email.isEmpty ||
        telefone.isEmpty ||
        senha.isEmpty ||
        confirmarSenha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (senha != confirmarSenha) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('As senhas não coincidem.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (!isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, insira um e-mail válido.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (isEmailRegistered(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'E-mail já cadastrado. Por favor, use outro e-mail ou tente fazer o login.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (!isStrongPassword(senha)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'A senha deve conter pelo menos 6 dígitos incluindo ao menos um símbolo, uma letra maiúscula e um número.'),
          duration: Duration(seconds: 3, milliseconds: 5),
        ),
      );
      return;
    }

    if (!isValidPhoneNumber(telefone)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Por favor, insira um número de telefone válido para o Brasil incluindo o DDD.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (nome.toLowerCase() == sobrenome.toLowerCase()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('O sobrenome deve ser diferente do nome.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    List<UserInfo> usuarios = List.from(users);
    usuarios.add(UserInfo(id, nome, sobrenome, email, telefone, senha, []));
    GenericService<UserInfo>(
            toJson: (userInfo) => userInfo.toJson(),
            fromJson: UserInfo.fromJson)
        .saveList(usuarios, 'users');

    widget.cadastrado('login-page');

    // Limpa os campos após o cadastro
    nomeController.clear();
    sobrenomeController.clear();
    emailController.clear();
    telefoneController.clear();
    senhaController.clear();
    confirmarSenhaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: widget.back,
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
