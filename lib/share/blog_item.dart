import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../common/colors/app_colors.dart';
import '../pages/application/home/home_controller.dart';

 Widget BlogItem (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        // border: Border.all(
        //   color: AppColors.primaryColor1,
        //   width: 1, // Độ dày của viền
        // ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.25,
              blurRadius: 5,
              offset: Offset(0,2),
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            decoration: const BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              image: DecorationImage(
                image: NetworkImage('https://mia.vn/media/uploads/blog-du-lich/kham-pha-ha-noi-voi-5-diem-den-mang-dam-dau-an-van-hoa-thu-do-1-1660048267.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 10, top: 5, right: 5,bottom: 5),
            child: Text(
              'The heart Ha Noi dep vcl the deo noi dieu dau, yeu Ha Noi Khong Ne',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),

          const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 10,),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrMZ0vuW0_p3fSItGn9_r8H3M-S7WQCvUJvG3Em4UXnjD3mxYYqu9QtZl8Y_nWf6q9vBU&usqp=CAU'),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    'Mai Anh',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.heart,size: 20,),
                    Text(
                      '13',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }