import 'package:get/get.dart';
import 'package:vnheritage/pages/create_blog/create_blog_controller.dart';

class CreateBlogBiding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CreateBlogController());
  }
}