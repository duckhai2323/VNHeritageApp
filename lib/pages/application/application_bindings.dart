import 'package:get/get.dart';
import 'package:vnheritage/pages/application/home/home_controller.dart';

import 'application_controller.dart';

class ApplicationBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
    Get.lazyPut(() => HomeController());
  }
}
