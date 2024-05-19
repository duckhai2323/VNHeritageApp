import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vnheritage/common/routes/names.dart';
import 'package:vnheritage/pages/application/application_controller.dart';

import '../../common/document_object/blog.dart';
import '../../common/document_object/favorite_item.dart';
import '../../common/document_object/heritage.dart';
import '../../common/document_object/user.dart';
import '../application/home/item_blog.dart';

class HeritageDetailsController extends GetxController {
  final db = FirebaseFirestore.instance;
  PageController pageController = PageController();
  var listener;
  List<ItemBlog> listBlog1 = <ItemBlog>[].obs;
  List<ItemBlog> listBlog2 = <ItemBlog>[].obs;
  final checkSave = false.obs;
  var clickMore = false.obs;
  List<Heritage> listHeritages = <Heritage>[].obs;
  List<Heritage> listHeritagesDiff = <Heritage>[].obs;
  final heritage_id = ''.obs;

  var currPage = 1.obs;
  void HandlePage(int index) {
    currPage.value = index+1;
  }

  @override
  void onInit() {
    super.onInit();
    heritage_id.value = Get.parameters['heritage_id']??"";
    GetData();
    GetListBlogs();
    GetListHeritages();
  }

  void ClickMoreRead() {
    clickMore.value = !clickMore.value;
  }

  Future<void> GetData() async {
    listHeritages.clear();
    await Future.delayed(const Duration(seconds: 0));
    final data = await db.collection("heritages").withConverter(
        fromFirestore: Heritage.fromFirestore,
        toFirestore: (Heritage house, options) => house.toFirestore()
    ).where("id",isEqualTo: heritage_id.value).get();

    if(data.docs.isNotEmpty){
      listHeritages.add(data.docs[0].data());
    }
    if(listHeritages[0].userlike.contains(ApplicationController.user_id)){
      checkSave.value = true;
    }
  }

  Future<void> GetListBlogs () async {
    var data = db.collection("blogs").withConverter(
        fromFirestore: Blog.fromFirestore,
        toFirestore: (Blog blog, options) => blog.toFirestore()
    ).where('heritage_id', isEqualTo: heritage_id.value);
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
              // Blog blog = change.doc.data()!;
              // for(int i = 0; i < listBlog1.length; i++){
              //   if(listBlog1[i].id == blog.id){
              //     listBlog1.insert(i, blog);
              //     listBlog1.removeAt(i+1);
              //   }
              // }
              //
              // for(int i = 0; i < listBlog2.length; i++){
              //   if(listBlog2[i].id == blog.id){
              //     listBlog2.insert(i, blog);
              //     listBlog2.removeAt(i+1);
              //   }
              // }
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
  }

  Future<void> GetListHeritages() async {
    var data = await db.collection("heritages").withConverter(
        fromFirestore: Heritage.fromFirestore,
        toFirestore: (Heritage heritage, options) => heritage.toFirestore()
    ).orderBy("timestamp",descending: false);
    listHeritagesDiff.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null && change.doc.data()!.id != heritage_id.value) {
              listHeritagesDiff.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            if(change.doc.data()!=null) {
              Heritage heritage = change.doc.data()!;
              for(int i = 0; i < listHeritagesDiff.length; i++){
                if(listHeritagesDiff[i].id == heritage.id){
                  listHeritagesDiff.insert(i, heritage);
                  listHeritagesDiff.removeAt(i+1);
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



  void ClickItemHeart() async {
    final itemData = listHeritages[0];
    if(checkSave.isTrue){
      itemData.userlike.remove(ApplicationController.user_id);
      await db.collection("users").doc(ApplicationController.user_id).collection("favorites").doc(itemData.id).delete();
      checkSave.value = false;
    }else {
      itemData.userlike.add(ApplicationController.user_id);
      final favoriterItem =  FavoriteItem(itemData.id, itemData.title, itemData.images[0], itemData.evaluation, DateTime.now());
      await db.collection("users").doc(ApplicationController.user_id).collection("favorites").withConverter(
          fromFirestore: FavoriteItem.fromFirestore,
          toFirestore: (FavoriteItem favoriteItem, options) => favoriteItem.toFirestore()
      ).doc(itemData.id).set(favoriterItem);
      checkSave.value = true;
    }
    await db.collection("heritages").doc(itemData.id).update({
      "userlike":List<String>.from(itemData.userlike ?? []),
    });
  }


  void HandleReadBLog (String blog_id){
    Get.toNamed(AppRoutes.READBLOG,parameters: {"id":blog_id});
  }

  void ClickItemDiff(String id) {
    heritage_id.value = id;
    GetData();
    GetListBlogs();
    GetListHeritages();
  }
}