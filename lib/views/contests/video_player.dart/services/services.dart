import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nba_project/views/contests/video_player.dart/constants/constants.dart';
import 'package:nba_project/views/contests/video_player.dart/models/models.dart';
import 'package:nba_project/views/contests/dunkers.dart';

/*
curl \
  'https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=dunk%20contest&access_token=AIzaSyBNoB39qQPuWjNnQCTlydJHLy7pPTBOymg&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed

*/
// class Services {
//   //
//   static const _baseUrl = 'www.googleapis.com';

//   static Future<VideoInfo> getVideoInfo() async {
//     Map<String, String> parameters = {
//       'part': 'snippet',
//       'key': Constants.API_KEY,
//     };
//     Map<String, String> headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };
//     Uri uri = Uri.https(
//       _baseUrl,
//       '/youtube/v3/search',
//       parameters,
//     );
//     Response response = await http.get(uri, headers: headers);
//     // print(response.body);
//     VideoInfo videoInfo = jsonDecode(response.body);
//     return videoInfo;
//   }
// }

//

abstract class Services {
  Future<List<Items>> searchVideo(String query);
}
//Super class for MovieRemoteDataSourceImpl

//Connecting to given endpoints to receive data

class ServicesImpl implements Services {
  http.Client client = http.Client();

  ServicesImpl();

  @override
  Future<List<Items>> searchVideo(String query) => _getVideoInfoFromUrl(
      'https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=$query&access_token=AIzaSyBNoB39qQPuWjNnQCTlydJHLy7pPTBOymg&key=${Constants.API_KEY}');

  Future<List<Items>> _getVideoInfoFromUrl(String url) async {
    print(url);
    final response = await client.get(Uri.parse(url),
        headers: ({'Accept': 'application/json'}));
    /*The HTTP headers are used to pass additional information between the clients
        and the server through the request and response header. */
    if (response.statusCode == 200) {
      final videoItems = json.decode(response.body);
      return (videoItems['items'] as List)
          .map((videoItem) => Items.fromJson(videoItem))
          .toList();
    } else {
      throw Exception();
    }
  }
}
