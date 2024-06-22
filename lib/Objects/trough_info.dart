class TroughInfo {
  TroughInfo(this.codigo, this.descricao, this.numeroBaias, this.tipoRacao);

  final String codigo;
  final String descricao;
  final String numeroBaias;
  final String tipoRacao;

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'descricao': descricao,
      'numeroBaias': numeroBaias,
      'tipoRacao': tipoRacao,
    };
  }

  factory TroughInfo.fromJson(Map<String, dynamic> json) {
    return TroughInfo(
      json['codigo'],
      json['descricao'],
      json['numeroBaias'],
      json['tipoRacao'],
    );
  }

  @override
  String toString() {
    return 'CochoInfo { codigo: $codigo, descricao: $descricao, numeroBaias: $numeroBaias, tipoRacao: $tipoRacao }';
  }
}
