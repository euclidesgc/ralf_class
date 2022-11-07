import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ralf_class/home/home_controller.dart';
import 'package:ralf_class/home/models/user_model.dart';

class FormPage extends StatelessWidget {
  final HomeController controller;

  const FormPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.tecNome,
                decoration: const InputDecoration(
                  label: Text('Nome'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.tecEmail,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.tecAvatarUrl,
                decoration: const InputDecoration(
                  label: Text('URL do Avatar'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width - 16,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  final formUser = UserModel(
                    id: controller.user == null
                        ? controller.listUsers.length + 1
                        : controller.user!.id,
                    name: controller.tecNome.text,
                    email: controller.tecEmail.text,
                    avatarUrl: controller.tecAvatarUrl.text,
                  );

                  if (controller.user == null) {
                    controller.createUser(formUser);
                  } else {
                    controller.updateUser(formUser);
                  }
                  Get.close(1);
                },
                child: const Text('Salvar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
