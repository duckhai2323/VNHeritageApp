import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'heritage_controller.dart';

class HeritageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HeritageDetailsController());
  }
}