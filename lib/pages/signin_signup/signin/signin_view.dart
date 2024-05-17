import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vnheritage/pages/signin_signup/signin/sigin_controller.dart';

import '../../../common/colors/app_colors.dart';

class SignInPage extends GetView<SignInController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/vnheriatge.appspot.com/o/snapedit_1715932175909.jpeg?alt=media&token=d940e105-0939-444a-b274-aa73a9099698'),
                fit: BoxFit.cover,
              )
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 160,
                left: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width-40,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'VNHeritage',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
        
                      const Text(
                        'Chào mừng bạn đến với VNHeritage',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
        
                      const Padding(
                        padding: EdgeInsets.only(top: 25, bottom: 15),
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                         controller: controller.text1Controller,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 8),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.4),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Roboto Regular",
                                fontWeight: FontWeight.w600),
                            prefixIcon: const Icon(Icons.email_outlined,
                                size: 20, color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: AppColors.bgTextFeild, width: 1.5)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: AppColors.bgTextFeild, width: 1.5)),
                          ),
                        ),
                      ),
        
                      Obx(
                            () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: TextFormField(
                            controller: controller.text2Controller,
                            obscureText: controller.obscureText_.value,
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 8),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.4),
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Roboto Regular",
                                  fontWeight: FontWeight.w600),
                              prefixIcon: const Icon(Icons.lock_outline,
                                  size: 20, color: Colors.white,),
                              suffixIcon: InkWell(
                                onTap: () {
                                  controller.ClickVisible();
                                },
                                child: Icon(
                                  controller.obscureText_.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                  size: 23,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: AppColors.bgTextFeild, width: 1.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.5)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: AppColors.bgTextFeild, width: 1.5)),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
        
                      InkWell(
                        onTap: () {
                          controller.HandleApplication(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width-200,
                          height: 45,
                          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                              color: AppColors.bottomNaviColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                )
                              ]),
                          child: const Center(
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}