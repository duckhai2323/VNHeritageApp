import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vnheritage/common/routes/names.dart';

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

  void HandleHeritageDetailsPage (){
    Get.toNamed(AppRoutes.HERITAGEDETAILS);
  }
}