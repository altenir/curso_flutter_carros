import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      children: <Widget>[
        Text("Login"),
        TextFormField(),
        Text("Senha"),
        TextFormField(),
      ],
    );
  }
}
