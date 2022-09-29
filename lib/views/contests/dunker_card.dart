import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//AIzaSyBPbXHMIvJR9pAG1diRhysBOmPMna1aEzM
/*curl \
  'https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&order=viewCount&q=ike%20anigbogu&key=[YOUR_API_KEY]' \
  --header 'Accept: application/json' \
  --compressed
*/

Future<Map> getJson() async {
  var url =
      'https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&order=viewCount&q=dunk_contests&key=AIzaSyDAf4lTuExHUO8N2FUj5wI0JxTyaQHJZ1o';

  http.Response response =
      await http.get(Uri.parse(url), headers: ({'Accept': 'application/json'}));
  return jsonDecode(response.body);
}

class DunkerCard extends StatefulWidget {
  final dynamic player;

  const DunkerCard(this.player);

  @override
  State<DunkerCard> createState() => _DunkerCardState();
}

class _DunkerCardState extends State<DunkerCard> {
  var videos;

  void getData() async {
    final data = await getJson();
    setState(() {
      videos = data["items"];
      print("Got data");
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
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
                        itemCount: videos.length,
                        itemBuilder: (context, index) {
                          final videoPreviewUrl = videos[index]['snippet']
                                  ['thumbnails']['medium']['url']
                              .toString();
                          return Card(
                            color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color:
                                              Color.fromRGBO(211, 211, 211, 1),
                                        ),
                                      ),
                                      height: 92,
                                      width: 126,
                                      child: Image.network(
                                        videoPreviewUrl,
                                        fit: BoxFit.cover,
                                      )),
                                  Text("DESCRIPTION",
                                      style: GoogleFonts.openSans(
                                          color: Colors.white))
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
