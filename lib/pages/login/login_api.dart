import 'dart:convert';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/login');

    try {
      Map<String, String> headers = {"Content-Type": "application/json"};
      Map params = {"username": login, "password": senha};

      String s = jsonEncode(params);
      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = jsonDecode(response.body);
      // String nome = mapResponse["nome"];
      // String email = mapResponse["email"];
      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        user.save();

        // Usuario user2 = await Usuario.get();
        // print("user2: $user2");

        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["error"]);
    } catch (error, Exception) {
      print("Erro no login $error > $Exception");
      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
