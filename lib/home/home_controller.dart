import 'dart:developer';

import 'package:ralf_class/home/models/user_model.dart';

class HomeController {
  String title = 'Home do Controller';

  List<UserModel> listUsers = [
    UserModel(
        id: 0,
        name: 'Ralf',
        email: 'ralf@gmail.com',
        avatarUrl: 'http://meuavatar_00.png'),
    UserModel(
        id: 1,
        name: 'Euclides',
        email: 'euclides@gmail.com',
        avatarUrl: 'http://meuavatar_01.png'),
  ];

  void addUser(UserModel user) {
    try {
      listUsers.add(user);
    } catch (e) {
      throw Exception('Erro ao adicionar usuário');
    }
    log(listUsers.toString());
  }

  void deleteUser(int id) {
    try {
      listUsers.removeWhere((element) => element.id == id);
    } catch (e) {
      throw Exception('Erro ao excluir usuário');
    }
    log(listUsers.toString());
  }

  List<UserModel> getUsers() {
    return listUsers;
  }
}
