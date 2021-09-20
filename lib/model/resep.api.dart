import 'dart:convert';
import 'dart:html';
import 'package:kelompok2/model/resep.dart';
import "package:http/http.dart" as http;

class ResepApi {
  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "50", "tags": "under_30_minutes"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "tasty.p.rapidapi.com",
      "x-rapidapi-key": "9b02e18a8cmsh450293c4cd9b449p14427ajsne367c9fbc170",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Resep.resepFromSnapshot(_temp);
  }
}
