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
      if (value.runtimeType != List<dynamic>) {
        dataList.add('$key: $value');
      }
    });
    return dataList;
  }

  Future<List> convertJsonToObject(int objectnumber) async {
    List<dynamic> list = await getJsonDataFromApi(api + "${objectnumber}");
    return list;
  }
}