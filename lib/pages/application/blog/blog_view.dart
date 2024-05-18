import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnheritage/pages/application/blog/blog_controller.dart';
import 'package:vnheritage/pages/application/blog/blog_list.dart';

import '../../../common/colors/app_colors.dart';

class BlogPage extends GetView<BlogController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        toolbarHeight: 55,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1,
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 23,
                  color: AppColors.bottomNaviColor,
                  onPressed: (){

                  },
                ),
              ],
            ),
            const Text(
              'Khoảnh khắc du lịch',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.bottomNaviColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            InkWell(
              onTap: (){
                controller.HandleCreatePage();
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.bottomNaviColor
                ),
                child: Icon(Icons.add,color: Colors.white,size: 20,),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(()=>controller.listNews.isNotEmpty?BlogList():Container(color: Colors.white,),),
      ),
    );
  }
}