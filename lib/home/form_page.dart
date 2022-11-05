import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ralf_class/home/home_controller.dart';
import 'package:ralf_class/home/models/user_model.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final controller = Get.find<HomeController>();

  final _formKey = GlobalKey<FormState>();
  late UserModel? user;
  late TextEditingController tecNome;
  late TextEditingController tecEmail;
  late TextEditingController tecAvatarUrl;

  @override
  void initState() {
    super.initState();

    user = Get.arguments;
    if (user == null) {
      tecNome = TextEditingController();
      tecEmail = TextEditingController();
      tecAvatarUrl = TextEditingController();
    } else {
      tecNome = TextEditingController(text: user!.name);
      tecEmail = TextEditingController(text: user!.email);
      tecAvatarUrl = TextEditingController(text: user!.avatarUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: tecNome,
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
                controller: tecEmail,
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
                controller: tecAvatarUrl,
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
                    id: user == null
                        ? controller.listUsers.length + 1
                        : user!.id,
                    name: tecNome.text,
                    email: tecEmail.text,
                    avatarUrl: tecAvatarUrl.text,
                  );

                  if (user == null) {
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
