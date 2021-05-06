import 'package:carros/pages/carro/CarroTipo.dart';
import 'package:carros/widgets/carros_listview.dart';
import 'package:flutter/material.dart';

import '../../drawer_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Classicos",
              ),
              Tab(
                text: "Esportivos",
              ),
              Tab(
                text: "Luxo",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          CarrosListView(TipoCarro.classicos),
          CarrosListView(TipoCarro.esportivos),
          CarrosListView(TipoCarro.luxo),
        ]),
        drawer: DrawerList(),
      ),
    );
  }
}
