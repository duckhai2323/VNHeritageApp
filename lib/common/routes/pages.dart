import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vnheritage/pages/food_detail/food_detail_binding.dart';
import 'package:vnheritage/pages/food_detail/food_detail_view.dart';
import 'package:vnheritage/pages/heritage_details/heritage_binding.dart';
import 'package:vnheritage/pages/heritage_details/heritage_view.dart';
import 'package:vnheritage/pages/food_detail/comment/comment_food_binding.dart';
import 'package:vnheritage/pages/food_detail/comment/comment_food_view.dart';
import 'package:vnheritage/pages/read_blog/read_blog_view.dart';
import 'package:vnheritage/pages/read_blog/read_blog_binding.dart';

import '../../pages/application/application_bindings.dart';
import '../../pages/application/application_view.dart';
import 'names.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.APPLICATION,
      page: () => ApplicationPage(),
      binding: ApplicationBindings(),
    ),
    GetPage(
      name: AppRoutes.HERITAGEDETAILS,
      page: () => HeritageDetailsPage(),
      binding: HeritageBindings(),
    ),
    GetPage(
      name: AppRoutes.READBLOG,
      page: () => ReadBLogPage(),
      binding: ReadBLogBingding(),
    ),
    GetPage(
      name: AppRoutes.FOOD,
      page: () => FoodDetailPage(),
      binding: FoodDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.COMMENTFOOD,
      page: () => CommentFoodPage(),
      binding: CommentFoodBinding(),
    ),
  ];
}
