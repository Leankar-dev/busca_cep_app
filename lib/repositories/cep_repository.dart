import 'dart:convert';

import 'package:busca_cep_app/models/cep_model.dart';
import 'package:http/http.dart' as http;

class CepRepository {
  static const String _baseUrl = 'https://viacep.com.br/ws';
  final http.Client client;

  CepRepository({required this.client});

  Future<CepModel> consultarCep(String cep) async {
    final cleanCep = cep.replaceAll(r'[^0-9]', '');
    if (cleanCep.length != 8) {
      throw Exception('CEP deve conter exatamente 8 dígitos');
    }

    final url = Uri.parse('$_baseUrl/$cleanCep/json/');
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData.containsKey('erro') && jsonData['erro'] == true) {
          throw Exception('CEP não encontrado');
        }
        return CepModel.fromJson(jsonData);
      } else {
        throw Exception('Erro na requisição');
      }
    } on Exception catch (e) {
      throw Exception('Erro ao consultar CEP: ${e.toString()}');
    }
  }
}
