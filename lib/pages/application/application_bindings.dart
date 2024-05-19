import 'package:get/get.dart';
import 'package:vnheritage/pages/application/blog/blog_controller.dart';
import 'package:vnheritage/pages/application/favorite/favorite_controller.dart';
import 'package:vnheritage/pages/application/home/home_controller.dart';
import 'package:vnheritage/pages/application/profile/profile_controller.dart';

import 'application_controller.dart';

class ApplicationBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(ApplicationController());
    Get.put(HomeController());
    Get.put(FavoriteController());
    Get.put(BlogController());
    Get.put(ProfileController());
  }
}