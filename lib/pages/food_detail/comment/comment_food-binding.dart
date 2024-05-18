import 'package:get/get.dart';
import 'package:vnheritage/pages/food_detail/comment/comment_food_controller.dart';

class CommentFoodBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CommentFoodController());
  }
}