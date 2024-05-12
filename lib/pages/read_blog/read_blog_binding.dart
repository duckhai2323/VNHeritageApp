import 'package:get/get.dart';
import 'package:vnheritage/pages/read_blog/read_blog_controller.dart';

class ReadBLogBingding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => ReadBlogController());
  }
}