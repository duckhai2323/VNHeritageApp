import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../common/colors/app_colors.dart';
import '../../common/routes/names.dart';

class OptionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              bottom: 90,
              left: 20,
              child: Container(
                width: MediaQuery.of(context).size.width-40,
                height:200,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       InkWell(
                         onTap:(){
                           Get.toNamed(AppRoutes.SIGNIN);
                         },
                         child: Container(
                           width:105,
                           padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             border: Border.all(
                                 width: 1.5,
                                 color: Colors.white
                             ),
                           ),
                           child: const Center(
                             child: Text(
                               'Đăng nhập',
                               style: TextStyle(
                                 fontSize: 16,
                                 color: Colors.white,
                                 fontWeight: FontWeight.w500
                               ),
                             ),
                           ),
                         ),
                       ),

                        SizedBox(width: 20,),

                        InkWell(
                          onTap:(){
                            Get.toNamed(AppRoutes.SIGNUP);
                          },
                          child: Container(
                            width:105,
                            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1.5,
                                  color: Colors.white
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Đăng ký',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    const Text(
                      'Hoặc đăng nhập bằng',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  width: 1, color: AppColors.placeHolderColor)),
                          child: Image.asset(
                            'assets/images/facebook-logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 36,
                          height: 36,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                  width: 1, color: AppColors.placeHolderColor)),
                          child: Image.asset(
                            'assets/images/google-logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  width: 1, color: AppColors.placeHolderColor)),
                          child: Image.asset(
                            'assets/images/linkedin-logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

