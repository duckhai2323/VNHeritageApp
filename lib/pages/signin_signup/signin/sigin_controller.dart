import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/colors/app_colors.dart';
import '../../../common/document_object/user.dart';
import '../../../common/routes/names.dart';

class SignInController extends GetxController {
  static late UserClient profile;
  var text1Controller = TextEditingController();
  var text2Controller = TextEditingController();
  var obscureText_ = true.obs;
  var value_ = 0.obs;
  final db = FirebaseFirestore.instance;
  void ActionRadio(int index) {
    value_.value = index;
  }

  void ClickVisible() {
    if (obscureText_.value) {
      obscureText_.value = false;
    } else {
      obscureText_.value = true;
    }
  }

  void HandlePageSignup() {
    Get.toNamed(AppRoutes.SIGNUP);
  }

  Future<void> HandleApplication(BuildContext context) async {
    showLoaderDialog(context);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: text1Controller.text.toString(),
        password: text2Controller.text.toString(),
      );
      User? user = userCredential.user;
      if (user != null) {
        String fullName = '';
        String id = '';
        String image = '';
        final data = db
            .collection("users")
            .where('email', isEqualTo: text1Controller.text.toString())
            .get()
            .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.docs.isNotEmpty) {
            for (DocumentSnapshot<Map<String, dynamic>> document
                in snapshot.docs) {
              Map<String, dynamic>? data = document.data();
              fullName = data?['fullName'] ?? "";
              id = data?['id'] ?? "";
              image = data?['image'] ?? "";
            }
            Future.delayed(const Duration(seconds: 1));
            Navigator.pop(context);
            print(id);
            Get.toNamed(AppRoutes.APPLICATION, parameters: {
              "user_name": fullName ?? "",
              "user_id": id ?? "",
              "user_image": image ?? "",
            });
          } else {}
        }).catchError((error) {
          // Xử lý lỗi nếu có
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
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
}
