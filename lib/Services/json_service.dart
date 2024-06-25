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
    Map<String, dynamic> jsonToDelete = toJson(itemToDelete);
    var firstKeyToDelete = jsonToDelete.keys.first;
    var firstValueToDelete = jsonToDelete[firstKeyToDelete];

    currentList.removeWhere((item) {
      var jsonItem = toJson(item);
      var firstKey = jsonItem.keys.first;
      var firstValue = jsonItem[firstKey];
      return firstValue == firstValueToDelete;
    });

    await saveList(currentList, fileName);
  }

  Future<void> renameFile(String oldFileName, String newFileName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File oldFile = File('${appDocDir.path}/$oldFileName.json');
    File newFile = File('${appDocDir.path}/$newFileName.json');

    if (await oldFile.exists()) {
      await oldFile.rename(newFile.path);
    } else {
      throw Exception("File with name $oldFileName.json does not exist");
    }
  }
}
