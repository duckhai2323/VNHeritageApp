import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReadBlogController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  final statePageView = 0.obs;
  void ChangePageView(int index){
    statePageView.value = index;
  }
}