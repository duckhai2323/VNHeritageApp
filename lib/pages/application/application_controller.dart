import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/colors/app_colors.dart';

class ApplicationController extends GetxController {
  static late String id;
  static late String image;
  static late String username;
  final position = ''.obs;
  ApplicationController();
  final state = 0.obs;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTab;
  late final List<BottomNavigationBarItem> bottomTabAdmin;

  @override
  void onInit() {
    super.onInit();
    id = Get.parameters['id']??"";
    image = Get.parameters['image']??"";
    username = Get.parameters['username']??"";
    position.value = Get.parameters['position']??"";
    bottomTab = <BottomNavigationBarItem> [
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.house_fill,
          color: AppColors.bottomNaviColor,
          size: 25,
        ),
        label: 'Trang chủ',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.heart,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.heart_fill,
          color: AppColors.bottomNaviColor,
          size: 25,
        ),
        label: 'Yêu thích',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.image_outlined,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.image,
          color: AppColors.bottomNaviColor,
          size: 25,
        ),

        label: 'Khoảnh khắc',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.perm_identity_sharp,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.person,
          color: AppColors.bottomNaviColor,
          size: 25,
        ),

        label: 'Cá nhân',
        backgroundColor: Colors.transparent,
      ),

    ];

    pageController = PageController(initialPage: state.value);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void handPageChanged(int index) {
    state.value = index;
  }

  void handNavBarTap(int index) {
    pageController.jumpToPage(index);
  }
}
