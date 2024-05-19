import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/document_object/food.dart';

class FoodDetailController extends GetxController {
  final db = FirebaseFirestore.instance;
  PageController pageController = PageController();
  var listener;
  final id = ''.obs;
  List<Food> listFoods = <Food>[].obs;

  var currPage = 1.obs;
  void HandlePage(int index) {
    currPage.value = index + 1;
  }

  @override
  void onInit() {
    super.onInit();
    id.value = Get.parameters['id'] ?? "";
    GetData();
  }

  Future<void> GetData() async {
    listFoods.clear();
    await Future.delayed(const Duration(seconds: 0));
    final data = await db
        .collection("foods")
        .withConverter(
            fromFirestore: Food.fromFirestore,
            toFirestore: (Food food, options) => food.toFirestore())
        .where("id", isEqualTo: id.value)
        .get();

    if (data.docs.isNotEmpty) {
      listFoods.add(data.docs[0].data());
    }
  }
}
