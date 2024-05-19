
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'comment_controller.dart';

class CommentBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => CommentController());
  }
}
