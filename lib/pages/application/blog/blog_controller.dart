import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vnheritage/common/routes/names.dart';
import 'package:vnheritage/pages/application/application_controller.dart';

import '../../../common/document_object/blog.dart';

class BlogController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  List<int> listPageCurrent = <int>[].obs;
  List<Blog> listNews = <Blog>[].obs;
  final db = FirebaseFirestore.instance;
  var listener;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetListBlogs();
  }

  void ChangePageView(int index, int current){
    listPageCurrent.removeAt(index);
    listPageCurrent.insert(index, current);
  }

  Future<void> GetListBlogs () async {
    var data = db.collection("blogs").withConverter(
        fromFirestore: Blog.fromFirestore,
        toFirestore: (Blog blog, options) => blog.toFirestore()
    ).where('user_id',isEqualTo:ApplicationController.user_id);
    listNews.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              listNews.insert(0, change.doc.data()!);
              listPageCurrent.add(0);
            }
            break;
          case DocumentChangeType.modified:
            if(change.doc.data()!=null) {
              Blog blog = change.doc.data()!;
              for(int i = 0; i < listNews.length; i++){
                if(listNews[i].id == blog.id){
                  listNews.insert(i, blog);
                  listNews.removeAt(i+1);
                  listPageCurrent.insert(i, 0);
                  listPageCurrent.removeAt(i+1);
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

  void HandleReadBLog (String blog_id){
    Get.toNamed(AppRoutes.READBLOG,parameters: {"id":blog_id});
  }

  void HandleComment(String id){
    Get.toNamed(AppRoutes.COMMENTBLOG,parameters: {'id':id});
  }

  void HandleCreatePage() {
    Get.toNamed(AppRoutes.CREATEBLOG);
  }
}