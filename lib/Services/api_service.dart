import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  late final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> updateRacao(
      String tagNumber, int novaQuantidade) async {
    final response = await http.post(
      Uri.parse('$baseUrl/update_racao'),
      body: {
        'tag_number': tagNumber,
        'nova_quantidade': novaQuantidade.toString(),
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update ration');
    }
  }

  Future<Map<String, dynamic>> updatePorcao(
      String tagNumber, int novaPorcao) async {
    final response = await http.post(
      Uri.parse('$baseUrl/update_porcao'),
      body: {
        'tag_number': tagNumber,
        'nova_porcao': novaPorcao.toString(),
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update portion');
    }
  }

  Future<Map<String, dynamic>> fornecerRacaoExtra(
      String tagNumber, int quantidadePorcao) async {
    final response = await http.post(
      Uri.parse('$baseUrl/racao_extra'),
      body: {
        'tag_number': tagNumber,
        'quantidade_porcao': quantidadePorcao.toString(),
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to provide extra ration');
    }
  }
}
