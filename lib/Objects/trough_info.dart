import 'package:tryber/Objects/animal_info.dart';

class TroughInfo {
  TroughInfo(this.codigo, this.descricao, this.numeroBaias, this.tipoRacao,
      this.animals);

  final String codigo;
  final String descricao;
  final String numeroBaias;
  final String tipoRacao;
  final List<AnimalInfo> animals;

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'descricao': descricao,
      'numeroBaias': numeroBaias,
      'tipoRacao': tipoRacao,
      'animals': animals,
    };
  }

  factory TroughInfo.fromJson(Map<String, dynamic> json) {
    return TroughInfo(
      json['codigo'],
      json['descricao'],
      json['numeroBaias'],
      json['tipoRacao'],
      (json['animals'] as List<dynamic>)
          .map((animalJson) => AnimalInfo.fromJson(animalJson))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'CochoInfo { codigo: $codigo, descricao: $descricao, numeroBaias: $numeroBaias, tipoRacao: $tipoRacao }';
  }
}
