import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:vnheritage/pages/food_detail/food_detail_controller.dart';

import '../../common/colors/app_colors.dart';
import '../../share/hotel_item_horizon.dart';

class FoodDetailPage extends GetView<FoodDetailController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: InkWell(
        onTap: (){
          controller.HandleComment();
        },
        child: Container(
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
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Column(
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
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Obx(()=>controller.listFoods.isNotEmpty && controller.listFoodRec.isNotEmpty?SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*1/2+15,
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
                          itemCount: controller.listFoods[0].images.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(controller.listFoods[0].images[index]),
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
                      padding: const EdgeInsets.only(bottom: 1,top: 1),
                      height: 25,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          '${controller.currPage.value}/${controller.listFoods[0].images.length}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                          ),
                        ),
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
                    bottom: 90,
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
                            controller.listFoods.isNotEmpty?controller.listFoods[0].name??"":'',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          Text(
                            controller.listFoods.isNotEmpty?controller.listFoods[0].restaurant??"":'',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
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
                                '${controller.listFoods[0].evaluation} đánh giá',
                                style: const TextStyle(
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
                                child: const Text(
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
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const Icon(Icons.storefront_outlined,color: AppColors.bottomNaviColor,size: 23,),
                                const SizedBox(width: 5,),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      const TextSpan(text: 'Mở cửa | ', style: TextStyle(color: AppColors.bottomNaviColor, fontWeight: FontWeight.w500, fontSize: 15)),
                                      TextSpan(text: ' ${controller.listFoods[0].open}', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500, fontSize: 14)),
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

                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined,size: 25,color: AppColors.bottomNaviColor,),
                              const SizedBox(width: 5,),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width-90,
                                  child: Text(
                                    controller.listFoods.isNotEmpty?controller.listFoods[0].address??"":'',
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
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.25,
                    blurRadius: 2,
                    offset: const Offset(0,2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
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
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 13),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(243, 246, 251, 1),
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

                        const SizedBox(width: 10,),

                        const Text(
                          'Rất tốt',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.bottomNaviColor
                          ),
                        ),

                        const SizedBox(width: 10,),

                        Text(
                          '${controller.listFoods[0].evaluation} đánh giá',
                          style: const TextStyle(
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
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      itemCount: controller.listComment.length>=3?3:controller.listComment.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: MediaQuery.of(context).size.width-58,
                          padding: const EdgeInsets.symmetric(vertical: 15),
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
                                      backgroundImage: NetworkImage(controller.listComment[index].userimage??""),
                                  ),

                                  const SizedBox(width: 10,),

                                  Text(
                                    controller.listComment[index].username??"",
                                    style: const TextStyle(
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

                                  const SizedBox(width: 8,),

                                  const Text(
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
                                controller.listComment[index].title??"",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: controller.listComment[index].images!.length <= 3? 135:260,
                                //color:Colors.blue,
                                child: GridView.builder(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 115,
                                  ),
                                  //itemCount: controller.listImages.length,
                                  itemCount: controller.listComment[index].images!.length,
                                  itemBuilder: (BuildContext context, int current) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            image: NetworkImage(controller.listComment[index].images![current]),
                                            fit: BoxFit.cover,
                                          )

                                      ),
                                    );
                                  },
                                ),
                              ),

                              Text(
                                DateFormat.yMMMMd('en_US').format(controller.listComment[index].timestamp??DateTime.now()),
                                style: const TextStyle(
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

                  const Padding(
                    padding: EdgeInsets.only(top: 15),
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

            const Padding(
              padding: EdgeInsets.only(left: 15,top: 10,bottom: 10),
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
                itemCount: controller.listFoodRec.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      controller.ClickItem(controller.listFoodRec[index].id??"");
                    },
                    child: Container(
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
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(controller.listFoodRec[index].images[0]),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 170,
                                child: Text(
                                  controller.listFoodRec[index].name??"",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
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

                                  Text(
                                    '${controller.listFoodRec[index].evaluation} Đánh giá',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColors.placeHolderColor
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8,),

                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: AppColors.bgTextFeild,
                                ),
                                child: const Text(
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
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 90,),
          ],
        ),
      ):Container(),),
    );
  }
}