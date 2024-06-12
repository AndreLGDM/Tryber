import 'package:tryber/models/farm_info.dart';

List<FarmInfo> farms = [FarmInfo('teste', 'teste', 'teste')];

void aumentarFazendas(String nome, String descricao, String localizacao) {
  farms.add(FarmInfo(nome, descricao, localizacao));
}
