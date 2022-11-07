import 'package:get/get.dart';
import 'package:ralf_class/home/form_page.dart';
import 'package:ralf_class/home/home_controller.dart';
import 'package:ralf_class/home/home_page.dart';

class HomeBinds implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<FormPage>(
      () => FormPage(
        controller: Get.find<HomeController>(),
      ),
    );

    Get.lazyPut<HomePage>(
      () => HomePage(
        controller: Get.find<HomeController>(),
      ),
    );
  }
}
