import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnheritage/common/colors/app_colors.dart';
import 'package:vnheritage/pages/application/home/home_controller.dart';
import 'package:vnheritage/share/blog_item.dart';
import 'package:vnheritage/share/food_item.dart';
import 'package:vnheritage/share/heritage_item.dart';

import '../../../share/hotel_item.dart';

class HomePage extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    List<ItemCategory> listCategory = <ItemCategory>[];
    listCategory.add(ItemCategory("Di tích", const Icon(Icons.temple_buddhist_rounded, size: 30, color: Colors.white,),));
    listCategory.add(ItemCategory("Sự kiện", const Icon(Icons.home_repair_service, size: 30, color: Colors.white,),));
    listCategory.add(ItemCategory("Khách sạn", const Icon(Icons.business_outlined, size: 30, color: Colors.white,),));
    listCategory.add(ItemCategory("Nhà hàng", const Icon(Icons.storefront_rounded, size: 30, color: Colors.white,),));
    listCategory.add(ItemCategory("Blog", const Icon(Icons.my_library_books_rounded, size: 30, color: Colors.white,),));

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          // Obx(() =>SliverAppBar(
          //   titleSpacing: 0,
          //   automaticallyImplyLeading: false,
          //   pinned: true,
          //   toolbarHeight: controller.isSliverAppBarExpanded.value?120:0,
          //   backgroundColor: Colors.white,
          //   title:controller.isSliverAppBarExpanded.value? Container(
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.white,
          //     height: 120,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       mainAxisSize: MainAxisSize.max,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           margin: EdgeInsets.only(left: 50,top: 15, bottom: 5),
          //           width: MediaQuery.of(context).size.width-100,
          //           height: 40,
          //           decoration: BoxDecoration(
          //             color: AppColors.bgSearch,
          //             borderRadius: BorderRadius.circular(8),
          //           ),
          //           child: const Row(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             mainAxisSize: MainAxisSize.max,
          //             children: [
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Icon(Icons.search, size: 30, color: AppColors.bottomNaviColor,),
          //               SizedBox(
          //                 width: 5,
          //               ),
          //               Text(
          //                 'Tỉnh thành, điểm đến, điểm...',
          //                 style: TextStyle(
          //                   color: AppColors.placeHolderColor,
          //                   fontSize: 18,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //
          //         SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: Container(
          //             height: 50,
          //             padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          //             child: ListView.builder(
          //               scrollDirection: Axis.horizontal,
          //               physics: const NeverScrollableScrollPhysics(),
          //               itemCount: 6,
          //               shrinkWrap: true,
          //               //itemExtent: 40,
          //               itemBuilder: (BuildContext context, int index) {
          //                 return Container(
          //                    margin: EdgeInsets.only(right: 30),
          //                     height: 44,
          //                     width: 44,
          //                     decoration: BoxDecoration(
          //                         color: Colors.white,
          //                         borderRadius: BorderRadius.circular(22),
          //                         boxShadow: [
          //                           BoxShadow(
          //                             color: Colors.grey.withOpacity(0.2),
          //                             spreadRadius: 0.25,
          //                             blurRadius: 5,
          //                             offset: Offset(0,1),
          //                           )
          //                         ]
          //                     ),
          //                     child: const Center(
          //                       child: CircleAvatar(
          //                         radius: 20,
          //                         backgroundColor: AppColors.iconHomeColor1,
          //                         child: Icon(Icons.store, size: 28, color: Colors.white,),
          //                       ),
          //                     )
          //                 );
          //               },
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ):null,
          // ),),

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
                    top: 20,
                    left: 50,
                    child: Container(
                      width: MediaQuery.of(context).size.width-100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.search, size: 30, color: AppColors.bottomNaviColor,),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Tỉnh thành, điểm đến, điểm...',
                            style: TextStyle(
                              color: AppColors.placeHolderColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
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
                          const SizedBox(width: 20),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Danh mục',
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
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listCategory.length,
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
                            height: 58,
                            width: 58,
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
                                radius: 28,
                                backgroundColor: AppColors.bottomNaviColor,
                                child: listCategory[index].icon,
                              ),
                            )
                          ),

                          const SizedBox(height: 5,),

                          Text(
                            listCategory[index].title,
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

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Danh lăm thắng cảnh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(102, 102, 102, 1),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Text(
                            'Điểm tham quan',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),

                        SizedBox(width: 10,),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                          ),
                          child: const Text(
                            'Sự kiện tổ chức',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
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
                height: 185,
                padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                child: Obx(
                ()=>ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.listHeritages.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext contex, int index) {
                      return InkWell(onTap: (){ controller.HandleHeritageDetailsPage();},child: HeritageItem(context, controller.listHeritages[index].title??"", controller.listHeritages[index].images[0], controller.listHeritages[index].evaluation??""));
                    },
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 10,right: 15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Khách sạn',
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
                height: 185,
                padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext contex, int index) {
                    return HotelItem(contex);
                  },
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 10,right: 15),
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext contex, int index) {
                    return FoodItem(context);
                  },
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
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.only(left: 15,right: 5),
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 5),
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return BlogItem(context);
                      },
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.only(right: 15,left: 5),
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 5),
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return BlogItem(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 50,),
          ),
        ],
      ),
    );
  }
}

class ItemCategory {
  final String title;
  final Icon icon;
  ItemCategory(this.title, this.icon);
}