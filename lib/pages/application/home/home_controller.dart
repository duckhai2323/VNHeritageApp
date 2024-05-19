import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnheritage/common/document_object/heritage.dart';
import 'package:vnheritage/common/routes/names.dart';
import 'package:vnheritage/pages/application/home/item_blog.dart';

import '../../../common/document_object/blog.dart';
import '../../../common/document_object/favorite_item.dart';
import '../../../common/document_object/food.dart';
import '../../../common/document_object/user.dart';
import '../application_controller.dart';
import 'home_view.dart';

class HomeController extends GetxController {
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  final db = FirebaseFirestore.instance;
  List<ItemBlog> listBlog1 = <ItemBlog>[].obs;
  List<ItemBlog> listBlog2 = <ItemBlog>[].obs;
  var clickEvent = false.obs;
  var listener;
  List<Heritage> listHeritages = <Heritage>[].obs;
  List<Food> listFoods = <Food>[].obs;

  List<ItemCategory> listCategory = <ItemCategory>[].obs;

  @override
  void onInit() {
    super.onInit();
    listCategory.add(ItemCategory("Di tích", const Icon(Icons.temple_buddhist_rounded, size: 28, color: Colors.white,),));
    listCategory.add(ItemCategory("Sự kiện", const Icon(Icons.home_repair_service, size: 28, color: Colors.white,),));
    listCategory.add(ItemCategory("Nhà hàng", const Icon(Icons.storefront_rounded, size: 28, color: Colors.white,),));
    listCategory.add(ItemCategory("Blog", const Icon(Icons.my_library_books_rounded, size: 28, color: Colors.white,),));
    listCategory.add(ItemCategory("Khách sạn", const Icon(Icons.business_outlined, size: 28, color: Colors.white,),));
    GetListHeritage();
    GetListFood();
    GetListBlogs();
    scrollController = ScrollController()
      ..addListener(() {
        isSliverAppBarExpanded.value = isSliverAppBarExpandedCheck();
      });
  }

  Future<void> GetListHeritage () async {
    var data = await db.collection("heritages").withConverter(
        fromFirestore: Heritage.fromFirestore,
        toFirestore: (Heritage heritage, options) => heritage.toFirestore()
    ).orderBy("timestamp",descending: false);
    listHeritages.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              listHeritages.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            if(change.doc.data()!=null) {
              Heritage heritage = change.doc.data()!;
              for(int i = 0; i < listHeritages.length; i++){
                if(listHeritages[i].id == heritage.id){
                  listHeritages.insert(i, heritage);
                  listHeritages.removeAt(i+1);
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

  Future<void> GetListFood () async {
    var data = await db.collection("foods").withConverter(
        fromFirestore: Food.fromFirestore,
        toFirestore: (Food food, options) => food.toFirestore()
    ).orderBy("timestamp",descending: false);
    listFoods.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              listFoods.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            if(change.doc.data()!=null) {
              Food food = change.doc.data()!;
              for(int i = 0; i < listFoods.length; i++){
                if(listFoods[i].id == food.id){
                  listFoods.insert(i, food);
                  listFoods.removeAt(i+1);
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



  bool isSliverAppBarExpandedCheck () {
    return scrollController.hasClients &&
        scrollController.offset > 350;
  }

  void HandleHeritageDetailsPage (String heritage_id){
    Get.toNamed(AppRoutes.HERITAGEDETAILS,parameters: {"heritage_id":heritage_id});
  }

  Future<void> ClickItemHeart(int index) async {
    final itemData = listHeritages[index];
    if(listHeritages[index].userlike.contains(ApplicationController.user_id)){
      itemData.userlike.remove(ApplicationController.user_id);
      listHeritages.insert(index,itemData);
      listHeritages.removeAt(index+1);
      await db.collection("users").doc(ApplicationController.user_id).collection("favorites").doc(itemData.id).delete();
    }else {
      itemData.userlike.add(ApplicationController.user_id);
      listHeritages.insert(index,itemData);
      listHeritages.removeAt(index+1);
      final favoriterItem = FavoriteItem(itemData.id, itemData.title, itemData.images[0], itemData.evaluation, DateTime.now());
      await db.collection("users").doc(ApplicationController.user_id).collection("favorites").withConverter(
          fromFirestore: FavoriteItem.fromFirestore,
          toFirestore: (FavoriteItem favoriteItem, options) => favoriteItem.toFirestore()
      ).doc(itemData.id).set(favoriterItem);
    }
    await db.collection("heritages").doc(listHeritages[index].id).update({
      "userlike":List<String>.from(itemData.userlike ?? []),
    });
  }



  Future<void> GetListBlogs () async {
    var data = db.collection("blogs").withConverter(
        fromFirestore: Blog.fromFirestore,
        toFirestore: (Blog blog, options) => blog.toFirestore()
    ).orderBy("timestamp",descending: false);
    listBlog1.clear();
    listBlog2.clear();
    listener = data.snapshots().listen((event) async {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              if(listBlog1.length <= listBlog2.length) {
                Blog blog = change.doc.data()!;
                final ref = db.collection('users').doc(blog.user_id).withConverter(
                  fromFirestore: UserClient.fromFirestore,
                  toFirestore: (UserClient userdata, options)=>userdata.toFirestore(),
                );
                final user = await ref.get();
                listBlog1.add(ItemBlog(blog.id??"",blog.images[0],blog.title??"", user.data()?.image??"", user.data()?.fullName??"", blog.userlike.length));
              } else {
                Blog blog = change.doc.data()!;
                final ref = db.collection('users').doc(blog.user_id).withConverter(
                  fromFirestore: UserClient.fromFirestore,
                  toFirestore: (UserClient userdata, options)=>userdata.toFirestore(),
                );
                final user = await ref.get();
                listBlog2.add(ItemBlog(blog.id??"",blog.images[0],blog.title??"", user.data()?.image??"", user.data()?.fullName??"", blog.userlike.length));
              }
            }
            break;
          case DocumentChangeType.modified:
            if(change.doc.data()!=null) {
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
  }

  void HandleReadBLog (String blog_id){
    Get.toNamed(AppRoutes.READBLOG,parameters: {"id":blog_id});
  }

  void ClickEvent() {
    clickEvent.value = !clickEvent.value;
  }

  void HandleFoodDetail(String id){
    Get.toNamed(AppRoutes.FOOD,parameters: {"id":id});
  }
}

class ItemCategory {
  final String title;
  final Icon icon;
  ItemCategory(this.title, this.icon);
}