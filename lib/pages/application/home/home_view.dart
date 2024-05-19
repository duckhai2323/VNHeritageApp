import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:vnheritage/common/colors/app_colors.dart';
import 'package:vnheritage/pages/application/home/home_controller.dart';
import 'package:vnheritage/pages/application/home/item_blog.dart';
import 'package:vnheritage/share/blog_item.dart';
import 'package:vnheritage/share/food_item.dart';
import 'package:vnheritage/share/heritage_item.dart';

import '../../../share/hotel_item.dart';
import '../application_controller.dart';

class HomePage extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body:Obx(()=>controller.listHeritages.isNotEmpty? CustomScrollView(
        controller: controller.scrollController,
        slivers: [

          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height*1/3,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height*1/3,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        itemCount: controller.listHeritages[0].images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return  Container(
                            height: MediaQuery.of(context).size.height*1/3,
                            decoration:BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(controller.listHeritages[0].images[index]),
                                    fit: BoxFit.fill
                                )
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom:0,
                    left: 0,
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color:AppColors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    left: 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width-80,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.25,
                              blurRadius: 5,
                              offset: Offset(0,1),
                            )
                          ]
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 20,),
                          Transform.rotate(
                            angle: -pi/4,
                            child: const Icon(
                              Icons.send,
                              size: 30,
                              color: AppColors.bottomNaviColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: 'Vị trí hiện tại: ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18)),
                                TextSpan(text: 'Hà Nội ', style: TextStyle(color: AppColors.bottomNaviColor,fontWeight: FontWeight.w500, fontSize: 18)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Danh mục',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(),
                  ],
                ),
              )
          ),

          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.listCategory.length,
                  shrinkWrap: true,
                  itemExtent: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(29),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0.25,
                                      blurRadius: 5,
                                      offset: Offset(0,1),
                                    )
                                  ]
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 26,
                                  backgroundColor: AppColors.bottomNaviColor,
                                  child: controller.listCategory[index].icon,
                                ),
                              )
                          ),

                          const SizedBox(height: 5,),

                          Text(
                            controller.listCategory[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: AppColors.placeHolderColor
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 5,right: 15,bottom: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Danh lam thắng cảnh',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Xem tất cả',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.bottomNaviColor
                      ),
                    ),
                  ],
                ),
              )
          ),

          // Obx(
          //       ()=> SliverToBoxAdapter(
          //       child: Container(
          //         margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           mainAxisSize: MainAxisSize.max,
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               mainAxisSize: MainAxisSize.min,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 InkWell(
          //                   onTap:(){
          //                     if(controller.clickEvent.isTrue) {
          //                       controller.clickEvent.value = false;
          //                     }
          //                   },
          //                   child: Container(
          //                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          //                     decoration: BoxDecoration(
          //                       color: controller.clickEvent.isTrue?Colors.white:Color.fromRGBO(102, 102, 102, 1),
          //                       borderRadius: BorderRadius.circular(3),
          //                       border: Border.all(
          //                         width: 1,
          //                         color: Color.fromRGBO(102, 102, 102, 1),
          //                       ),
          //                     ),
          //                     child: Text(
          //                       'Điểm tham quan',
          //                       style: TextStyle(
          //                           fontSize: 15,
          //                           fontWeight: FontWeight.bold,
          //                           color: controller.clickEvent.isTrue?Color.fromRGBO(102, 102, 102, 1):Colors.white
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //
          //                 SizedBox(width: 10,),
          //
          //                 InkWell(
          //                   onTap: (){
          //                     if(controller.clickEvent.isFalse) {
          //                       controller.clickEvent.value = true;
          //                     }
          //                   },
          //                   child: Container(
          //                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          //                     decoration: BoxDecoration(
          //                       color: controller.clickEvent.isTrue?Color.fromRGBO(102, 102, 102, 1):Colors.white,
          //                       borderRadius: BorderRadius.circular(3),
          //                       border: Border.all(
          //                         width: 1,
          //                         color: Color.fromRGBO(102, 102, 102, 1),
          //                       ),
          //                     ),
          //                     child: Text(
          //                       'Sự kiện tổ chức',
          //                       style: TextStyle(
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.bold,
          //                         color:controller.clickEvent.isTrue?Colors.white:Color.fromRGBO(102, 102, 102, 1),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             const Text(
          //               'Xem tất cả',
          //               style: TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                   color: AppColors.bottomNaviColor
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //   ),
          // ),

          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 185,
                padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                child: Obx(
                      ()=>ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.listHeritages.isNotEmpty?controller.listHeritages.length:0,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext contex, int index) {
                      return InkWell(
                          onTap: (){
                            controller.HandleHeritageDetailsPage(controller.listHeritages.isNotEmpty?controller.listHeritages[index].id.toString():"");},
                          child: HeritageItem(
                            context,
                            index,
                            controller.listHeritages.isNotEmpty?controller.listHeritages[index].title??"":"",
                            controller.listHeritages.isNotEmpty?controller.listHeritages[index].images[0]:"",
                            controller.listHeritages.isNotEmpty?controller.listHeritages[index].description??"":"",
                            controller.listHeritages[index].userlike.contains(ApplicationController.user_id) ? const Icon(CupertinoIcons.heart_solid,color: Colors.pink,size: 25):Icon(CupertinoIcons.heart,color: Colors.white,size: 25),
                          )
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 15, top: 10,right: 15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Món ăn đặc sắc',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Xem tất cả',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.bottomNaviColor
                      ),
                    ),
                  ],
                ),
              )
          ),

          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 190,
                padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                child: Obx(
                      ()=> ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.listFoods.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext contex, int index) {
                      return InkWell(onTap:(){
                        controller.HandleFoodDetail(controller.listFoods[index].id??"");
                      },child: FoodItem(
                          context,
                          controller.listFoods[index].images[0],
                          controller.listFoods[index].name??"",
                          controller.listFoods[index].evaluation??"",
                          controller.listFoods[index].restaurant??""));
                    },
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 10,right: 15,bottom: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Khám phá',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Xem tất cả',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.bottomNaviColor
                      ),
                    ),
                  ],
                ),
              )
          ),

          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                        ()=> Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: const EdgeInsets.only(left: 15,right: 5),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: controller.listBlog1.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              controller.HandleReadBLog(controller.listBlog1[index].id);
                            },
                            child: ItemBlogHome(
                                controller.listBlog1[index].image,
                                controller.listBlog1[index].title,
                                controller.listBlog1[index].user_image,
                                controller.listBlog1[index].user_name,
                                controller.listBlog1[index].userLike),
                          );
                        },
                      ),
                    ),
                  ),

                  Obx(
                        ()=> Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: const EdgeInsets.only(right: 15,left: 5),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: controller.listBlog2.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              controller.HandleReadBLog(controller.listBlog2[index].id);
                            },
                            child: ItemBlogHome(
                                controller.listBlog2[index].image,
                                controller.listBlog2[index].title,
                                controller.listBlog2[index].user_image,
                                controller.listBlog2[index].user_name,
                                controller.listBlog2[index].userLike),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 50,),
          ),
        ],
      ):Container()),
    );
  }
}