class AnimalInfo {
  AnimalInfo(this.tipo, this.idBrinco, this.peso);

  final String tipo;
  final String idBrinco;
  final String peso;

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'idBrinco': idBrinco,
      'peso': peso,
    };
  }
}
