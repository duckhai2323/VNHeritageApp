import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vnheritage/common/document_object/blog.dart';
import 'package:vnheritage/common/document_object/heritage.dart';
import 'package:vnheritage/common/document_object/user.dart';

import '../../common/routes/names.dart';
import '../application/home/item_blog.dart';

class ReadBlogController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  final statePageView = 0.obs;
  List<Blog> blogs = <Blog>[].obs;
  List<Heritage> heritages = <Heritage>[].obs;
  final db = FirebaseFirestore.instance;
  List<UserClient>  users = <UserClient>[].obs;
  var id = ''.obs;
  var listener;
  List<ItemBlog> listBlog1 = <ItemBlog>[].obs;
  List<ItemBlog> listBlog2 = <ItemBlog>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    id.value = Get.parameters['id']??"";
    GetData();
    GetListBlogs();
  }

  Future<void> GetData() async {
    blogs.clear();
    heritages.clear();
    users.clear();
    await Future.delayed(const Duration(seconds: 2));
    final data = await db.collection("blogs").doc(id.value).withConverter(
        fromFirestore: Blog.fromFirestore,
        toFirestore: (Blog news, options) => news.toFirestore()
    ).get();
    blogs.add(data.data()!);
    final ref = db.collection('users').doc(blogs[0].user_id).withConverter(
      fromFirestore: UserClient.fromFirestore,
      toFirestore: (UserClient userdata, options)=>userdata.toFirestore(),
    );
    final user = await ref.get();
    users.add(user.data()!);

    final heritageRef = db.collection('heritages').doc(blogs[0].heritage_id).withConverter(
      fromFirestore: Heritage.fromFirestore,
      toFirestore: (Heritage heritage, options)=>heritage.toFirestore(),
    );
    final heritage = await heritageRef.get();
    heritages.add(heritage.data()!);
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
            if(change.doc.data()!=null && change.doc.data()!.id != id.value) {
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


  void HandleHeritageDetailsPage (String heritage_id){
    Get.toNamed(AppRoutes.HERITAGEDETAILS,parameters: {"heritage_id":heritage_id});
  }

  void ChangePageView(int index){
    statePageView.value = index;
  }

  void HandleComment(){
    Get.toNamed(AppRoutes.COMMENTBLOG,parameters: {'id':id.value});
  }
}