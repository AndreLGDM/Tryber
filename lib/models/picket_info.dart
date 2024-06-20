import 'package:tryber/models/animal_info.dart';

class PicketInfo {
  PicketInfo(this.nome, this.tamanho, this.descricao, this.tipo, this.animals);

  final String nome;
  final String tamanho;
  final String descricao;
  final String tipo;
  List<AnimalInfo> animals;

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'tamanho': tamanho,
      'descricao': descricao,
      'tipo': tipo,
      'animals': animals,
    };
  }

  factory PicketInfo.fromJson(Map<String, dynamic> json) {
    return PicketInfo(
      json['nome'],
      json['tamanho'],
      json['descricao'],
      json['tipo'],
      (json['animals'] as List<dynamic>)
          .map((animalJson) => AnimalInfo.fromJson(animalJson))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'UserInfo { nome: $nome, tamanho: $tamanho, descricao: $descricao, tipo: $tipo}';
  }
}
