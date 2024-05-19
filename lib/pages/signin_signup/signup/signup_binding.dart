import 'package:get/get.dart';
import 'package:vnheritage/pages/signin_signup/signup/signup_controller.dart';

class SignUpBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}