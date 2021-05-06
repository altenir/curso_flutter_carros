import 'package:carros/pages/carro/Carro.dart';

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    final carros = <Carro>[];

    await Future.delayed(Duration(seconds: 2));

    carros.add(Carro(
        nome: "Cadillac Eldorado",
        urlFoto:
            "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Cadillac_Eldorado.png"));
    carros.add(Carro(
        nome: "Chevrolet Corvette 78",
        urlFoto:
            "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Corvette.png"));
    carros.add(Carro(
        nome: "Chevrolet Impala Coupe Impala Coupe",
        urlFoto:
            "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Impala_Coupe.png"));
    return carros;
  }
}
