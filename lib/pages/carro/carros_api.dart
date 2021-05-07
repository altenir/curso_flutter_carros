import 'dart:convert' as convert;
import 'package:carros/pages/carro/Carro.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    try {
      Usuario user = await Usuario.get();

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${user.token}"
      };

      var url = Uri.parse(
          'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo');

      var response = await http.get(url, headers: headers);

      String json = response.body;
      List list = convert.json.decode(json);
      List<Carro> carros =
          list.map<Carro>((map) => Carro.fromJson(map)).toList();

      return carros;
    } catch (e) {
      print(e);
    }

    // final carros = <Carro>[];
    // await Future.delayed(Duration(seconds: 2));
    // carros.add(Carro(
    //     nome: "Cadillac Eldorado",
    //     urlFoto:
    //         "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Cadillac_Eldorado.png"));
    // carros.add(Carro(
    //     nome: "Chevrolet Corvette 78",
    //     urlFoto:
    //         "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Corvette.png"));
    // carros.add(Carro(
    //     nome: "Chevrolet Impala Coupe Impala Coupe",
    //     urlFoto:
    //         "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Impala_Coupe.png"));
    // return carros;
  }
}
