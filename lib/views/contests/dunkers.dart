import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nba_project/views/contests/dunker_card.dart';
import 'package:nba_project/views/home_page/home_page_controller.dart';

// Future<Map> getJsonPlayers() async {
//   var url = 'https://www.balldontlie.io/api/v1/players/';

//   http.Response response = await http.get(Uri.parse(url));
//   return jsonDecode(response.body);
// }

class Dunkers extends StatefulWidget {
  const Dunkers({super.key});

  @override
  State<Dunkers> createState() => _DunkersState();
}

class _DunkersState extends State<Dunkers> {
  HomePageController homePageController = Get.put(HomePageController());

  // void getData() async {
  //   final dataPlayers = await getJsonPlayers();
  //   setState(() {
  //     players = dataPlayers['data'];
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "DUNKERS",
            style: GoogleFonts.openSans(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          backgroundColor: Colors.black,
          toolbarHeight: 160,
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 47, left: 24, right: 247),
                  child: Image.asset(
                    'lib/assets/images/logo.png',
                    fit: BoxFit.contain,
                  )),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new)),
                      Text("Back",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 15)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 86, top: 20),
                          child: Text("Name",
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(color: Colors.white),
                                  fontSize: 14))),
                      Padding(
                          padding: EdgeInsets.only(left: 90, top: 20),
                          child: Text("Team",
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(color: Colors.white),
                                  fontSize: 14))),
                      Padding(
                          padding: EdgeInsets.only(right: 10, top: 20),
                          child: Text("Conference",
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(color: Colors.white),
                                  fontSize: 14))),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        body: Obx(
          () => (homePageController.players == null)
              ? Container(
                  color: Colors.black,
                  child: const Center(child: CircularProgressIndicator()))
              : Container(
                  color: Colors.black,
                  child: ListView.builder(
                      itemCount: homePageController.players.length,
                      itemBuilder: ((context, index) {
                        final playerFirstName =
                            homePageController.players[index]['first_name'];
                        final playerSecondName =
                            homePageController.players[index]['last_name'];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DunkerCard(
                                    homePageController.players[index]);
                              }));
                            },
                            child: Card(
                                color: Colors.black,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                            color: Color.fromRGBO(
                                                211, 211, 211, 1),
                                          ),
                                        ),
                                        height: 40,
                                        width: 40,
                                        child: Image.network(
                                            'https://nba-players.herokuapp.com/players/$playerSecondName/$playerFirstName',
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Container(
                                      width: 165,
                                      child: Text(
                                        homePageController.players[index]
                                                ["first_name"] +
                                            " " +
                                            homePageController.players[index]
                                                ["last_name"],
                                        style: GoogleFonts.openSans(
                                            textStyle:
                                                const TextStyle(fontSize: 14),
                                            color: Colors.white),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        homePageController.players[index]
                                            ["team"]["abbreviation"],
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(fontSize: 14),
                                            color: Colors.white),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        homePageController.players[index]
                                            ["team"]["conference"],
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(fontSize: 14),
                                            color: Colors.white),
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      })),
                ),
        ));
  }
}
