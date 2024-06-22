import 'package:tryber/Objects/animal_info.dart';
import 'package:tryber/Objects/trough_info.dart';

class PicketInfo {
  PicketInfo(this.nome, this.tamanho, this.descricao, this.tipo, this.animals,
      this.cochos);

  final String nome;
  final String tamanho;
  final String descricao;
  final String tipo;
  List<AnimalInfo> animals;
  List<TroughInfo> cochos;

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'tamanho': tamanho,
      'descricao': descricao,
      'tipo': tipo,
      'animals': animals,
      'cochos': cochos,
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
      (json['cochos'] as List<dynamic>)
          .map((cochoJson) => TroughInfo.fromJson(cochoJson))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'UserInfo { nome: $nome, tamanho: $tamanho, descricao: $descricao, tipo: $tipo}';
  }
}
