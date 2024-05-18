import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vnheritage/pages/food_detail/food_detail_controller.dart';

import '../../common/colors/app_colors.dart';
import '../../share/hotel_item_horizon.dart';

class FoodDetailPage extends GetView<FoodDetailController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 70,
        padding: const EdgeInsets.only(left: 15,right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.mode_edit_rounded, color: AppColors.bottomNaviColor,size: 25,),
            Text(
              'Viết đánh giá',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*1/2,
              //color: Colors.blue,
              child: Stack(
                children: [
                  Positioned(
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
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('https://static.vinwonders.com/production/bun-cha-ha-noi-01.jpg'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            );
                          },
                        ),
                      )
                  ),
                  Positioned(
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
                          '${controller.currPage.value}/${5}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
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
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                          Text(
                            //controller.listHeritages.isNotEmpty?controller.listHeritages[0].title??"":'',
                            'Bun Cha Dac Kim',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                margin: const EdgeInsets.symmetric(vertical: 5),
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

                              SizedBox(width: 10,),

                              Text(
                                '10 đánh giá',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.placeHolderColor
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: AppColors.bgTextFeild,
                                ),
                                child: Text(
                                  'Tinh Hoa Ẩm Thực Việt',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Divider(
                            color: Colors.grey.shade200,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Icon(Icons.storefront_outlined,color: AppColors.bottomNaviColor,size: 23,),
                                SizedBox(width: 5,),
                                RichText(
                                  text: const TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text: 'Mở cửa | ', style: TextStyle(color: AppColors.bottomNaviColor, fontWeight: FontWeight.w500, fontSize: 15)),
                                      TextSpan(text: ' 08:00 - 20:30', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500, fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            color: Colors.grey.shade200,
                          ),
                          const SizedBox(height: 5,),

                          // Padding(
                          //   padding: EdgeInsets.symmetric(vertical: 5),
                          //   child: Row(
                          //     children: [
                          //       Icon(Icons.phone,color: AppColors.bottomNaviColor,size: 20,),
                          //       SizedBox(width: 5,),
                          //       RichText(
                          //         text: const TextSpan(
                          //           children: <TextSpan>[
                          //             TextSpan(text: 'So dien thoai | ', style: TextStyle(color: AppColors.bottomNaviColor, fontWeight: FontWeight.w500, fontSize: 15)),
                          //             TextSpan(text: ' 0989789789', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500, fontSize: 14)),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          //
                          // Divider(
                          //   color: Colors.grey.shade200,
                          // ),
                          // const SizedBox(height: 5,),

                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined,size: 25,color: AppColors.bottomNaviColor,),
                              SizedBox(width: 5,),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width-90,
                                  child: Text(
                                    //controller.listHeritages.isNotEmpty?controller.listHeritages[0].address??"":'',
                                    'kkkkkkkk fhaif oawfhiuh ahwefi hiaefh',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
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
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              padding: EdgeInsets.symmetric(horizontal: 14,vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Đánh giá',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      Text(
                        'xem thêm',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.bottomNaviColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 13),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 246, 251, 1),
                      borderRadius: BorderRadius.circular(3)
                    ),
                    child: Row(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '4.4', style: TextStyle(color: AppColors.bottomNaviColor, fontWeight: FontWeight.bold, fontSize: 17)),
                              TextSpan(text: '/5', style: TextStyle(color: AppColors.placeHolderColor,fontWeight: FontWeight.w500, fontSize: 14)),
                            ],
                          ),
                        ),

                        SizedBox(width: 10,),

                        Text(
                          'Rất tốt',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.bottomNaviColor
                          ),
                        ),

                        SizedBox(width: 10,),

                        Text(
                          '7 đánh giá',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 0.8,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width-58,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: MediaQuery.of(context).size.width-58,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.8,
                                color: Colors.grey.shade200
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundImage: NetworkImage('https://vcdn1-dulich.vnecdn.net/2022/05/11/hoan-kiem-lake-7673-1613972680-1508-1652253984.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=2wB1cBTUcNKuk68nrG6LMQ'),
                                  ),

                                  SizedBox(width: 10,),

                                  Text(
                                    'Khai ne',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                    margin: const EdgeInsets.symmetric(vertical: 8),
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

                                  SizedBox(width: 8,),

                                  Text(
                                    'Rất tốt',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.bottomNaviColor
                                    ),
                                  ),
                                ],
                              ),

                              Text(
                                'bo rat ngon, huong vi rat ngot ngao nhu may co thieu nu moi lon, vay rat laf ngon va dam da toi se quay lai nhieu lan',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width,
                                //height: controller.listImages.length <= 3? 130:260,
                                height: 260,
                                //color:Colors.blue,
                                child: GridView.builder(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 115,
                                  ),
                                  //itemCount: controller.listImages.length,
                                  itemCount: 5,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      //margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          image: NetworkImage('https://static.vinwonders.com/production/bun-cha-ha-noi-01.jpg'),
                                          fit: BoxFit.cover,
                                        )

                                      ),
                                    );
                                  },
                                ),
                              ),

                              Text(
                                '20/5/2023',
                                style: TextStyle(
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

                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Hiển thị tất cả',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.bottomNaviColor,
                              fontWeight: FontWeight.bold
                            ),
                          ),

                          Icon(Icons.arrow_forward_ios_outlined, color: AppColors.bottomNaviColor, size: 15,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
              child: Text(
                'Có thể bạn sẽ thích',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width-15,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 0),
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    margin: const EdgeInsets.only(left: 15,bottom: 15),
                    //padding: const EdgeInsets.only(bottom: 10,top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 0.25,
                          blurRadius: 2,
                          offset: Offset(0,2),
                        )
                      ],
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 140,
                          width: 115,
                          margin: EdgeInsets.only(right: 10),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: NetworkImage('https://elitetour.com.vn/files/images/VinpearlResort%26SpaHaLong/bang-gia-phong-vinpearl-ha-long-6.jpg'),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 170,
                              child: const Text(
                                'Grand Mariiieee Ha Noi hfjbh sfusifh sfhisf sfhisf sf sfh sfhis fwueihf wufhiw whfi ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
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

                                const Text(
                                  '200 Đánh giá',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors.placeHolderColor
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 8,),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: AppColors.bgTextFeild,
                              ),
                              child: Text(
                                'Tinh Hoa Ẩm Thực Việt',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}