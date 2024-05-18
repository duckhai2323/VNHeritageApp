import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/colors/app_colors.dart';

Widget FoodItem (BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    height: 150,
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
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHUyaa3uWoISLDsnNb664rmw-OiJj_63pdBn0aBNzfFw&s'),
                fit: BoxFit.cover,
              )
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 8,left: 10,right: 10),
          height: 50,
          child: Text(
            'Món chả phố cổ rat la ngon kkkkk chung ta ko co nhieu',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
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
      ],
    ),
  );
}