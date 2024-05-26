import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vnheritage/pages/create_blog/create_blog_binding.dart';
import 'package:vnheritage/pages/create_blog/create_blog_view.dart';
import 'package:vnheritage/pages/food_detail/comment/comment_food-binding.dart';
import 'package:vnheritage/pages/food_detail/comment/comment_food_view.dart';
import 'package:vnheritage/pages/food_detail/food_detail_binding.dart';
import 'package:vnheritage/pages/food_detail/food_detail_view.dart';
import 'package:vnheritage/pages/heritage_details/heritage_binding.dart';
import 'package:vnheritage/pages/heritage_details/heritage_view.dart';
import 'package:vnheritage/pages/read_blog/comment/comment_binding.dart';
import 'package:vnheritage/pages/read_blog/comment/comment_view.dart';
import 'package:vnheritage/pages/read_blog/read_blog_view.dart';
import 'package:vnheritage/pages/read_blog/read_blog_binding.dart';

import '../../pages/application/application_bindings.dart';
import '../../pages/application/application_view.dart';
import '../../pages/search/search_binding.dart';
import '../../pages/search/search_view.dart';
import '../../pages/signin_signup/signin/signin_binding.dart';
import '../../pages/signin_signup/signin/signin_view.dart';
import '../../pages/signin_signup/signup/signup_binding.dart';
import '../../pages/signin_signup/signup/signup_view.dart';
import 'names.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.APPLICATION,
      page: ()=>ApplicationPage(),
      binding: ApplicationBindings(),
    ),

    GetPage(
      name: AppRoutes.HERITAGEDETAILS,
      page: () => HeritageDetailsPage(),
      binding: HeritageBindings(),
    ),

    GetPage(
      name:  AppRoutes.READBLOG,
      page: ()=>ReadBLogPage(),
      binding: ReadBLogBingding(),
    ),

    GetPage(
        name: AppRoutes.SIGNIN,
        page: () => SignInPage(),
        binding:  SignInBinding()
    ),
    GetPage(
        name: AppRoutes.SIGNUP,
        page: () => SignUpPage(),
        binding:  SignUpBinding()
    ),
    GetPage(
        name: AppRoutes.CREATEBLOG,
        page: () => CreateBlogPage(),
        binding:  CreateBlogBiding()
    ),
    GetPage(
        name: AppRoutes.COMMENTBLOG,
        page: () => CommentPage(),
        binding:  CommentBindings()
    ),
    GetPage(
        name: AppRoutes.FOOD,
        page: () => FoodDetailPage(),
        binding:  FoodDetailBinding()
    ),
    GetPage(
        name: AppRoutes.COMMENTFOOD,
        page: () => CommentFoodPage(),
        binding:  CommentFoodBinding()
    ),

    GetPage(
        name: AppRoutes.SEARCH,
        page: () => SearchPage(),
        binding:  SearchBinding()
    ),
  ];
}