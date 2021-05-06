import 'package:carros/pages/carro/carros_api.dart';
import 'package:flutter/material.dart';

import '../../drawer_list.dart';
import 'Carro.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    Future<List<Carro>> future = CarrosApi.getCarros();

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text(
              "Não foi possivel buscar os carros",
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
              ),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snapshot.data;
        return _listView(carros);
      },
    );
  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      c.urlFoto ??
                          "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Cadillac_Eldorado.png",
                      width: 250,
                    ),
                  ),
                  Text(
                    c.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "Descrição ...",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('DETALHES'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('SHARE'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          );
          // return ListTile(
          //   leading: Image.network(c.urlFoto),
          //   title: Text(
          //     c.nome,
          //     style: TextStyle(fontSize: 22),
          //   ),
          // );
        },
      ),
    );
  }
}
