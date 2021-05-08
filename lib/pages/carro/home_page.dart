import 'package:carros/pages/carro/CarroTipo.dart';
import 'package:carros/utils/prefs.dart';
import 'package:carros/widgets/carros_listview.dart';
import 'package:flutter/material.dart';

import '../../drawer_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initTabs();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _initTabs() async {
    // Primeiro busca o índice nas prefs.
    int tabIdx = await Prefs.getInt("tabIdx");
    print("_initTabs $tabIdx");

    // Depois cria o TabController
    // No método build na primeira vez ele poderá estar nulo
    _tabController = new TabController(length: 3, vsync: this);

    // Agora que temos o TabController e o índice da tab,
    // chama o setState para redesenhar a tela
    setState(() {
      _tabController.index = tabIdx;
      print("setState $tabIdx");
    });

    // fica escutando quando troca de Tab
    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
      print("addListener ${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Home build");

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: TabBar(
            controller: _tabController,
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
        body: TabBarView(
          controller: _tabController,
          children: [
            CarrosListView(TipoCarro.classicos),
            CarrosListView(TipoCarro.esportivos),
            CarrosListView(TipoCarro.luxo),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }
}
