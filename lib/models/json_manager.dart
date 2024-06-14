import 'dart:convert';
import 'dart:io';

import 'package:tryber/models/farm_info.dart';

class JsonManager {
  static Future<List<FarmInfo>> carregarFazendasDoJSON(String filePath) async {
    File file = File(filePath);
    if (await file.exists()) {
      String jsonString = await file.readAsString();
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((item) =>
              FarmInfo(item['nome'], item['descricao'], item['localizacao']))
          .toList();
    } else {
      return [];
    }
  }

  static Future<void> adicionarFazendaAoJSON(
      String filePath, FarmInfo novaFazenda) async {
    List<FarmInfo> fazendas = await carregarFazendasDoJSON(filePath);
    fazendas.add(novaFazenda);
    List<dynamic> jsonList = fazendas.map((farm) => farm.toJson()).toList();
    String jsonString = json.encode(jsonList);
    File file = File(filePath);
    await file.writeAsString(jsonString);
  }
}
