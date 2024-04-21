import 'package:get/get.dart';
import 'package:vnheritage/pages/application/home/home_controller.dart';

class HomeBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}