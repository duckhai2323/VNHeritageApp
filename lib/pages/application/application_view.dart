import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vnheritage/pages/application/application_controller.dart';
import 'package:vnheritage/pages/application/home/home_view.dart';

import '../../common/colors/app_colors.dart';

class ApplicationPage extends GetView<ApplicationController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (index){
          controller.handPageChanged(index);
        },
        children: [
          HomePage(),
          Center(child: Text('yêu thích'),),
          Center(child: Text('khoảnh khắc'),),
          Center(child: Text('cá nhân'),),
        ],
      ),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items:controller.bottomTab,
        currentIndex: controller.state.value,
        type: BottomNavigationBarType.fixed,
        onTap: controller.handNavBarTap,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: AppColors.bottomNaviColor,
        unselectedItemColor: Colors.grey,
      )),
    );
  }
}