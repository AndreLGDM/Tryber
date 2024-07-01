import 'package:tryber/Objects/farm_info.dart';

class UserInfo {
  final int id;
  final String nome;
  final String sobrenome;
  final String email;
  final String telefone;
  final String senha;
  List<FarmInfo> farms;
  final String objectType = 'user';

  UserInfo(this.id, this.nome, this.sobrenome, this.email, this.telefone,
      this.senha, this.farms);

  Map<String, dynamic> toJson() {
    return {
      'objectType': objectType,
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'email': email,
      'telefone': telefone,
      'senha': senha,
      'farms': farms.map((farm) => farm.toJson()).toList(),
    };
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      json['id'],
      json['nome'],
      json['sobrenome'],
      json['email'],
      json['telefone'],
      json['senha'],
      (json['farms'] as List<dynamic>)
          .map((farmJson) => FarmInfo.fromJson(farmJson))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'UserInfo { nome: $nome, sobrenome: $sobrenome, email: $email, telefone: $telefone}';
  }
}
