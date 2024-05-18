import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FoodDetailController extends GetxController {
  final db = FirebaseFirestore.instance;
  PageController pageController = PageController();
  var listener;
  final heritage_id = ''.obs;

  var currPage = 1.obs;
  void HandlePage(int index) {
    currPage.value = index + 1;
  }
}
