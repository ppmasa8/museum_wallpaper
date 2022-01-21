import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:metropolitan_museum/view/utils/constants/const.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';

class RestApiService {
  Future<List<dynamic>> getJsonDataFromApi(String url) async {
    Uri uri = Uri.parse(url);
    print('========${uri}');
    var response = await http.get(uri);
    // TODO parsedData change to List<dynamic>.
    var parsedData = jsonDecode(response.body);
    print('========${parsedData}=======');
    return parsedData;
  }

  Future<List<MetropolitanMuseum>> convertJsonToObject(int objectnumber) async {
    List<dynamic> list = await getJsonDataFromApi(api + "${objectnumber}");
    List<MetropolitanMuseum> wallpapers = [];
    for (var wallpaper in list) {
      wallpapers.add(MetropolitanMuseum.fromJson(wallpaper));
    }
    return wallpapers;
  }
}