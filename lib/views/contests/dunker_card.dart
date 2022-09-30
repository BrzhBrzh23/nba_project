import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:timeago/timeago.dart' as timeago;

import 'package:nba_project/views/contests/video_player.dart/models/models.dart';
import 'package:nba_project/views/contests/video_player.dart/services/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DunkerCard extends StatefulWidget {
  final dynamic player;

  const DunkerCard(this.player);

  @override
  State<DunkerCard> createState() => _DunkerCardState();
}

class _DunkerCardState extends State<DunkerCard> {
  ServicesImpl serviceImpl = ServicesImpl();
  List<Items>? videos;

  @override
  void initState() {
    super.initState();
    _getVideoInfo();
  }

  void _getVideoInfo() async {
    final data = await serviceImpl.searchVideo(
        widget.player["first_name"] + " " + widget.player["last_name"]);
    setState(() {
      videos = data;
      print(videos![0].id.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final playerFirstName = widget.player["first_name"];
    final playerLastName = widget.player["last_name"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Athlete",
          style: GoogleFonts.openSans(
              textStyle: TextStyle(fontWeight: FontWeight.bold), fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.16),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.star)),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 64,
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Color.fromRGBO(211, 211, 211, 1),
                    ),
                  ),
                  height: 40,
                  width: 40,
                  child: Image.network(
                      'https://nba-players.herokuapp.com/players/$playerLastName/$playerFirstName',
                      fit: BoxFit.fill),
                ),
              ),
              Text(playerFirstName + " " + playerLastName,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 20,
                  ))
            ]),
          ),
          Container(
              height: 100,
              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text("Team",
                              style: GoogleFonts.openSans(
                                color: Color.fromRGBO(221, 221, 221, 1),
                                fontSize: 14,
                              )),
                        ),
                        Text(widget.player["team"]["abbreviation"],
                            style: GoogleFonts.openSans(
                              color: Color.fromRGBO(221, 221, 221, 1),
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                        color: Color.fromRGBO(70, 70, 70, 1), thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text("Conference",
                              style: GoogleFonts.openSans(
                                color: Color.fromRGBO(221, 221, 221, 1),
                                fontSize: 14,
                              )),
                        ),
                        Text(widget.player["team"]["conference"],
                            style: GoogleFonts.openSans(
                              color: Color.fromRGBO(221, 221, 221, 1),
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                        color: Color.fromRGBO(70, 70, 70, 1), thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text("Position",
                              style: GoogleFonts.openSans(
                                color: Color.fromRGBO(221, 221, 221, 1),
                                fontSize: 14,
                              )),
                        ),
                        Text(widget.player["position"],
                            style: GoogleFonts.openSans(
                              color: Color.fromRGBO(221, 221, 221, 1),
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            width: double.infinity,
            color: Colors.black,
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contests",
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: const Icon(
                        Icons.workspace_premium,
                        color: Colors.white,
                      ),
                    ),
                    Text("2017 - NBA All-Star Slam Dunk Contest",
                        style: GoogleFonts.openSans(color: Colors.white))
                  ],
                )
              ],
            ),
          ),
          (videos == null)
              ? Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
              : Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.black,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          final videoPreviewUrl =
                              videos![index].snippet!.thumbnails!.medium!.url;
                          return Card(
                              color: Colors.black,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color:
                                              Color.fromRGBO(211, 211, 211, 1),
                                        ),
                                      ),
                                      height: 97,
                                      width: 126,
                                      child: Image.network(
                                        videoPreviewUrl!,
                                        fit: BoxFit.cover,
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 60,
                                            child: Text(
                                                videos![index].snippet!.title!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.openSans(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  timeago.format(DateTime.parse(
                                                      videos![index]
                                                          .snippet!
                                                          .publishedAt
                                                          .toString())),
                                                  style: GoogleFonts.openSans(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                              IconButton(
                                                  onPressed: () => launchUrl(
                                                      Uri.parse(
                                                          'https://www.youtube.com/watch?v=${videos![index].id!.videoId}')),
                                                  icon: Icon(
                                                    Icons.arrow_upward,
                                                    size: 15,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ));
                        }),
                  ),
                )
        ],
      ),
    );
  }
}
