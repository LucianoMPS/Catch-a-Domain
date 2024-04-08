import 'dart:convert';
import 'package:dominio_project/model/dominio.dart';
import 'package:http/http.dart' as http;

class ApiDominio {
  static Future<Dominio> getDominio(String domain) async {
    domain = domain.replaceAll("https://", "");
    
    final response = await http.get(
      Uri.parse('https://brasilapi.com.br/api/registrobr/v1/${domain}'), //converte uma url no formato de string para uma classe uri
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      return Dominio.fromJson(data);
    } else {
      throw Exception('Url não encontrada');
    }
  }
}
