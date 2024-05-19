import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vnheritage/pages/application/application_controller.dart';

import '../../../common/document_object/user.dart';

class ProfileController extends GetxController {
  var db = FirebaseFirestore.instance;
  List<UserClient> profile = <UserClient>[].obs;

  var image = Rx<File?>(null);
  late UploadTask uploadTask;
  var checkClickImage = false.obs;

  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      checkClickImage.value = true;
      File file = File(pickedFile.path);
      image.value = file;

      final path = 'avatar/${pickedFile.name}';
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(file);

      final snapshot = await uploadTask.whenComplete(() => {});
      final url = await snapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection("users").doc(ApplicationController.user_id).update({
        "image": url,
      });
    } catch (e) {
      print(e);
    }
  }


  @override
  void onInit() async {
    super.onInit();
    GetProfile();
  }
  Future<void> GetProfile() async {
    profile.clear();
    final data = await db.collection("users").withConverter(
        fromFirestore: UserClient.fromFirestore,
        toFirestore: (UserClient userClient, options) => userClient.toFirestore()
    ).where("id",isEqualTo:ApplicationController.user_id).get();
    if(data.docs.isNotEmpty){
      profile.add(data.docs[0].data());
    }
  }
}