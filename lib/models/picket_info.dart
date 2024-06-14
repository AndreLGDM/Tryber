class PicketInfo {
  PicketInfo(this.nome, this.tamanho, this.descricao, this.tipo);

  final String nome;
  final String tamanho;
  final String descricao;
  final String tipo;

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'tamanho': tamanho,
      'descricao': descricao,
      'tipo': tipo,
    };
  }

  @override
  String toString() {
    return 'UserInfo { nome: $nome, tamanho: $tamanho, descricao: $descricao, tipo: $tipo}';
  }
}
