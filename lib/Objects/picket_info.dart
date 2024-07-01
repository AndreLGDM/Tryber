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
  final String objectType = 'picket';
  List<TroughInfo> cochos;

  Map<String, dynamic> toJson() {
    return {
      'objectType': objectType,
      'nome': nome,
      'tamanho': tamanho,
      'descricao': descricao,
      'tipo': tipo,
      'animals': animals.map((animals) => animals.toJson()).toList(),
      'cochos': cochos.map((cochos) => cochos.toJson()).toList(),
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
