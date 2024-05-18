
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../common/document_object/comment.dart';
import '../../application/application_controller.dart';

class CommentController extends GetxController{
  final listComment = <Comment>[].obs;
  var commentText = TextEditingController();
  final db = FirebaseFirestore.instance;
  var listener;
  late String id;
  final delay = false.obs;
  @override
  void onInit() async {
    super.onInit();
    id = Get.parameters['id']??"";
    GetComment(id.toString());
  }

  Future<void> GetComment(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    final data = await db.collection("comments").withConverter(
        fromFirestore: Comment.fromFirestore,
        toFirestore: (Comment comment, options) => comment.toFirestore()
    ).where("id_blog",isEqualTo: id);
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
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
    delay.value = true;
  }

  Future<void> SendComment(String commentStr) async {
    final comment = Comment(id,ApplicationController.user_id,commentStr,ApplicationController.user_name,ApplicationController.user_image,DateTime.now());
    await db.collection('comments').withConverter(
        fromFirestore: Comment.fromFirestore,
        toFirestore: (Comment comment, options) => comment.toFirestore()
    ).add(comment).then((DocumentReference doc){});

    await db.collection('blogs').doc(id).update({
      "last_username":ApplicationController.user_name,
      "last_comment":commentStr,
    });
    //GetComment(id);
  }
}