import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import './lib/view/utils/constants/const.dart';
import 'lib/view/utils/constants/landscape_objectIDs.dart';

void main() async {
  // Categories will be changed as needed.
  var size = landscapeObjectIDs.length;
  var dataList = [];
  for (var i = 0; i < size; i++) {
    // Categories will be changed as needed.
    Uri uri = Uri.parse(api + "${landscapeObjectIDs[i]}");
    var response = await http.get(uri);
    var parsedData = jsonDecode(response.body) as Map<String, dynamic>;
    var imageData = parsedData['primaryImage'];
    if (imageData != null) {
      try {
        var imageResponse = await http.get(Uri.parse(imageData));
        if (imageResponse.statusCode == 200) {
          dataList.add(landscapeObjectIDs[i]);
        }
        print(dataList);
      } catch (e) {
        print(e);
      }
    }
    sleep(const Duration(seconds: 2));
  }
  // File name will be changed as needed.
  var file = await File('./tmp/test1.txt').create();
  await file.writeAsString(dataList.toString());
  print("done");
}
