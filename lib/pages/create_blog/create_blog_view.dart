import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vnheritage/pages/create_blog/create_blog_controller.dart';
import 'dart:io';
import '../../common/colors/app_colors.dart';

class CreateBlogPage extends GetView<CreateBlogController> {

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
              'Tạo Bài Viết',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.bottomNaviColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            InkWell(
              onTap: (){
                controller.CreateBlog(context);
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
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                child: Row(
                  children: [
                    const Icon(Icons.mode_edit_outlined,color: AppColors.bottomNaviColor,size: 25,),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width:MediaQuery.of(context).size.width-100,
                      child: const Text(
                          'Chia sẻ những giá trị, vẻ đẹp di sản văn hóa Việt Nam tới mọi người',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.bottomNaviColor
                          )
                      ),
                    ),
                  ],
                ),
              ),

              Obx(() => controller.clickSelect.value?Container(
                width: MediaQuery.of(context).size.width,
                height: controller.listImages.length <= 3? 130:260,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: controller.listImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.file(File(controller.listImages[index].path),fit: BoxFit.cover);
                  },
                ),
              ):InkWell(
                onTap: (){
                  controller.selectImages();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  width: MediaQuery.of(context).size.width-60,
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
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '* Địa điểm tham quan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.bottomNaviColor,
                      ),
                    ),

                    SizedBox(height: 5,),

                    TextFormField(
                      controller: controller.textController3,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: AppColors.backgroundColor,
                        hintText: 'Nhập địa điểm tham quan',
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

              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("heritages").snapshots(),
                  builder: (BuildContext context, snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
                      return const Center(
                        child: Text("No data available"),
                      );
                    }
                    return Obx(() {
                      final filteredDocs = snapshots.data!.docs.where((doc) {
                        var data = doc.data() as Map<String, dynamic>;
                        return removeDiacritics(data['title'].toString())
                            .toLowerCase()
                            .replaceAll(RegExp(r"\s"), "")
                            .contains(removeDiacritics(controller.searchText.value.toLowerCase()).replaceAll(RegExp(r"\s"), ""));
                      }).toList();

                      return (controller.searchText.isNotEmpty && controller.select.isFalse)? ListView.builder(
                        itemCount: filteredDocs.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          var data = filteredDocs[index].data() as Map<String, dynamic>;
                          return InkWell(
                            onTap: () {
                              controller.textController3.text = data['title'];
                              controller.select.value = true;
                              controller.heritage_id.value = data['id'];
                            },
                            child: ListTile(
                              title: Text(
                                data['title'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['province'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(data['images'][0]),
                              ),
                            ),
                          );
                        },
                      ):Container();
                    });
                  },
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '* Tiêu đề',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.bottomNaviColor,
                      ),
                    ),
          
                    SizedBox(height: 5,),
          
                    TextFormField(
                      controller: controller.textController1,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: AppColors.backgroundColor,
                        hintText: 'Nhập tiêu đề bài viết',
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
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
                      controller: controller.textController2,
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
                        hintText: 'Nhập nội dung bài viết',
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
                        text: '* Tôi đã đọc và đồng ý với ',
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

              SizedBox(height: 30,),
            ],
          ),
        ),
      )
    );
  }
}