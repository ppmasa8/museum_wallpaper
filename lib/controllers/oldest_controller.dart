import 'package:flutter/material.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';

class OldestController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  // ignore: todo
  // TODO: Change the list name.
  final ScrollController oldestScrollController = ScrollController();
  List<MetropolitanMuseum> oldestList = [];
  // These number is the result of a search for the word "old" on MetropolitanMuseumApi.
  Future<void> getListOfOldest() async {
    oldestList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${328905}");
    oldestList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${322890}");
    oldestList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${44292}");
    oldestList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${751543}");
    oldestList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${717577}");
    oldestList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${328902}");
    oldestList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${322272}");
    oldestList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${327457}");
    oldestList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${323535}");
  }
}
