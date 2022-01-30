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
      // TODO 型を変換しないようにしてLIst<dynamic>にする.
      dataList.add('key: value');
    });
    return dataList;
  }

  Future<List<MetropolitanMuseum>> convertJsonToObject(int objectid) async {
    List<dynamic> list = await getJsonDataFromApi(api + "${objectid}");
    List<MetropolitanMuseum> wallpapers = [];
    for (var wallpaper in list) {
      // wallpapers.add(MetropolitanMuseum.fromJson(wallpaper));
      print(wallpaper);
      print(wallpaper.runtimeType);
      print(MetropolitanMuseum.fromJson(wallpaper));
      print(MetropolitanMuseum.fromJson(wallpaper).runtimeType);
    }
    return wallpapers;
  }
}