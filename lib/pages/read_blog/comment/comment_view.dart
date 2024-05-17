import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

import '../../../common/colors/app_colors.dart';
import 'comment_controller.dart';

class CommentPage extends GetView<CommentController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomSheet:  Container(
        width: MediaQuery.sizeOf(context).width,
        constraints: const BoxConstraints(
          minHeight: 70,
        ),
        padding: const EdgeInsets.only(left: 15,right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: TextField(
                  controller: controller.commentText,
                  style: const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 5,left: 10),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    suffixIcon: const Icon(Icons.insert_emoticon_rounded,color: AppColors.bottomNaviColor,size: 25,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.grey.shade200,width: 1),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: AppColors.bottomNaviColor),
                    ),
                    hintText: 'Aa',
                    hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,),
                  ),
                  onTap: (){
                  },
                ),
              ),
            ),

            const SizedBox(width: 10,),

            InkWell(
                onTap: (){
                  String text = controller.commentText.text.toString();

                  if(text!=""){
                    controller.SendComment(text);
                  }
                  controller.commentText.text = "";
                },
                child: const Icon(Icons.arrow_forward_ios,size: 20,color: AppColors.bottomNaviColor)
            ),
          ],
        ),
      ),
      appBar:  AppBar(
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
              'Bình luận',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.bottomNaviColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              width: 32,
              height: 32,
            ),
          ],
        ),
      ),
      body: Obx(
          ()=> controller.listComment.isNotEmpty?ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              Obx(() => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.listComment.length,
                itemBuilder: (BuildContext context, index){
                  return CommentItem(context,controller.listComment[index].userimage!, controller.listComment[index].title!, controller.listComment[index].username!, controller.listComment[index].timestamp!);
                },
              ),),
            ],
          ),
        ):Container(),
      ),
    );
  }
  Widget CommentItem(BuildContext context,String image, String title, String username, DateTime dateTime){
    var date = DateFormat.yMMMMd('en_US').format(dateTime);
    return Container(
      width: MediaQuery.sizeOf(context).width,
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.bgTextFeild,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 23,
            backgroundImage: CachedNetworkImageProvider(image),
          ),

          const SizedBox(width: 10,),

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 3,),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.placeHolderColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 5,),
        ],
      ),
    );
  }
}