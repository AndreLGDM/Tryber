import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class GenericService<T> {
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  GenericService({required this.fromJson, required this.toJson});

  Future<void> saveList(List<T> itemList, String fileName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File jsonFile = File('${appDocDir.path}/$fileName.json');
    List<Map<String, dynamic>> jsonList =
        itemList.map((item) => toJson(item)).toList();
    await jsonFile.writeAsString(jsonEncode(jsonList));
  }

  Future<List<T>> loadList(String fileName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File jsonFile = File('${appDocDir.path}/$fileName.json');
    if (await jsonFile.exists()) {
      String jsonString = await jsonFile.readAsString();
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((jsonItem) => fromJson(jsonItem)).cast<T>().toList();
    }
    return [];
  }

  Future<void> deleteItem(T itemToDelete, String fileName) async {
    List<T> currentList = await loadList(fileName);
    currentList.removeWhere((item) => toJson(item) == toJson(itemToDelete));
    await saveList(currentList, fileName);
  }
}
