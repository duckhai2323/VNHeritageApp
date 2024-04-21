import 'package:get/get_navigation/src/routes/get_route.dart';

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
  ];
}