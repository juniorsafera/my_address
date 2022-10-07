

import 'dart:convert';

import 'package:http/http.dart' as http;

class  CepRepository {
  final urlbase = 'https://viacep.com.br/ws/';

  Future<Map<String, dynamic>> getByCep(String cep) async {
    return await http
        .get(Uri.parse('$urlbase/$cep/json/'))
        .then((res) => json.decode(res.body))
        .onError(
          (error, stackTrace) => {
            'code': error.hashCode,
            'message': error.toString(),
          },
        );
  }
}
