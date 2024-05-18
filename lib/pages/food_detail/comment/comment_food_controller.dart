import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vnheritage/common/document_object/comment_food.dart';
import 'package:vnheritage/pages/application/application_controller.dart';
import 'package:vnheritage/pages/food_detail/food_detail_controller.dart';

import '../../../common/colors/app_colors.dart';

class CommentFoodController extends GetxController {
  var check = false.obs;
  var textController = TextEditingController();
  var food_id = ''.obs;
  var food_name = ''.obs;
  var select = false.obs;
  late List<XFile> listImages = <XFile>[].obs;
  final firebase = FirebaseFirestore.instance;
  late UploadTask uploadTask;
  var clickSelect = false.obs;
  List<String> listUri = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    food_id.value = Get.parameters['id']??"";
    food_name.value = Get.parameters['name']??"";
  }

  Future<void> selectImages() async {
    try{
      List<XFile>? selectImages = await ImagePicker().pickMultiImage();
      if(selectImages.isNotEmpty) {
        listImages.addAll(selectImages);
        clickSelect.value = true;
      }
    } catch(e){
      print(e);
    }
  }

  Future<void> senComment(BuildContext context) async {
    showLoaderDialog(context);
    if(listImages.isNotEmpty) {
      for(var element in listImages) {
        final path = 'comment_food/${element.name}';
        final ref = FirebaseStorage.instance.ref().child(path);
        uploadTask = ref.putFile(File(element.path));
        final snapshot = await uploadTask!.whenComplete(() => {});
        final url = await snapshot.ref.getDownloadURL();
        listUri.add(url);
      }
      String documentId = firebase.collection("food_comments").doc().id;
      var data = CommentFood(food_id.value, ApplicationController.user_id, textController.text.toString(), ApplicationController.user_name, ApplicationController.user_image, DateTime.now(),images: listUri);
      await firebase.collection('food_comments').withConverter(
        fromFirestore: CommentFood.fromFirestore,
        toFirestore: (CommentFood commentFood, options)=>commentFood.toFirestore(),
      ).doc(documentId).set(data);
    }
    Navigator.pop(context);
    Get.back();
  }

  void showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 15),child:Text("Loading...", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: AppColors.bottomNaviColor), )),
        ],),
    );
    showDialog(barrierDismissible: true,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}