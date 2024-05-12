import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../common/colors/app_colors.dart';
import 'blog_controller.dart';

class BlogList extends GetView<BlogController>{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          //itemCount: controller.listNews.length,
          itemCount:5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext contex,index){
            return  Container(
              margin: EdgeInsets.only(top: 15),
              //color: const Color.fromRGBO(244, 244, 244, 1),
              color: Colors.white,
              constraints: const BoxConstraints(
                minHeight: 430,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
                  //   height: 50,
                  //   child: Text(
                  //     //controller.listNews[index].theme!,
                  //     'chung ta ko thuoc ve nhau',
                  //     style: const TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),

                  Obx(() => Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: PageView(
                          controller: controller.pageController,
                          onPageChanged: (index){
                            controller.ChangePageView(index);
                          },
                          children: [
                            Image(
                              // image: CachedNetworkImageProvider(controller.listNews[index].images[0]),
                              image: NetworkImage('https://alltop.vn/backend/media/images/posts/1385/Bai_viet_gioi_thieu_Ha_Noi_bang_tieng_Anh_-_mau_11-179635.jpg'),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),

                            Image(
                              image: NetworkImage('https://alltop.vn/backend/media/images/posts/1385/Bai_viet_gioi_thieu_Ha_Noi_bang_tieng_Anh_-_mau_11-179635.jpg'),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),

                            Image(
                              image: NetworkImage('https://alltop.vn/backend/media/images/posts/1385/Bai_viet_gioi_thieu_Ha_Noi_bang_tieng_Anh_-_mau_11-179635.jpg'),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),

                            Image(
                              image: NetworkImage('https://alltop.vn/backend/media/images/posts/1385/Bai_viet_gioi_thieu_Ha_Noi_bang_tieng_Anh_-_mau_11-179635.jpg'),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        bottom: 10,
                        left: 40,
                        right: 40,
                        child: DotsIndicator(
                          dotsCount: 4,
                          position:controller.statePageView.value,
                          decorator: DotsDecorator(
                            activeColor: Colors.white,
                            size: const Size.square(8.0),
                            activeSize: const Size(12.0, 8.0),
                            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
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
                      height: 65,
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Text(
                        // controller.listNews[index].title!,
                        'chung ta kho c hshiushf dscsdnc scjisdc shdcisduhc shcisd c sdcsiuc shcuisdc schusihc scuisdch suhdcishc shciusc ',
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
                      //DateFormat.yMMMMd('en_US').format(controller.listNews[index].timestamp!),
                      'hdscjhbsdcjhsd',
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
                      'Comments',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),

                  Visibility(
                    // visible: (controller.listNews[index].last_username!=""),
                    visible: true,
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
                                //text: controller.listNews[index].last_username,
                                text: 'cdbjsdbcjsdbcjd',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                // text: ': ${controller.listNews[index].last_comment}',
                                text: 'cdbjsdbcjsdbcjd',
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
                      //controller.HandleComment(controller.listNews[index].id!);
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
                            backgroundImage:NetworkImage('https://media.themoviedb.org/t/p/w300_and_h450_bestv2/zhurTN2Aqts3joJM8dCPbEt0pZx.jpg'),                          ),
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
                                'Comment...',
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
            );
          }
      ),
    );
  }
}