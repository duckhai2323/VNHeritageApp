import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../common/colors/app_colors.dart';
import '../../common/routes/names.dart';

class OptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
              bottom: 90,
              left: 20,
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildText('VNHeritage', 20, FontWeight.bold),
                    _buildText('Chào mừng bạn đến với VNHeritage', 16,
                        FontWeight.w600),
                    const SizedBox(height: 15),
                    _buildButtons(context),
                    const SizedBox(height: 10),
                    _buildText('Hoặc đăng nhập bằng', 14, FontWeight.w500),
                    const SizedBox(height: 10),
                    _buildSocialIcons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton('Đăng nhập', AppRoutes.SIGNIN),
        const SizedBox(width: 20),
        _buildButton('Đăng ký', AppRoutes.SIGNUP),
      ],
    );
  }

  Widget _buildButton(String text, String route) {
    return InkWell(
      onTap: () => Get.toNamed(route),
      child: Container(
        width: 105,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1.5, color: Colors.white),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcons() {
    final List<String> socialImages = [
      'assets/images/facebook-logo.png',
      'assets/images/google-logo.png',
      'assets/images/linkedin-logo.png'
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialImages.map((image) => _buildSocialIcon(image)).toList(),
    );
  }

  Widget _buildSocialIcon(String imagePath) {
    return Container(
      width: 38,
      height: 38,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 1, color: AppColors.placeHolderColor),
      ),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
