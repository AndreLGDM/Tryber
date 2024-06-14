import 'package:tryber/models/farm_info.dart';
import 'package:tryber/models/user_info.dart';
import 'package:tryber/models/animal_info.dart';

List<FarmInfo> farms = [];

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

List<AnimalInfo> animals = [];

void addAnimal(String tipo, String idBrinco, String peso) {
  animals.add(AnimalInfo(tipo, idBrinco, peso));
}
