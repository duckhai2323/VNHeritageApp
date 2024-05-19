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
  String description;
  Icon icon;

  HeritageItem(this.context,this.index, this.title, this.image, this.description, this.icon);

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

          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.bottomNaviColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}