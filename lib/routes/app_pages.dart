import 'package:get/get.dart';
import 'package:nba_project/views/dashboard/dashboard_binding.dart';
import 'package:nba_project/views/dashboard/dashboard.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashBoard(),
      binding: DashboardBinding(),
    ),
  ];
}