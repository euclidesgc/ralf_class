import 'package:flutter/material.dart';
import 'package:ralf_class/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.builder(
          itemCount: controller.listUsers.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(controller.listUsers[index].name),
              trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => setState(() {
                        controller.deleteUser(controller.listUsers[index].id);
                      })),
            );
          }),
    );
  }
}
