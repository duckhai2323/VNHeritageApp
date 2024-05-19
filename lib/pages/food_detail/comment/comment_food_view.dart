import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vnheritage/pages/food_detail/comment/comment_food_controller.dart';

import '../../../common/colors/app_colors.dart';

class CommentFoodPage extends GetView<CommentFoodController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(244, 244, 244, 1),
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
              'Đánh giá',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.bottomNaviColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            InkWell(
              onTap: (){
                controller.senComment(context);
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.bottomNaviColor
                ),
                child: Icon(CupertinoIcons.checkmark_seal_fill,color: Colors.white,size: 20,),
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
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              color: Colors.white,
              child: Text(
                controller.food_name.value,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
        
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              color: Colors.white,
              child: Column(
                children: [
                  Obx(() => controller.clickSelect.value?Container(
                    width: MediaQuery.of(context).size.width,
                    height: controller.listImages.length <= 3? 120:240,
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 115,
                      ),
                      itemCount: controller.listImages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.file(File(controller.listImages[index].path),fit: BoxFit.cover));
                      },
                    ),
                  ):InkWell(
                    onTap: (){
                      controller.selectImages();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1,
                            color: AppColors.bottomNaviColor
                        ),
                      ),
        
                      child: const Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt,color: AppColors.bottomNaviColor,size: 45,),
                            SizedBox(height: 5,),
                            Text(
                              'Đăng từ 1 đến 6 hình ảnh',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.placeHolderColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),),
        
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '* Nội dung',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.bottomNaviColor,
                          ),
                        ),
        
                        SizedBox(height: 5,),
        
                        TextFormField(
                          controller: controller.textController,
                          maxLines: 6,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            filled: true,
                            fillColor: AppColors.backgroundColor,
                            hintText: 'Hãy chia sẻ một chút về trải nghiệm của bạn...',
                            hintStyle: const TextStyle(color: AppColors.placeHolderColor,fontSize: 16,fontFamily: "Roboto Regular", fontWeight: FontWeight.w500),
                            //prefixIcon: icon,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: AppColors.bottomNaviColor,
                                    width: 1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide:  const BorderSide(
                                    color: AppColors.bottomNaviColor,
                                    width: 1
                                )
                            ),
        
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide:  const BorderSide(
                                    color: AppColors.bottomNaviColor,
                                    width: 1
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  Row(
                    children: [
                      Obx(() =>  Checkbox(
                        focusColor: AppColors.bottomNaviColor,
                        activeColor:  AppColors.bottomNaviColor,
                        value: controller.check.value,
                        onChanged: (bool? value) {
                          controller.check.value = value!;
                        },
                      ),),
                      Container(
                        width: MediaQuery.of(context).size.width-105,
                        margin: EdgeInsets.only(left: 5,right:15,top: 10),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Bằng việc đăng tải những hình ảnh này lên, tôi đã đọc và đồng ý với ',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.placeHolderColor,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Điều khoản dịch vụ ', style: TextStyle(color: AppColors.bottomNaviColor,)),
                              TextSpan(text: 'và ', style: TextStyle(color:AppColors.placeHolderColor,)),
                              TextSpan(text: 'Chính sách bảo mật ', style: TextStyle(color: AppColors.bottomNaviColor,)),
                              TextSpan(text: 'của VNHeritage', style: TextStyle(color: AppColors.placeHolderColor,)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
        
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}