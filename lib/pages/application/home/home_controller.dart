import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  @override
  void onInit() {
    super.onInit();

    scrollController = ScrollController()
      ..addListener(() {
        isSliverAppBarExpanded.value = isSliverAppBarExpandedCheck();
      });
  }
  bool isSliverAppBarExpandedCheck () {
    return scrollController.hasClients &&
        scrollController.offset > 350;
  }
}