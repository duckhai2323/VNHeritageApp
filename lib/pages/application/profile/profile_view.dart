import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnheritage/pages/application/profile/profile_controller.dart';

import '../../../common/colors/app_colors.dart';

class ProfilePage extends GetView<ProfileController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
            const SizedBox(
              height: 30,
              width: 30,
            ),
            const Text(
              'Cá nhân',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.bottomNaviColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            InkWell(
              onTap: (){
                //controller.HandleCreatePage();
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.bottomNaviColor
                ),
                child: Icon(Icons.settings,color: Colors.white,size: 20,),
              ),
            ),
          ],
        ),
      ),
      body: Obx(()=>controller.profile.isNotEmpty?Container(
        //margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3-45,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image(
                      width: MediaQuery.of(context).size.width,
                      height: 135,
                      image: const NetworkImage('https://hoangthanhthanglong.com/store/uploads/2022/11/z3898777494411_5a9d221e3f5e78621037ef8c7bcfcd90.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: MediaQuery.of(context).size.width/2-40,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap:(){
                            controller.pickImage();
                          },
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.grey,
                            child:ClipOval(child: controller.checkClickImage.isFalse?Image(image: NetworkImage(controller.profile[0].image??""),):Image.file(controller.image.value!),),
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 3,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.bottomNaviColor,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: AppColors.backgroundColor,
                              child: Icon(Icons.camera_alt,size: 22,color: Colors.grey,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                controller.profile[0].fullName??"",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                controller.profile[0].email??"",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 15,top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '* Ngày sinh',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.bottomNaviColor
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width-30,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1,
                          color: AppColors.bottomNaviColor
                      ),
                    ),
                    child: Text(
                        controller.profile[0].birthday??"",
                      style: const TextStyle(
                          fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 15,top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '* Số điện thoại',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.bottomNaviColor
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width-30,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1,
                          color: AppColors.bottomNaviColor
                      ),
                    ),
                    child: Text(
                        controller.profile[0].numberphone??"",
                      style: const TextStyle(
                          fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 15,top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '* Địa chỉ',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.bottomNaviColor
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width-30,
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1,
                          color: AppColors.bottomNaviColor
                      ),
                    ),
                    child: Text(
                        controller.profile[0].address??"",
                      style: const TextStyle(
                          fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ):Container()),
    );
  }
}