class UserInfo {
  UserInfo(this.nome, this.sobrenome, this.email, this.telefone, this.senha,
      this.confirmarSenha);

  final String nome;
  final String sobrenome;
  final String email;
  final String telefone;
  final String senha;
  final String confirmarSenha;

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'sobrenome': sobrenome,
      'email': email,
      'telefone': telefone,
      'senha': senha,
      'confirmarSenha': confirmarSenha,
    };
  }
}
