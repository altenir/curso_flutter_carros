class Usuario {
  String login;
  String nome;
  String email;
  String token;

  List<String> roles;

  Usuario.fromJson(Map<String, dynamic> map)
      : login = map["login"],
        nome = map["nome"],
        email = map["email"],
        token = map["token"],
        roles = map["roles"] != null ? getRoles(map) : null;

  @override
  String toString() {
    return 'Usuário{login: $login, nome: $nome, email: $email, token: $token';
  }

  static getRoles(Map<String, dynamic> map) {
    List list = map["roles"];
    List<String> roles = list.map((role) => role.toString()).toList();
    // List<String> roles = [];
    // for (var role in list) {
    //   roles.add(role);
    // }
    return roles;
  }
}
