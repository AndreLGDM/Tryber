import 'package:tryber/models/farm_info.dart';
import 'package:tryber/models/user_info.dart';
import 'package:tryber/models/animal_info.dart';
import 'package:tryber/models/picket_info.dart';

List<FarmInfo> farms = [];

void addFarm(String nome, String descricao, String localizacao) {
  farms.add(FarmInfo(nome, descricao, localizacao));
}

List<FarmInfo> getAllFarms() {
  return farms.toList(); // Retorna uma cópia da lista farms
}

List<UserInfo> users = [];

void addUser(int id, String nome, String sobrenome, String email,
    String telefone, String senha, List<FarmInfo> fazendas) {
  users.add(UserInfo(id, nome, sobrenome, email, telefone, senha, fazendas));
}

List<UserInfo> getAllUsers() {
  return users.toList(); // Retorna uma cópia da lista farms
}

List<AnimalInfo> animals = [];

void addAnimal(String tipo, String idBrinco, String peso) {
  animals.add(AnimalInfo(tipo, idBrinco, peso));
}

List<PicketInfo> pickets = [PicketInfo('nome', 'tamanho', 'descricao', 'tipo')];

void addPicket(String nome, String tamanho, String descricao, String tipo) {
  pickets.add(PicketInfo(nome, tamanho, descricao, tipo));
}
