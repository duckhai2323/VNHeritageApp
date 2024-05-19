import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vnheritage/common/colors/app_colors.dart';
import 'package:vnheritage/pages/application/home/home_controller.dart';

class ItemBlogHome extends GetView<HomeController> {
  String image;
  String title;
  String user_image;
  String user_name;
  int userLike;

  ItemBlogHome(this.image, this.title, this.user_image, this.user_name, this.userLike);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width/2,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
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
            decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                )
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 10, top: 5, right: 5,bottom: 5),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10,),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(user_image),),
                  const SizedBox(width: 5,),
                  SizedBox(
                    width: 80,
                    child: Text(
                      user_name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          color: AppColors.placeHolderColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
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
                    const Icon(CupertinoIcons.heart,size: 20, color: AppColors.placeHolderColor,),
                    Text(
                      userLike.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.placeHolderColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 15,),

        ],
      ),
    );
  }
}

class ItemBlog {
  String id;
  String image;
  String title;
  String user_image;
  String user_name;
  int userLike;

  ItemBlog(this.id,this.image, this.title, this.user_image, this.user_name, this.userLike);
}