import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnheritage/pages/application/home/home_controller.dart';

import '../common/colors/app_colors.dart';

class HeritageItem extends GetView<HomeController> {

  BuildContext context;
  int index;
  String title;
  String image;
  String evaluation;
  Icon icon;

  HeritageItem(this.context,this.index, this.title, this.image, this.evaluation, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 160,
      width: 165,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.15,
              blurRadius: 2,
              offset: Offset(0,2),
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                )
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(onTap: (){
                    controller.ClickItemHeart(index);
                  },child: icon),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 3),
            height: 50,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                      TextSpan(text: '/5', style: TextStyle(color:AppColors.placeHolderColor ,fontWeight: FontWeight.w500, fontSize: 13)),
                    ],
                  ),
                ),
              ),

              Text(
                '$evaluation Đánh giá',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.placeHolderColor
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}