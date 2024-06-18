import 'package:flutter/material.dart';
import 'package:tryber/models/button_design.dart';
import 'package:tryber/models/input_design.dart';
import 'package:tryber/models/input_password.dart';
import 'package:tryber/Services/json_service.dart';
import 'package:tryber/models/text_button_design.dart';
import 'package:tryber/models/user_info.dart';
import 'package:tryber/data/global_var.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(this.login, this.cadastrar, this.recuperar, {super.key});

  final void Function() login;
  final void Function() cadastrar;
  final void Function() recuperar;

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
    List loadedUsers = await userService.loadList('user.json');
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
            widget.login();
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
            InputDesign(text: 'EMAIL', controller: emailController),
            SizedBox(height: screenSize.height * 0.05),
            InputPassword('SENHA', controller: senhaController),
            SizedBox(height: screenSize.height * 0.06),
            ButtonDesign(text: 'LOGIN', action: verificarLogin),
            SizedBox(height: screenSize.height * 0.02),
            TextButtonDesign(widget.recuperar, 'esqueceu_senha_login',
                text: 'Esqueceu a Senha ?'),
            SizedBox(height: screenSize.height * 0.02),
            ButtonDesign(text: 'CADASTRAR', action: widget.cadastrar),
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
                      text: 'Logar com o Google'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
