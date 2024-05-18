import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:vnheritage/pages/application/application_controller.dart';

import '../../../common/colors/app_colors.dart';
import 'blog_controller.dart';

class BlogList extends GetView<BlogController>{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount:controller.listNews.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext contex,index){
            return  InkWell(
              onTap: (){
                controller.HandleReadBLog(controller.listNews[index].id??"");
              },
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          child: PageView.builder(
                            controller: controller.pageController,
                            onPageChanged: (current){
                              controller.ChangePageView(index,current);
                            },
                            itemCount: controller.listNews[index].images.length,
                            itemBuilder: (BuildContext context, int current) {
                              return Image(
                                image: NetworkImage(controller.listNews[index].images[current]),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),

                        Obx(
                          ()=> Positioned(
                            bottom: 10,
                            left: 40,
                            right: 40,
                            child: DotsIndicator(
                              dotsCount: controller.listNews[index].images.length,
                              position:controller.listPageCurrent[index],
                              decorator: DotsDecorator(
                                activeColor: Colors.white,
                                size: const Size.square(8.0),
                                activeSize: const Size(9.0, 9.0),
                                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          right: 15,
                          bottom: 20,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(73, 73, 73, 0.7),
                                shape: BoxShape.circle
                            ),
                            child: InkWell(
                              onTap: (){
                                // controller.ClickItemHeart();
                              },
                              child: Center(
                                child: Icon(
                                  //controller.checkLove.isTrue ? CupertinoIcons.heart_solid:CupertinoIcons.heart,
                                  CupertinoIcons.heart,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),

                    InkWell(
                      onTap: (){
                        //Get.toNamed(AppRoutes.NEWS,parameters: {'id':controller.listNews[index].id!});
                      },
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        child: Text(
                          controller.listNews[index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15,bottom: 5),
                      child: Text(
                        DateFormat.yMMMMd('en_US').format(controller.listNews[index].timestamp!),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),

                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.grey.shade300,
                      ),
                    ),

                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        'Bình luận',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),

                    Visibility(
                      visible: (controller.listNews[index].last_username!=""),
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: controller.listNews[index].last_username,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: ': ${controller.listNews[index].last_comment}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        controller.HandleComment(controller.listNews[index].id!);
                      },
                      child: Container(
                        color:Colors.white,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 68,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundImage:NetworkImage(ApplicationController.user_image),                          ),
                            Expanded(
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(left: 15,top: 10,bottom: 15),
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color.fromRGBO(244, 244, 244, 1),
                                ),
                                child: const Text(
                                  'Bình luận...',
                                  style: TextStyle(
                                    color: AppColors.placeHolderColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}