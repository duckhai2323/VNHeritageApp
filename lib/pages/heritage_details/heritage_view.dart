import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:vnheritage/pages/heritage_details/heritage_controller.dart';
import 'package:vnheritage/pages/heritage_details/item_blog.dart';
import 'package:vnheritage/share/hotel_item_horizon.dart';

import '../../common/colors/app_colors.dart';
import '../../share/blog_item.dart';
import '../application/application_controller.dart';

class HeritageDetailsPage extends GetView<HeritageDetailsController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.listHeritages.isNotEmpty?Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*1/3+110,
              //color: Colors.blue,
              child: Stack(
                children: [
                  Obx(
                        ()=> Positioned(
                        top: 0,
                        left: 0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*1/4+30,
                          child: PageView.builder(
                            onPageChanged: (index) {
                              controller.HandlePage(index);
                            },
                            controller: controller.pageController,
                            itemCount: controller.listHeritages.isNotEmpty?controller.listHeritages[0].images.length:0,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(controller.listHeritages.isNotEmpty?controller.listHeritages[0].images[index]:""),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              );
                            },
                          ),
                        )
                    ),
                  ),

                  Obx(
                        ()=> Positioned(
                      right: 25,
                      top: 145,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 1,top: 1),
                        height: 25,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            '${controller.currPage.value}/${controller.listHeritages[0].images.length}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 25,
                    right: 25,
                    child: Obx(
                          ()=> InkWell(
                        onTap: (){
                          controller.ClickItemHeart();
                        },
                        child: controller.checkSave.value? const Icon(CupertinoIcons.heart_solid,color: Colors.pink,size: 25):const Icon(CupertinoIcons.heart,color: Colors.white,size: 25),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 25,
                    left: 25,
                    child: InkWell(onTap:(){Get.back();},child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)),
                  ),


                  Positioned(
                    left: 0,
                    bottom: 70,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*1/7,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color.fromRGBO(251, 255, 255,0.1),Color.fromRGBO(251, 255, 255,0.97),AppColors.backgroundColor,AppColors.backgroundColor,AppColors.backgroundColor],
                          )
                      ),
                    ),
                  ),

                  Positioned(
                    left: 15,
                    right: 15,
                    bottom: 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0.25,
                            blurRadius: 2,
                            offset: Offset(0,2),
                          )
                        ],
                      ),
                      child: Obx(
                            ()=> Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  controller.listHeritages.isNotEmpty?controller.listHeritages[0].title??"":'',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 5,),

                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                  decoration: const BoxDecoration(
                                      color: AppColors.bottomNaviColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )
                                  ),
                                  child:RichText(
                                    text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: '4,5', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14)),
                                        TextSpan(text: '/5', style: TextStyle(color: AppColors.placeHolderColor,fontWeight: FontWeight.w500, fontSize: 13)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Divider(
                              color: Colors.grey.shade200,
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                controller.listHeritages.isNotEmpty?controller.listHeritages[0].open??"":'',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.placeHolderColor
                                ),
                              ),
                            ),

                            Divider(
                              color: Colors.grey.shade200,
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined,size: 25,color: AppColors.bottomNaviColor,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    controller.listHeritages.isNotEmpty?controller.listHeritages[0].address??"":'',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 15,right:15,bottom: 10),
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.25,
                    blurRadius: 2,
                    offset: Offset(0,2),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width - 30,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                      ),
                      color: Color.fromRGBO(237, 244, 243,1),
                    ),
                    child: const Text(
                      'Chi tiết',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, size: 30,color: AppColors.bottomNaviColor,),
                          SizedBox(width: 10,),
                          Text(
                            'Đề xuất thời gian tham quan: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            '7-11h',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.placeHolderColor,
                            ),
                          ),
                        ],
                      )
                  ),

                  Obx(
                        ()=> Container(
                        width:MediaQuery.of(context).size.width - 30,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          maxLines: controller.clickMore.value?20:8,
                          overflow: TextOverflow.ellipsis,
                          controller.listHeritages.isNotEmpty?controller.listHeritages[0].description??"":'',                      style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                        )
                    ),
                  ),

                  Obx(() => InkWell(
                    onTap: (){
                      controller.ClickMoreRead();
                    },
                    child: Container(
                      width:MediaQuery.of(context).size.width - 30,
                      margin: EdgeInsets.only(bottom: 5),
                      height: 30,
                      child: Center(
                        child:Transform.rotate(
                          angle: controller.clickMore.value?pi/2:-pi/2,
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: AppColors.bottomNaviColor,
                          ),
                        ),
                      ),
                    ),
                  ),)
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              width:MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.25,
                    blurRadius: 2,
                    offset: Offset(0,2),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width - 30,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                      ),
                      color: Color.fromRGBO(237, 244, 243,1),
                    ),
                    child: const Text(
                      'Khoảnh khắc',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Obx(
                        ()=> Container(
                      width: MediaQuery.of(context).size.width-30,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2-15,
                            padding: EdgeInsets.only(left: 10,right: 5),
                            child: ListView.builder(
                              padding: EdgeInsets.only(top: 15),
                              itemCount: controller.listBlog1.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: (){
                                    controller.HandleReadBLog(controller.listBlog1[index].id);
                                  },
                                  child: ItemBlogHeritageDetail(
                                      controller.listBlog1[index].image,
                                      controller.listBlog1[index].title,
                                      controller.listBlog1[index].user_image,
                                      controller.listBlog1[index].user_name,
                                      controller.listBlog1[index].userLike),
                                );
                              },
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width/2-15,
                            padding: const EdgeInsets.only(right: 10,left: 5),
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 15),
                              itemCount: controller.listBlog2.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: (){
                                    controller.HandleReadBLog(controller.listBlog1[index].id);
                                  },
                                  child: ItemBlogHeritageDetail(
                                      controller.listBlog2[index].image,
                                      controller.listBlog2[index].title,
                                      controller.listBlog2[index].user_image,
                                      controller.listBlog2[index].user_name,
                                      controller.listBlog2[index].userLike),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              width:MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.25,
                    blurRadius: 2,
                    offset: Offset(0,2),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width - 30,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                      ),
                      color: Color.fromRGBO(237, 244, 243,1),
                    ),
                    child: const Text(
                      'Gần đó',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: controller.listHeritagesDiff.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(onTap:(){controller.ClickItemDiff(controller.listHeritagesDiff[index].id??"");},child: HotelItemHorizon(context,controller.listHeritagesDiff[index].images[0],controller.listHeritagesDiff[index].title??"", controller.listHeritagesDiff[index].description??""));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ):Container(color: Colors.white,));
  }
}