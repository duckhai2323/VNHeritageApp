import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vnheritage/pages/signin_signup/signin/sigin_controller.dart';

import '../../../common/colors/app_colors.dart';

class SignInPage extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/vnheriatge.appspot.com/o/snapedit_1715932175909.jpeg?alt=media&token=d940e105-0939-444a-b274-aa73a9099698'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 160,
                left: 20,
                child: SignInContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SignInHeader(),
          const SizedBox(height: 25),
          SignInTextField(
            controller: controller.text1Controller,
            hintText: 'Email',
            prefixIcon: Icons.email_outlined,
            obscureText: false,
          ),
          Obx(
            () => SignInTextField(
              controller: controller.text2Controller,
              hintText: 'Password',
              prefixIcon: Icons.lock_outline,
              obscureText: controller.obscureText_.value,
              suffixIcon: InkWell(
                onTap: controller.ClickVisible,
                child: Icon(
                  controller.obscureText_.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.white,
                  size: 23,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SignInButton(onTap: () => controller.HandleApplication(context)),
        ],
      ),
    );
  }
}

class SignInHeader extends StatelessWidget {
  const SignInHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'VNHeritage',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'Chào mừng bạn đến với VNHeritage',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25, bottom: 15),
          child: Text(
            'Đăng nhập',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class SignInTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;

  const SignInTextField({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.4),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: Icon(prefixIcon, size: 20, color: Colors.white),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.bgTextFeild,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.bgTextFeild,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final VoidCallback onTap;

  const SignInButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 200,
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
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'Đăng nhập',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
