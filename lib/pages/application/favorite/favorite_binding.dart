import 'package:get/get.dart';
import 'package:vnheritage/pages/application/favorite/favorite_controller.dart';

class FavoriteBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
  }
}