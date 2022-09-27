import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nba_project/views/contests/contests.dart';
import 'package:nba_project/views/dashboard/dashboard_controller.dart';
import 'package:nba_project/views/favorites/favorites.dart';
import 'package:nba_project/views/home_page/home_page.dart';
import 'package:nba_project/views/settings/settings.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [HomePage(), Contests(), Favorites(), Settings(),],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.black),
          child: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              currentIndex: controller.tabIndex,
              type: BottomNavigationBarType.fixed,
              onTap: controller.changeTabIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                _bottomNavigationBarItem(icon: Icons.person, label: '-'),
                _bottomNavigationBarItem(icon: Icons.emoji_events, label: '-'),
                _bottomNavigationBarItem(icon: Icons.star, label: '-'),
                _bottomNavigationBarItem(icon: Icons.settings, label: '-'),
              ]),
        ),
      );
    });
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
