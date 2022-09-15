import 'package:flutter/material.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';

class RandomController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController randomScrollController = ScrollController();
  List<MetropolitanMuseum> randomList = [];

  // These number is the result of a search for the word "old" on MetropolitanMuseumApi.
  Future<void> getListOfRandom() async {
    setState(true);
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${328905}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${322890}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${44292}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${751543}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${717577}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${328902}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${322272}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${327457}");
    setState(false);
  }

  int randomPageNumber = 0;

  void loadMoreData() {
    randomScrollController.addListener(() async {
      if (randomScrollController.position.pixels ==
          randomScrollController.position.maxScrollExtent) {
        await addMoreDataToRandomList();
      }
    });
  }

  Future<void> addMoreDataToRandomList() async {
    setBottomState(true);
    List<MetropolitanMuseum> wallpapers = [];
    for (var i = 0; i < 10; i++) {
      wallpapers += await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(
          api + "${randomObjectIDArray[randomPageNumber]}");
      randomPageNumber++;
    }
    randomList.addAll(wallpapers);
    setBottomState(false);
  }

  @override
  void onInit() {
    getListOfRandom();
    loadMoreData();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   oldestScrollController.dispose();
  //   super.onClose();
  // }
}
