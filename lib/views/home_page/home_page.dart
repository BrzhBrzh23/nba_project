import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

Future<Map> getJson() async {
  var url = 'https://www.balldontlie.io/api/v1/players/';

  http.Response response = await http.get(Uri.parse(url));
  return jsonDecode(response.body);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var players;
  

  void getData() async {
    final data = await getJson();
    setState(() {
      players = data['data'];
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
        body: (players == null)
            ? const Center(child: CircularProgressIndicator())
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
                        final playerFirstName = players[index]['first_name'];
                        final playerSecondName = players[index]['last_name'];
                        return Container(
                          height: 110,
                          width: 327,
                          child: Card(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Color.fromRGBO(211, 211, 211, 1),
                                ),
                                borderRadius: BorderRadius.circular(16.0)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Color.fromRGBO(211, 211, 211, 1),
                                      ),
                                    ),
                                    height: 78,
                                    width: 78,
                                    child: Image.network(
                                        'https://nba-players.herokuapp.com/players/$playerSecondName/$playerFirstName',
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15, bottom: 9),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          players[index]['first_name']
                                              .toString()
                                              .toUpperCase(),
                                          style: GoogleFonts.openSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          players[index]['last_name']
                                              .toString()
                                              .toUpperCase(),
                                          style: GoogleFonts.openSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 18,
                                            height: 9,
                                            child: Image.network(
                                                'https://pngimg.com/uploads/flags/flags_PNG14592.png'),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Container(
                                            child: Text(
                                              players[index]['team']
                                                      ['full_name']
                                                  .toString()
                                                  .toUpperCase(),
                                              style: GoogleFonts.openSans(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Color.fromRGBO(
                                                          211, 211, 211, 1))),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ));
  }
}
