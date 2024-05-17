import 'package:get/get.dart';
import 'package:vnheritage/pages/signin_signup/signin/sigin_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
