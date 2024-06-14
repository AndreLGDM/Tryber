class FarmInfo {
  FarmInfo(this.nome, this.descricao, this.localizacao);

  final String nome;
  final String descricao;
  final String localizacao;

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'localizacao': localizacao,
    };
  }

  @override
  String toString() {
    return 'FarmInfo { nome: $nome, descricao: $descricao, localizacao: $localizacao }';
  }
}
