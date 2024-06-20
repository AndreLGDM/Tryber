import 'package:tryber/models/picket_info.dart';

class FarmInfo {
  final String nome;
  final String descricao;
  final String localizacao;
  List<PicketInfo> pickets;

  FarmInfo(this.nome, this.descricao, this.localizacao, this.pickets);

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'localizacao': localizacao,
      'pickets': pickets.map((pickets) => pickets.toJson()).toList(),
    };
  }

  factory FarmInfo.fromJson(Map<String, dynamic> json) {
    return FarmInfo(
      json['nome'],
      json['descricao'],
      json['localizacao'],
      (json['pickets'] as List<dynamic>)
          .map((picketJson) => PicketInfo.fromJson(picketJson))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'FarmInfo { nome: $nome, descricao: $descricao, localizacao: $localizacao }';
  }
}
