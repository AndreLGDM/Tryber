class FarmInfo {
  final String nome;
  final String descricao;
  final String localizacao;

  FarmInfo(this.nome, this.descricao, this.localizacao);

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'localizacao': localizacao,
    };
  }

  factory FarmInfo.fromJson(Map<String, dynamic> json) {
    return FarmInfo(
      json['nome'],
      json['descricao'],
      json['localizacao'],
    );
  }

  @override
  String toString() {
    return 'FarmInfo { nome: $nome, descricao: $descricao, localizacao: $localizacao }';
  }
}
