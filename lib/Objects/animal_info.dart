class AnimalInfo {
  AnimalInfo(this.tipo, this.subtipo, this.idBrinco, this.peso);

  final String tipo;
  final String subtipo;
  final String idBrinco;
  final String objectType = 'animal';
  final String peso;

  Map<String, dynamic> toJson() {
    return {
      'objectType': objectType,
      'tipo': tipo,
      'subtipo': subtipo,
      'idBrinco': idBrinco,
      'peso': peso,
    };
  }

  factory AnimalInfo.fromJson(Map<String, dynamic> json) {
    return AnimalInfo(
      json['tipo'],
      json['subtipo'],
      json['idBrinco'],
      json['peso'],
    );
  }

  @override
  String toString() {
    return 'AnimalInfo { tipo: $tipo, subtipo: $subtipo, idBrinco: $idBrinco, peso: $peso }';
  }
}
