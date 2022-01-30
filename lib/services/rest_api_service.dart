import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:metropolitan_museum/view/utils/constants/const.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';

class RestApiService {
  Future<List<dynamic>> getJsonDataFromApi(String url) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var parsedData = jsonDecode(response.body);
    var dataList = [];
    parsedData.forEach((key, value){
      dataList.add({key: value});
    });
    return dataList;
  }

  Future<List<MetropolitanMuseum>> convertJsonToObject(int objectid) async {
    List<dynamic> list = await getJsonDataFromApi(api + "${objectid}");
    List<MetropolitanMuseum> wallpapers = [];
    for (var wallpaper in list) {
      Map<String, dynamic> data = Map<String, dynamic>.from(wallpaper);
      wallpapers.add(MetropolitanMuseum.fromJson(data));
    }
    return wallpapers;
  }
}