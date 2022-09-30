import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var players = [].obs;
  Future<Map> getJson() async {
    var url = 'https://www.balldontlie.io/api/v1/players/';

    http.Response response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  getData() async {
    final data = await getJson();
    players.value = data['data'];
  }

  @override
  void onInit() async {
    super.onInit();
    getData();
  }
}
