import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nba_project/views/favorites/favorites_controller.dart';
import 'package:nba_project/views/contests/dunker_card.dart';

class Favorites extends GetView<FavoritesController> {
  FavoritesController favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Favorites",
            style: GoogleFonts.openSans(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          backgroundColor: Colors.black,
          toolbarHeight: 120,
        ),
        body: Obx(
          () => (favoritesController.favList == null)
              ? Container(
                  color: Colors.black,
                  child: const Center(child: CircularProgressIndicator()))
              : Container(
                  color: Colors.black,
                  child: ListView.builder(
                      itemCount: favoritesController.favList.length,
                      itemBuilder: ((context, index) {
                        final playerFirstName =
                            favoritesController.favList[index]['first_name'];
                        final playerSecondName =
                            favoritesController.favList[index]['last_name'];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DunkerCard(
                                    favoritesController.favList[index]);
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
                                    Expanded(
                                      child: Text(
                                        favoritesController.favList[index]
                                                ["first_name"] +
                                            " " +
                                            favoritesController.favList[index]
                                                ["last_name"],
                                        style: GoogleFonts.openSans(
                                            textStyle:
                                                const TextStyle(fontSize: 14),
                                            color: Colors.white),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                  ],
                                )),
                          ),
                        );
                      })),
                ),
        ));
  }
}
