import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ralf_class/home/form_page.dart';

import 'home/home_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: const MyApp(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/form_page', page: () => const FormPage()),
        
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
