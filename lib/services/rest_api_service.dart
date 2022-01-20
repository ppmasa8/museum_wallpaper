import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:metropolitan_museum/view/utils/constants/const.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';

class RestApiService {
  Future<List<dynamic>> getJsonDataFromApi(String url) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var parsedData = jsonDecode(response.body) as List<dynamic>;
    return parsedData;
  }

  Future<void> convertJsonToObject(int objectnumber) async {
    List<dynamic> list = await getJsonDataFromApi(api + "&$objectnumber");
    List<MetropolitanMuseum> wallpapers = [];
  }
}