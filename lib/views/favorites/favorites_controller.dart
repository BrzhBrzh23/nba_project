import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var numOfItems = 0.obs;

  var favList = [].obs;

  void addFavItemToList(item) {
    if (favList.contains(item)) {
      favList.remove(item);
    } else {
      favList.add(item);
    }
    numOfItems;
  }
}
