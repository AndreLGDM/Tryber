import 'dart:convert';
import 'dart:io';
import 'package:tryber/models/farm_info.dart';
import 'package:path_provider/path_provider.dart';

class FarmInfoService {
  Future<void> saveFarmInfoList(List<FarmInfo> farmInfoList) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File jsonFile = File('${appDocDir.path}/farm_info.json');
    List<Map<String, dynamic>> jsonList =
        farmInfoList.map((farmInfo) => farmInfo.toJson()).toList();
    await jsonFile.writeAsString(jsonEncode(jsonList));
  }

  Future<List<FarmInfo>> loadFarmInfoList() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File jsonFile = File('${appDocDir.path}/farm_info.json');
    if (await jsonFile.exists()) {
      String jsonString = await jsonFile.readAsString();
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => FarmInfo.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> deleteFarmInfo(FarmInfo farmInfoToDelete) async {
    List<FarmInfo> currentList = await loadFarmInfoList();
    currentList.removeWhere((farmInfo) =>
        farmInfo.nome ==
        farmInfoToDelete
            .nome); // Aqui você pode ajustar a condição de comparação conforme necessário
    await saveFarmInfoList(currentList);
  }
}
