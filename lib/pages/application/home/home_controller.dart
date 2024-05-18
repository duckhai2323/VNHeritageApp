import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vnheritage/common/document_object/heritage.dart';
import 'package:vnheritage/common/routes/names.dart';

import '../../../common/document_object/food.dart';

class HomeController extends GetxController {
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  final db = FirebaseFirestore.instance;
  var listener;

  List<Heritage> listHeritages = <Heritage>[].obs;

  List<Food> listFoods = <Food>[].obs;

  @override
  void onInit() {
    super.onInit();
    GetListHeritage();
    GetListFood();
    scrollController = ScrollController()
      ..addListener(() {
        isSliverAppBarExpanded.value = isSliverAppBarExpandedCheck();
      });
  }

  Future<void> GetListHeritage() async {
    var data = db
        .collection("heritages")
        .withConverter(
            fromFirestore: Heritage.fromFirestore,
            toFirestore: (Heritage heritage, options) => heritage.toFirestore())
        .orderBy("timestamp", descending: false);
    listHeritages.clear();
    listener = data.snapshots().listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            if (change.doc.data() != null) {
              listHeritages.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            if (change.doc.data() != null) {
              Heritage heritage = change.doc.data()!;
              for (int i = 0; i < listHeritages.length; i++) {
                if (listHeritages[i].id == heritage.id) {
                  listHeritages.insert(i, heritage);
                  listHeritages.removeAt(i + 1);
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

  Future<void> GetListFood() async {
    var data = await db
        .collection("foods")
        .withConverter(
            fromFirestore: Food.fromFirestore,
            toFirestore: (Food food, options) => food.toFirestore())
        .orderBy("timestamp", descending: false);
    listFoods.clear();
    listener = data.snapshots().listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            if (change.doc.data() != null) {
              listFoods.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            if (change.doc.data() != null) {
              Food food = change.doc.data()!;
              for (int i = 0; i < listFoods.length; i++) {
                if (listFoods[i].id == food.id) {
                  listFoods.insert(i, food);
                  listFoods.removeAt(i + 1);
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

  bool isSliverAppBarExpandedCheck() {
    return scrollController.hasClients && scrollController.offset > 350;
  }

  void HandleHeritageDetailsPage() {
    Get.toNamed(AppRoutes.HERITAGEDETAILS);
  }
}
