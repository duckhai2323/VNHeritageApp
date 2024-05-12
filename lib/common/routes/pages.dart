import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vnheritage/pages/heritage_details/heritage_binding.dart';
import 'package:vnheritage/pages/heritage_details/heritage_view.dart';
import 'package:vnheritage/pages/read_blog/read_blog_view.dart';
import 'package:vnheritage/pages/read_blog/read_blog_binding.dart';

import '../../pages/application/application_bindings.dart';
import '../../pages/application/application_view.dart';
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
  ];
}