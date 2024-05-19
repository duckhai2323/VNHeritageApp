import 'package:get/get.dart';
import 'package:vnheritage/pages/food_detail/food_detail_controller.dart';

class FoodDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodDetailController());
  }
}
