import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _text("Login", "Digite o login", controller: _tLogin),
            SizedBox(
              height: 10,
            ),
            _text("Senha", "Digite a senha",
                controller: _tSenha, password: true),
            SizedBox(
              height: 20,
            ),
            _button("Login", _onClickLogin),
          ],
        ),
      ),
    );
  }

  TextFormField _text(
    String label,
    String hint, {
    bool password = false,
    TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: (String text) {
        if (text.isEmpty) {
          return "Digite o texto";
        }
      },
      style: TextStyle(
        fontSize: 25,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 16),
          labelStyle: TextStyle(
            fontSize: 25,
            color: Colors.grey,
          )),
    );
  }

  Container _button(String text, Function onPressed) {
    return Container(
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  void _onClickLogin() {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;
    print("Login: $login, Senha: $senha");
  }
}
