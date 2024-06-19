class AnimalInfo {
  AnimalInfo(this.tipo, this.subtipo, this.idBrinco, this.peso);

  final String tipo;
  final String subtipo;
  final String idBrinco;
  final String peso;

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'subtipo': subtipo,
      'idBrinco': idBrinco,
      'peso': peso,
    };
  }

  @override
  String toString() {
    return 'AnimalInfo { tipo: $tipo, subtipo: $subtipo, idBrinco: $idBrinco, peso: $peso }';
  }
}
