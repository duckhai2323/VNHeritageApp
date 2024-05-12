import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vnheritage/pages/read_blog/read_blog_controller.dart';

import '../../common/colors/app_colors.dart';
import '../../share/blog_item.dart';

class ReadBLogPage extends GetView<ReadBlogController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1,
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 23,
                  color: AppColors.bottomNaviColor,
                  onPressed: (){

                  },
                ),
              ],
            ),
            const Text(
              'Khoanh khac du lich',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.bottomNaviColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            InkWell(
              onTap: (){

              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.bottomNaviColor
                ),
                child: Icon(Icons.add,color: Colors.white,size: 20,),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage:NetworkImage('https://media.themoviedb.org/t/p/w300_and_h450_bestv2/zhurTN2Aqts3joJM8dCPbEt0pZx.jpg'),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5,),
                          const Text(
                            'Khai ne',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          Container(
                              height: 25,
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              color: const Color.fromRGBO(248, 224, 222,1),
                              child: const Center(
                                child: Text(
                                  'Travel Expert',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(209, 92, 72,1)
                                  ),
                                ),
                              )
                          ),
                          const SizedBox(height: 5,),
                        ],
                      ),
                    ],
                  ),

                  Container(
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
                          CupertinoIcons.heart,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: MediaQuery.of(context).size.height*1/3,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index){
                  controller.ChangePageView(index);
                },
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*1/3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://nhiepanhhanoi.org.vn/wp-content/uploads/2020/11/6-640x455.jpg'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*1/3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://nhiepanhhanoi.org.vn/wp-content/uploads/2020/11/6-640x455.jpg'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*1/3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://nhiepanhhanoi.org.vn/wp-content/uploads/2020/11/6-640x455.jpg'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*1/3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://nhiepanhhanoi.org.vn/wp-content/uploads/2020/11/6-640x455.jpg'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Obx(()=> DotsIndicator(
                  dotsCount: 4,
                  position:controller.statePageView.value,
                  decorator: DotsDecorator(
                    activeColor: AppColors.bottomNaviColor,
                    size: const Size.square(8.0),
                    activeSize: const Size(10.0, 10.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Ho Hoan Kiem',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 10),
              child: Text('Sáng nay (5/5), chào mừng Kỷ niệm 70 năm Chiến thắng lịch sử Điện Biên Phủ, hơn 30 nghìn hội viên, phụ nữ Thủ đô đồng loạt thực hiện màn đồng diễn dân vũ tại 579 xã, phường, thị trấn. Đây là những màn đồng diễn được thực hiện trên nền nhạc 3 ca khúc “Qua miền Tây Bắc”, “Chiến thắng Điện Biên” và “Inh lả ơi”.',
                maxLines: 12,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 20,left: 15,right: 15),
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5)
                ),
                color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.25,
                      blurRadius: 10,
                      offset: Offset(0,2),
                    )
                  ]
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 130,
                    width: 120,
                    margin: const EdgeInsets.only(right: 10),
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
                      const SizedBox(height: 5,),
                      const Text('Ho Hoan Kiem',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: 5,),

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

                      const SizedBox(height: 5,),

                      const Row(
                        children: [
                          Icon(Icons.location_on,size: 20,color: Colors.grey,),
                          Text(
                            'Ha Noi',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.placeHolderColor
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 180,),
                          Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.bottomNaviColor,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: const Center(
                              child: Text(
                                'Xem',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),


            Container(
              height: 120,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Comments',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          //controller.HandleComment();
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            //color: AppColors.backgroundIntro,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const Icon(Icons.arrow_forward_ios,size: 16,color: AppColors.bottomNaviColor,)
                    ],
                  ),

                  //const SizedBox(height: 10,),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage('https://nhiepanhhanoi.org.vn/wp-content/uploads/2020/11/6-640x455.jpg'),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                           // controller.HandleComment();
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 15,bottom: 15,top: 15),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:15,bottom: 5),
              child: Text(
                'Khoảnh khắc liên quan',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.only(left: 15,right: 5),
                    child: ListView.builder(
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return BlogItem(context);
                      },
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.only(right: 15,left: 5),
                    child: ListView.builder(
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return BlogItem(context);
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}