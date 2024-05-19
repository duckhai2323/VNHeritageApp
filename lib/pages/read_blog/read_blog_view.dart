import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/state_manager.dart';
import 'package:vnheritage/pages/application/application_controller.dart';
import 'package:vnheritage/pages/read_blog/item_blog.dart';
import 'package:vnheritage/pages/read_blog/read_blog_controller.dart';

import '../../common/colors/app_colors.dart';
import '../../share/blog_item.dart';

class ReadBLogPage extends GetView<ReadBlogController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:Obx(()=>controller.blogs.isNotEmpty? SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    ()=>controller.users.isNotEmpty? Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:NetworkImage(controller.users[0].image??""),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 5,),
                            Text(
                              controller.users[0].fullName??"",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 3,),
                            Container(
                                height: 25,
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                color: const Color.fromRGBO(248, 224, 222,1),
                                child: const Center(
                                  child: Text(
                                    'Travel Expert',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(209, 92, 72,1)
                                    ),
                                  ),
                                )
                            ),
                            const SizedBox(height: 5,),
                          ],
                        ),
                      ],
                    ):Container(),
                  ),

                  Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(73, 73, 73, 0.5),
                        shape: BoxShape.circle
                    ),
                    child: InkWell(
                      onTap: (){
                        //controller.ClickItemHeart(index);
                      },
                      child:const Center(
                        child: Icon(
                          CupertinoIcons.heart,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Obx(
                  ()=>Container(
                margin: EdgeInsets.only(bottom: 10),
                height: MediaQuery.of(context).size.height*1/3,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (index){
                    controller.ChangePageView(index);
                  },
                  itemCount: controller.blogs[0].images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: MediaQuery.of(context).size.height*1/3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(controller.blogs[0].images[index]),
                              fit: BoxFit.fill
                          )
                      ),
                    );
                  },
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Obx(()=> DotsIndicator(
                  dotsCount: controller.blogs[0].images.length,
                  position:controller.statePageView.value,
                  decorator: DotsDecorator(
                    activeColor: AppColors.bottomNaviColor,
                    size: const Size.square(8.0),
                    activeSize: const Size(10.0, 10.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),),
              ),
            ),

            Obx(
                ()=>Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  controller.blogs[0].title??"",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),

            Obx(
                ()=> Padding(
                padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                child: Text(
                  controller.blogs[0].content??"",
                  maxLines: 12,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            Obx(
                () =>controller.heritages.isNotEmpty?InkWell(
                  onTap: (){
                    controller.HandleHeritageDetailsPage(controller.heritages[0].id??"");
                  },
                  child: Container(
                  margin: const EdgeInsets.only(top: 20,left: 15,right: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.25,
                          blurRadius: 10,
                          offset: Offset(0,2),
                        )
                      ]
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        width: 120,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(controller.heritages[0].images[0]),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5,),
                          Text(controller.heritages[0].title??"",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(height: 5,),

                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                margin: const EdgeInsets.only(right: 10,top: 3,bottom: 3),
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

                              Text(
                                controller.heritages[0].evaluation??"",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.placeHolderColor
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 5,),

                          Row(
                            children: [
                              const Icon(Icons.location_on,size: 20,color: Colors.grey,),
                              Text(
                                controller.heritages[0].province??"",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.placeHolderColor
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 5,),

                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 180,),
                              Container(
                                width: 60,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.bottomNaviColor,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: const Center(
                                  child: Text(
                                    'Xem',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                                ),
                ):Container(),
            ),


            Container(
              height: 120,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Bình luận',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          controller.HandleComment();
                        },
                        child: const Text(
                          'Xem tất cả',
                          style: TextStyle(
                            color: AppColors.bottomNaviColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const Icon(Icons.arrow_forward_ios,size: 16,color: AppColors.bottomNaviColor,)
                    ],
                  ),

                  //const SizedBox(height: 10,),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(ApplicationController.user_image),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            controller.HandleComment();
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 15,bottom: 15,top: 15),
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromRGBO(244, 244, 244, 1),
                            ),
                            child: const Text(
                              'Bình luận...',
                              style: TextStyle(
                                color: AppColors.placeHolderColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left:15,bottom: 5),
              child: Text(
                'Khoảnh khắc liên quan',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),

            Obx(()=> Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2-15,
                      padding: const EdgeInsets.only(right: 5),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 15),
                        itemCount: controller.listBlog1.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              //controller.HandleReadBLog(controller.listBlog1[index].id);
                            },
                            child: ItemBlogReadPage(
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
                      padding: const EdgeInsets.only(left: 5),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 15),
                        itemCount: controller.listBlog2.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              //controller.HandleReadBLog(controller.listBlog1[index].id);
                            },
                            child: ItemBlogReadPage(
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

            SizedBox(height: 100,),
          ],
        ),
      ):Container(color: Colors.white,)),
    );
  }
}