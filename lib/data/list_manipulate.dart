import 'package:tryber/models/farm_info.dart';
import 'package:tryber/models/user_info.dart';
import 'package:tryber/models/animal_info.dart';
import 'package:tryber/models/picket_info.dart';

List<FarmInfo> farms = [FarmInfo('nome', 'descricao', 'localizacao')];

void addFarm(String nome, String descricao, String localizacao) {
  farms.add(FarmInfo(nome, descricao, localizacao));
}

List<UserInfo> users = [
  UserInfo('André', 'Medeiros', 'teste@example.com', '32', 'senha', 'senha')
];

void addUser(String nome, String sobrenome, String email, String telefone,
    String senha, String confirmarSenha) {
  users.add(UserInfo(nome, sobrenome, email, telefone, senha, confirmarSenha));
}

List<FarmInfo> getAllFarms() {
  return farms.toList(); // Retorna uma cópia da lista farms
}

List<AnimalInfo> animals = [];

void addAnimal(String tipo, String idBrinco, String peso) {
  animals.add(AnimalInfo(tipo, idBrinco, peso));
}

List<PicketInfo> pickets = [PicketInfo('nome', 'tamanho', 'descricao', 'tipo')];

void addPicket(String nome, String tamanho, String descricao, String tipo) {
  pickets.add(PicketInfo(nome, tamanho, descricao, tipo));
}
