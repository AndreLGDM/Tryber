import 'package:tryber/Objects/picket_info.dart';
import 'package:tryber/Objects/trough_info.dart';

class FarmInfo {
  final String nome;
  final String descricao;
  final String localizacao;
  final String objectType = 'farm';
  List<PicketInfo> pickets;
  List<TroughInfo> cochos;

  FarmInfo(
      this.nome, this.descricao, this.localizacao, this.pickets, this.cochos);

  Map<String, dynamic> toJson() {
    return {
      'objectType': objectType,
      'nome': nome,
      'descricao': descricao,
      'localizacao': localizacao,
      'pickets': pickets.map((pickets) => pickets.toJson()).toList(),
      'cochos': cochos.map((cochos) => cochos.toJson()).toList(),
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
      (json['cochos'] as List<dynamic>)
          .map((cochoJson) => TroughInfo.fromJson(cochoJson))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'FarmInfo { nome: $nome, descricao: $descricao, localizacao: $localizacao }';
  }
}
