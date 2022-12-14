import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ralf_class/home/models/user_model.dart';

class HomeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late UserModel? user;
  late TextEditingController tecNome;
  late TextEditingController tecEmail;
  late TextEditingController tecAvatarUrl;

  // user = Get.arguments;

  //   if (user == null) {
  //     tecNome = TextEditingController();
  //     tecEmail = TextEditingController();
  //     tecAvatarUrl = TextEditingController();
  //   } else {
  //     tecNome = TextEditingController(text: user!.name);
  //     tecEmail = TextEditingController(text: user!.email);
  //     tecAvatarUrl = TextEditingController(text: user!.avatarUrl);
  //   }

  RxList<UserModel> listUsers = [
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
  ].obs;

  void createUser(UserModel user) {
    try {
      listUsers.add(user);
    } catch (e) {
      throw Exception('Erro ao adicionar usuário');
    }
    log(listUsers.toString());
  }

  RxList<UserModel> readUsers() {
    log(listUsers.toString());
    try {
      return listUsers;
    } catch (e) {
      throw Exception('Erro ao ler usuários');
    }
  }

  UserModel readUserById(int id) {
    log(listUsers.toString());
    try {
      final index = listUsers.indexWhere((element) => element.id == id);
      return listUsers[index];
    } catch (e) {
      throw Exception('Erro ao ler usuários');
    }
  }

  void updateUser(UserModel user) {
    try {
      final index = listUsers.indexWhere((element) => element.id == user.id);
      listUsers[index] = user;
    } catch (e) {
      throw Exception('Erro ao atualizar usuário');
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
}
