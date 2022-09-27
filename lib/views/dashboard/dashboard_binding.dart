import 'package:nba_project/views/contests/contests_controller.dart';
import 'package:nba_project/views/contests/contests_detail_controller.dart';
import 'package:nba_project/views/favorites/favorites_controller.dart';
import 'package:nba_project/views/home_page/home_page_controller.dart';
import 'package:nba_project/views/settings/settings_controller.dart';

import 'dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<ContestController>(() => ContestController());
    Get.lazyPut<ContestDetailController>(() => ContestDetailController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
