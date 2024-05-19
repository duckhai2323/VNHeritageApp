import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../common/colors/app_colors.dart';

Widget HotelItemHorizon(BuildContext context,String image, String name,String content) {
  return  Container(
    width: MediaQuery.of(context).size.width-30,
    height: 130,
    margin: const EdgeInsets.symmetric(horizontal: 15),
    padding: const EdgeInsets.only(bottom: 10,top: 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey.shade200,width: 1.5),
      ),
    ),

    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 110,
          width: 100,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              )
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 170,
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 5,),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColors.bgTextFeild,
              ),
              child: const Text(
                'Di sản văn hóa Việt Nam',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 10,),

            SizedBox(
              width: MediaQuery.of(context).size.width - 170,
              child: Text(
                content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}