import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../common/colors/app_colors.dart';

Widget HotelItemHorizon(BuildContext context) {
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
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
            SizedBox(height: 15,),
            Container(
              width:MediaQuery.of(context).size.width - 170,

              child: Center(
                child: RichText(
                  text: const TextSpan(
                      text:  'Price: ',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 1
                      ),
                      children: [
                        TextSpan(
                            text: '300.000 d',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ]
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}