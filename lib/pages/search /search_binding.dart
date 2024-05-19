
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:vnheritage/pages/search%20/search_controller.dart';

class SearchBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => Search1Controller());
  }
}