import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:vnheritage/pages/heritage_details/heritage_controller.dart';
import 'package:vnheritage/share/hotel_item_horizon.dart';

import '../../common/colors/app_colors.dart';
import '../../share/blog_item.dart';

class HeritageDetailsPage extends GetView<HeritageDetailsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*1/3+100,
              //color: Colors.blue,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*1/4+10,
                      child: PageView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('https://hnm.1cdn.vn/2020/06/10/nhipsonghanoi.hanoimoi.com.vn-uploads-images-tuandiep-2020-06-09-_1hphong.jpg'),
                                  fit: BoxFit.cover,
                                )
                            ),
                          );
                        },
                      ),
                    )
                  ),

                  const Positioned(
                    top: 25,
                    right: 25,
                    child: Icon(CupertinoIcons.heart,size: 30,color: Colors.white,),
                  ),

                  const Positioned(
                    top: 25,
                    left: 25,
                    child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,),
                  ),


                  Positioned(
                    left: 0,
                    bottom: 75,
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
                    bottom: 25,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Ho Hoan Kiem',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 5,),
                              const Text(
                                'Hoan Kiem Lake',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColors.placeHolderColor
                                ),
                              ),

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
                            color: Colors.grey.shade300,
                          ),

                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Mo cua hang ngay, 24/7',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColors.placeHolderColor
                              ),
                            ),
                          ),

                          Divider(
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 5,),
                          const Row(
                            children: [
                              Icon(Icons.location_on_outlined,size: 25,color: AppColors.bottomNaviColor,),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'Hàng Trống, Hoàn Kiếm, Hà Nội, Việt Nam',
                                  style: TextStyle(
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
                      'Chi tiet',
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
                          'Recommend Sightseeing Time: ',
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

                  Container(
                    width:MediaQuery.of(context).size.width - 30,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      'Nhiều người dân Thủ đô luôn tự hào khi giới thiệu Hà Nội là mảnh đất nghìn năm văn hiến, nơi gắn với những giai thoại lịch sử hào hùng của dân tộc Việt Nam. Sở hữu vị trí chiến lược quan trọng, đây cũng từng là từng là kinh đô của hầu hết các triều đại phong kiến xưa như nhà Đinh, ...',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),

                  Container(
                    width:MediaQuery.of(context).size.width - 30,
                    margin: EdgeInsets.only(bottom: 5),
                    height: 30,
                    child: Center(
                      child:Transform.rotate(
                        angle: -pi/2,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColors.bottomNaviColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              width:MediaQuery.of(context).size.width - 30,
              height: 610,
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
                      'Khoanh khac',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
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
                            itemCount: 2,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(onTap: (){controller.HandleReadBlog();},child:  BlogItem(context));
                            },
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width/2-15,
                          padding: EdgeInsets.only(right: 10,left: 5),
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 15),
                            itemCount: 2,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(onTap: (){controller.HandleReadBlog();},child: BlogItem(context));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              width:MediaQuery.of(context).size.width - 30,
              height: 780,
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
                      'Gan do',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  DefaultTabController(
                    length: 4,
                    child: TabBar(
                      isScrollable: true,
                      labelColor: AppColors.bottomNaviColor,
                      unselectedLabelColor: AppColors.placeHolderColor,
                      tabAlignment: TabAlignment.start,
                      indicatorColor: AppColors.bottomNaviColor,
                      onTap: (index){

                      },
                      dividerHeight: 0,
                      labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),
                      tabs: const [
                        Tab(child: Text('Đang hiển thị'),),
                        Tab(child: Text('Đang phỏng vấn'),),
                        Tab(child: Text('Chờ xác nhận'),),
                        Tab(child: Text('Đã kết thúc'),),
                      ],
                    ),
                  ),

                  ListView.builder(
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return HotelItemHorizon(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}