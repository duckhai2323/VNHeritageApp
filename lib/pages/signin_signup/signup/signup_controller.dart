import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnheritage/common/document_object/user.dart';

import '../../../common/colors/app_colors.dart';
import '../../../common/routes/names.dart';

class SignUpController extends GetxController {
  var text1Controller = TextEditingController();
  var text2Controller = TextEditingController();
  var text3Controller = TextEditingController();
  var text4Controller = TextEditingController();
  var obscureText1_ = true.obs;
  var obscureText2_ = true.obs;

  final firebaseAuth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;

  void ClickVisible1() {
    if (obscureText1_.value) {
      obscureText1_.value = false;
    } else {
      obscureText1_.value = true;
    }
  }

  void ClickVisible2() {
    if (obscureText2_.value) {
      obscureText2_.value = false;
    } else {
      obscureText2_.value = true;
    }
  }

  bool checkValidate() {
    return true;
  }

  void showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 15),
              child: Text(
                "Loading...",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.bottomNaviColor),
              )),
        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> CreateUserWithEmailAndPassword() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: text2Controller.text.toString(),
          password: text3Controller.text.toString());
    } on FirebaseAuthException catch (e) {
    } catch (e) {
      print(e);
    }
  }

  Future<void> PushDataUser(BuildContext context) async {
    showLoaderDialog(context);
    String documentId = firebase.collection("users").doc().id;
    var data = UserClient(documentId, text1Controller.text.toString(),
        text2Controller.text.toString(), text3Controller.text.toString(),
        image:
            'https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg');
    await firebase
        .collection('users')
        .withConverter(
          fromFirestore: UserClient.fromFirestore,
          toFirestore: (UserClient userdata, options) => userdata.toFirestore(),
        )
        .doc(documentId)
        .set(data);
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
    Get.toNamed(AppRoutes.APPLICATION, parameters: {
      'user_id': documentId,
      'user_name': text1Controller.text.toString(),
      'user_image':
          'https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg'
    });
  }

  void HandlePageSignIn() {
    Get.toNamed(AppRoutes.SIGNIN);
  }
}
