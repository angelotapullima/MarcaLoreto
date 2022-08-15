import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marca_loreto/src/utils/constants.dart';

class FormActionApi {
  Future<int> sendData(String nombre, String email) async {
    try {
      final url = Uri.parse('$apiBaseURL/api/App/ws_guardar_datos');
      final resp = await http.post(
        url,
        body: {
          'nombre': nombre,
          'email': email,
        },
      );

      if (resp.statusCode == 200) {
        final decodedData = json.decode(resp.body);
        print(decodedData);
        return decodedData["result"]["code"];
      } else {
        return 2;
      }
    } catch (e) {
      return 2;
    }
  }
}
