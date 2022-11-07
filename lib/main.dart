import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ralf_class/home/form_page.dart';
import 'package:ralf_class/home/home_binds.dart';
import 'package:ralf_class/home/home_controller.dart';

import 'home/home_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(controller: Get.find<HomeController>()),
          binding: HomeBinds(),
        ),
        GetPage(
            name: '/form_page',
            page: () => FormPage(controller: Get.find<HomeController>()),
            binding: HomeBinds()),
      ],
    ),
  );
}
