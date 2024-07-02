import 'package:flutter/material.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';
import 'package:tryber/models/input_password.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/models/text_button_design.dart';
import 'package:tryber/Objects/user_info.dart';
import 'package:tryber/data/global_var.dart';
import 'package:tryber/extensions/context_extension.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(this.login, this.cadastrar, this.recuperar,
      {super.key, required this.selectedLocal});

  final Locale selectedLocal;
  final void Function(String) login;
  final void Function(String) cadastrar;
  final void Function(String) recuperar;

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  late GenericService userService;
  List users = [];

  @override
  void initState() {
    super.initState();
    userService = GenericService<UserInfo>(
        fromJson: UserInfo.fromJson, toJson: (userInfo) => userInfo.toJson());
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    List loadedUsers = await userService.loadList('users');
    setState(() {
      users = loadedUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var padding = screenSize.width * 0.1;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();

    void verificarLogin() {
      String email = emailController.text;
      String senha = senhaController.text;

      bool clienteEncontrado = false;
      for (var cliente in users) {
        if (cliente.email == email) {
          clienteEncontrado = true;
          if (cliente.senha == senha) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login bem-sucedido.'),
                duration: Duration(seconds: 2),
              ),
            );
            setState(() {
              usuarioLogado = cliente;
            });
            widget.login('farm-page');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Senha incorreta.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
          break;
        }
      }

      if (!clienteEncontrado) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('usuario não encontrado.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: screenSize.height * 0.1),
            Center(
              child: SizedBox(
                width: screenSize.width * 0.6,
                height: screenSize.height * 0.1,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            SizedBox(height: screenSize.height * 0.1),
            InputDesign(
                text: context.localizations.email, controller: emailController),
            SizedBox(height: screenSize.height * 0.05),
            InputPassword(context.localizations.senha,
                controller: senhaController),
            SizedBox(height: screenSize.height * 0.06),
            ButtonDesign(
                text: context.localizations.login, action: verificarLogin),
            SizedBox(height: screenSize.height * 0.02),
            TextButtonDesign(() {
              widget.recuperar('recovery-page');
            }, 'esqueceu_senha_login',
                text: context.localizations.esqueceuSenha),
            SizedBox(height: screenSize.height * 0.02),
            ButtonDesign(
                text: context.localizations.cadastrar,
                action: () {
                  widget.cadastrar('register-user');
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenSize.width * 0.05,
                  height: screenSize.width * 0.05,
                  child: Image.asset(
                    'assets/images/google_1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: TextButtonDesign(() {}, 'logar_google_login',
                      text: context.localizations.logarGoogle),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
