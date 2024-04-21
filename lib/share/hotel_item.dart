import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../common/colors/app_colors.dart';

Widget HotelItem (BuildContext context) {
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
                image: NetworkImage('https://vcdn1-dulich.vnecdn.net/2022/07/29/hypat-1659069584-1659081355-1659095800.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=DOVzqNrlo-W0PARbtYdxWw'),
                fit: BoxFit.cover,
              )
          ),
          child: const Stack(
            children: [
              Positioned(
                top: 10,
                right: 10,
                child: Icon(CupertinoIcons.heart,color: Colors.white,size: 25,),
              ),
            ],
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Text(
            'Hồ Hoàn Kiếm',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 16,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
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
                    TextSpan(text: '4,5', style: TextStyle(color: AppColors.placeHolderColor, fontWeight: FontWeight.w500, fontSize: 14)),
                    TextSpan(text: '/5', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 13)),
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