import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnheritage/pages/application/favorite/favorite_controller.dart';

import '../../../common/colors/app_colors.dart';

class FavoritePage extends GetView<FavoriteController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1,
          ),
        ),
        title: const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              ],
            ),
            Text(
              'Yêu thích',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.bottomNaviColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          width: MediaQuery.of(context).size.width,
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: ListView.builder(
                  itemCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width/2,
                      margin: EdgeInsets.only(left: 15,bottom: 10,right: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
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
                            height: 150,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                              ),
                              image: DecorationImage(
                                image: NetworkImage('https://vcdn1-dulich.vnecdn.net/2022/05/11/hoan-kiem-lake-7673-1613972680-1508-1652253984.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=2wB1cBTUcNKuk68nrG6LMQ'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  right: 15,
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                        color: Color.fromRGBO(73, 73, 73, 0.5),
                                        shape: BoxShape.circle
                                    ),
                                    child: InkWell(
                                      onTap: (){
                                        //controller.ClickItemHeart(index);
                                      },
                                      child:const Center(
                                        child: Icon(
                                          CupertinoIcons.heart_fill,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: Text(
                              'Vuong quoc trung khanh fsufsf hsfsf sbfsj usbf ufgs hsihf',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: '4,5', style: TextStyle(color: AppColors.bottomNaviColor, fontWeight: FontWeight.w500, fontSize: 15)),
                                  TextSpan(text: '/5 . 3.036 danh gia', style: TextStyle(color: AppColors.placeHolderColor,fontWeight: FontWeight.w500, fontSize: 15)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: ListView.builder(
                  itemCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        width: MediaQuery.of(context).size.width/2,
                        margin: EdgeInsets.only(right: 15,bottom: 10,left: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
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
                              height: 150,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage('https://vcdn1-dulich.vnecdn.net/2022/05/11/hoan-kiem-lake-7673-1613972680-1508-1652253984.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=2wB1cBTUcNKuk68nrG6LMQ'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    right: 15,
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: const BoxDecoration(
                                          color: Color.fromRGBO(73, 73, 73, 0.5),
                                          shape: BoxShape.circle
                                      ),
                                      child: InkWell(
                                        onTap: (){
                                          //controller.ClickItemHeart(index);
                                        },
                                        child:const Center(
                                          child: Icon(
                                            CupertinoIcons.heart_fill,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              child: Text(
                                'Vuong quoc trung',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: RichText(
                                text: const TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: '4,5', style: TextStyle(color: AppColors.bottomNaviColor, fontWeight: FontWeight.w500, fontSize: 15)),
                                    TextSpan(text: '/5 . 3.036 danh gia', style: TextStyle(color: AppColors.placeHolderColor,fontWeight: FontWeight.w500, fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}