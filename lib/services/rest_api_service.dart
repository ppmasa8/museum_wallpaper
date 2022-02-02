import 'dart:convert';
import 'package:http/http.dart' as http;
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

  Future<List<MetropolitanMuseum>> convertJsonToObject(String url) async {
    List<dynamic> list = await getJsonDataFromApi(url);
    List<MetropolitanMuseum> wallpapersObj = [];
    for (var wallpaper in list) {
      Map<String, dynamic> data = Map<String, dynamic>.from(wallpaper);
      wallpapersObj.add(MetropolitanMuseum.fromJson(data));
    }
    return wallpapersObj;
  }
}