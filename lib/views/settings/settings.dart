import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nba_project/views/settings/settings_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 190,
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 47, left: 24, right: 247),
                child: Image.asset(
                  'lib/assets/images/logo.png',
                  fit: BoxFit.contain,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 32, left: 24),
                child: Text(
                  'SETTINGS',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                )),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(40, 40, 40, 1)),
                    width: double.infinity,
                    height: 56,
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: 18.0,
                                  left: 18.0,
                                  right: 18.0,
                                  top: 8),
                              child: Icon(
                                Icons.local_fire_department,
                                color: Colors.white,
                              ),
                            ),
                            Text("Buy premium",
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 16)))
                          ],
                        ))),
                SizedBox(
                  height: 16,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(40, 40, 40, 1)),
                    width: double.infinity,
                    height: 56,
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: 18.0,
                                  left: 18.0,
                                  right: 18.0,
                                  top: 8),
                              child: Icon(
                                Icons.info,
                                color: Colors.white,
                              ),
                            ),
                            Text("Privacy policy",
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 16)))
                          ],
                        ))),
                SizedBox(
                  height: 16,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(40, 40, 40, 1)),
                    width: double.infinity,
                    height: 56,
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: 18.0,
                                  left: 18.0,
                                  right: 18.0,
                                  top: 8),
                              child: Icon(
                                Icons.admin_panel_settings,
                                color: Colors.white,
                              ),
                            ),
                            Text("Terms of use",
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 16)))
                          ],
                        ))),
                SizedBox(
                  height: 16,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(40, 40, 40, 1)),
                    width: double.infinity,
                    height: 56,
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: 18.0,
                                  left: 18.0,
                                  right: 18.0,
                                  top: 8),
                              child: Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                            ),
                            Text("Rate app",
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 16)))
                          ],
                        ))),
                SizedBox(
                  height: 16,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(40, 40, 40, 1)),
                    width: double.infinity,
                    height: 56,
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: 18.0,
                                  left: 18.0,
                                  right: 18.0,
                                  top: 8),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ),
                            Text("Support",
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 16)))
                          ],
                        )))
              ],
            )),
      ),
    );
  }
}
