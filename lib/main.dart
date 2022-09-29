import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nba_project/routes/app_pages.dart';
import 'package:nba_project/routes/app_routes.dart';
import 'package:nba_project/views/contests/dunkers.dart';
import 'package:nba_project/views/dashboard/dashboard.dart';
import 'package:nba_project/views/dashboard/dashboard_controller.dart';
import 'package:nba_project/views/home_page/home_page_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    return GetMaterialApp(
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppPages.list,
      home: DashBoard(),
      routes: {
      'contests_detail': (context) => Dunkers(),}
    );
  }
}
