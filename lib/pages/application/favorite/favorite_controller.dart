import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../common/document_object/favorite_item.dart';
import '../../../common/routes/names.dart';
import '../application_controller.dart';

class FavoriteController extends GetxController {
  List<FavoriteItem> listFavor1 = <FavoriteItem>[].obs;
  List<FavoriteItem> listFavor2 = <FavoriteItem>[].obs;
  final db = FirebaseFirestore.instance;
  var listener;
  @override
  void onInit() {
    super.onInit();
    GetData();
  }

  Future<void> GetData() async {
    var data = await db.collection("users").doc(ApplicationController.user_id).collection("favorites").withConverter(
        fromFirestore: FavoriteItem.fromFirestore,
        toFirestore: (FavoriteItem favoriteItem, options) => favoriteItem.toFirestore()
    ).orderBy("timestamp",descending: false);
    listFavor1.clear();
    listFavor2.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              if(listFavor1.length <= listFavor2.length) {
                listFavor1.insert(0, change.doc.data()!);
              } else {
                listFavor2.insert(0, change.doc.data()!);
              }
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            if (change.doc.data() != null) {
              FavoriteItem removedItem = change.doc.data()!;
              listFavor1.removeWhere((item) => item.id == removedItem.id);
              listFavor2.removeWhere((item) => item.id == removedItem.id);
            }
            break;
        }
      }
    });
  }

  void HandleHeritageDetailsPage (String heritage_id){
    Get.toNamed(AppRoutes.HERITAGEDETAILS,parameters: {"heritage_id":heritage_id});
  }
}