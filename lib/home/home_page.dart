import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ralf_class/home/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.listUsers.length,
            itemBuilder: (BuildContext context, int index) {
              final user = controller.listUsers[index];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(user.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          Get.toNamed('/form_page', arguments: user),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.deleteUser(user.id),
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.toNamed('/form_page'),
      ),
    );
  }
}
