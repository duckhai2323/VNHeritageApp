import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vnheritage/common/document_object/comment_food.dart';
import 'package:vnheritage/common/routes/names.dart';

import '../../common/document_object/food.dart';

class FoodDetailController extends GetxController {
  final db = FirebaseFirestore.instance;
  final listComment = <CommentFood>[].obs;
  PageController pageController = PageController();
  var listener;
  final id= ''.obs;
  List<Food> listFoods = <Food>[].obs;
  List<Food> listFoodRec = <Food>[].obs;


  var currPage = 1.obs;
  void HandlePage(int index) {
    currPage.value = index+1;
  }

  @override
  void onInit() {
    super.onInit();
    id.value = Get.parameters['id']??"";
    GetData();
    GetComment();
    GetListFood();
  }

  Future<void> GetData() async {
    listFoods.clear();
    await Future.delayed(const Duration(seconds: 0));
    final data = await db.collection("foods").withConverter(
        fromFirestore: Food.fromFirestore,
        toFirestore: (Food food, options) => food.toFirestore()
    ).where("id",isEqualTo: id.value).get();

    if(data.docs.isNotEmpty){
      listFoods.add(data.docs[0].data());
    }
  }

  Future<void> GetComment() async {
    await Future.delayed(const Duration(seconds: 1));
    final data = await db.collection("food_comments").withConverter(
        fromFirestore: CommentFood.fromFirestore,
        toFirestore: (CommentFood comment, options) => comment.toFirestore()
    ).where("id_blog",isEqualTo: id.value);
    listComment.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              listComment.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            if(change.doc.data()!=null) {
              listComment.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
  }

  Future<void> GetListFood () async {
    var data = await db.collection("foods").withConverter(
        fromFirestore: Food.fromFirestore,
        toFirestore: (Food food, options) => food.toFirestore()
    ).orderBy("timestamp",descending: false);
    listFoodRec.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null && change.doc.data()!.id != id.value) {
              listFoodRec.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            if(change.doc.data()!=null) {
              Food food = change.doc.data()!;
              for(int i = 0; i < listFoodRec.length; i++){
                if(listFoodRec[i].id == food.id){
                  listFoodRec.insert(i, food);
                  listFoodRec.removeAt(i+1);
                }
              }
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
  }

  void ClickItem(String id_str) {
    id.value = id_str;
    GetData();
    GetComment();
    GetListFood();
  }


  void HandleComment() {
    Get.toNamed(AppRoutes.COMMENTFOOD, parameters: {'id':id.value, 'name':listFoods[0].name??""});
  }


}