import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vnheritage/common/document_object/blog.dart';
import 'package:vnheritage/pages/application/application_controller.dart';

import '../../common/colors/app_colors.dart';

class CreateBlogController extends GetxController{
  var check = false.obs;
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var heritage_id = ''.obs;
  var select = false.obs;
  var searchText = ''.obs;
  late List<XFile> listImages = <XFile>[].obs;
  final firebase = FirebaseFirestore.instance;
  late UploadTask uploadTask;
  var clickSelect = false.obs;
  List<String> listUri = <String>[].obs;


  @override
  void onInit() {
    super.onInit();
    textController3.addListener(() {
      searchText.value = textController3.text;
    });
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

  Future<void> CreateBlog(BuildContext context) async {
    showLoaderDialog(context);
    if(listImages.isNotEmpty) {
      for(var element in listImages) {
        final path = 'files/${element.name}';
        final ref = FirebaseStorage.instance.ref().child(path);
        uploadTask = ref.putFile(File(element.path));
        final snapshot = await uploadTask!.whenComplete(() => {});
        final url = await snapshot.ref.getDownloadURL();
        listUri.add(url);
      }
      String documentId = firebase.collection("blogs").doc().id;
      var data = Blog(documentId, textController1.text.toString(), textController2.text.toString(), listUri, ApplicationController.user_id,heritage_id.value,"", "", [], DateTime.now());
      await firebase.collection('blogs').withConverter(
        fromFirestore: Blog.fromFirestore,
        toFirestore: (Blog blog, options)=>blog.toFirestore(),
      ).doc(documentId).set(data);
    }
    Future.delayed(const Duration(seconds: 1));
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

  bool checkValidate (){
    return true;
  }
}