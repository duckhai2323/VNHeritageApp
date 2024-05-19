import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Search1Controller extends GetxController {
  var searchText = ''.obs;
  var textController3  =TextEditingController();

  @override
  void onInit() {
    super.onInit();
    textController3.addListener(() {
      searchText.value = textController3.text;
    });
  }

}