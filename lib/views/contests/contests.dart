import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nba_project/views/contests/contests_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nba_project/views/contests/dunkers.dart';
import 'dart:convert';

import 'package:nba_project/views/favorites/favorites.dart';

Future<Map> getJsonGames() async {
  var url = 'https://www.balldontlie.io/api/v1/games/';

  http.Response response = await http.get(Uri.parse(url));
  return jsonDecode(response.body);
}

Future<Map> getJsonPlayers() async {
  var url = 'https://www.balldontlie.io/api/v1/players/';

  http.Response response = await http.get(Uri.parse(url));
  return jsonDecode(response.body);
}

class Contests extends StatefulWidget {
  @override
  State<Contests> createState() => _ContestsState();
}

class _ContestsState extends State<Contests> {
  var games;
  var players;

  void getData() async {
    final dataGames = await getJsonGames();
    final dataPlayers = await getJsonPlayers();
    setState(() {
      players = dataPlayers['data'];
      games = dataGames['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
                    'FIND AND ENJOY',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 0.7
                              ..color = Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'YOUR FAVORITE DUNK',
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
        body: (games == null)
            ? Container(
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator()))
            : Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: players.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed("contests_detail");
                          },
                          child: Container(
                            height: 110,
                            width: 327,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color.fromRGBO(211, 211, 211, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(16.0)),
                              color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              games[index]['status']
                                                  .toString()
                                                  .toUpperCase(),
                                              style: GoogleFonts.openSans(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18))),
                                          Text(
                                              '${games[index]['home_team']['full_name']} vs. ${games[index]['visitor_team']['full_name']}'
                                                  .toUpperCase(),
                                              style: GoogleFonts.openSans(
                                                  textStyle: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          211, 211, 211, 1),
                                                      fontSize: 15))),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 36,
                                      width: 36,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color.fromRGBO(211, 211, 211, 1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
                ),
              ));
  }
}
