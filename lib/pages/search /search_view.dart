


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vnheritage/common/routes/names.dart';
import 'package:vnheritage/pages/search%20/search_controller.dart';

import '../../common/colors/app_colors.dart';
class SearchPage extends GetView<Search1Controller> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 20,right: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: IconButton(
                  icon: const Icon(Icons.close,size: 30,),
                  iconSize: 23,
                  color: AppColors.bottomNaviColor,
                  onPressed: (){
                    Get.back();
                  },
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 10),
                  child: SizedBox(
                    height: 38,
                    child: TextFormField(
                      controller: controller.textController3,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                        filled: true,
                        fillColor: AppColors.backgroundColor,
                        hintText: 'Nhập địa điểm tham quan',
                        hintStyle: const TextStyle(color: AppColors.placeHolderColor,fontSize: 16,fontFamily: "Roboto Regular", fontWeight: FontWeight.w500),
                        prefixIcon: const Icon(Icons.search,size: 25,color: AppColors.placeHolderColor,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                                color: AppColors.placeHolderColor,
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
                                color: AppColors.placeHolderColor,
                                width: 1
                            )
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const Text(
                'Tìm kiếm',
                style: TextStyle(
                  fontSize: 16,
                  color:  AppColors.bottomNaviColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
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

                    return controller.searchText.isNotEmpty? ListView.builder(
                      itemCount: filteredDocs.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        var data = filteredDocs[index].data() as Map<String, dynamic>;
                        return InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.HERITAGEDETAILS,parameters: {'heritage_id':data['id']});
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
          ],
        ),
      ),
    );
  }
}