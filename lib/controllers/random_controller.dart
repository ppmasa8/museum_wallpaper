import 'dart:math';

import 'package:flutter/material.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';
import 'package:metropolitan_museum/view/utils/constants/objectIDs.dart';

class RandomController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController randomScrollController = ScrollController();
  List<MetropolitanMuseum> randomList = [];
  var intArray = [];

  // These number is the result of a search for the word "old" on MetropolitanMuseumApi.
  Future<void> getListOfRandom() async {
    setState(true);
    randomizer();
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${intArray[0]}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${intArray[1]}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${intArray[2]}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${intArray[3]}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${intArray[4]}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${intArray[5]}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${intArray[6]}");
    randomList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${intArray[7]}");
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
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      wallpapers += await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(
          api + "${objectIDs[rng.nextInt(objectIDs.length) - 1]}");
      // print(objectIDs[rng.nextInt(objectIDs.length) - 1]);
      randomPageNumber++;
    }
    randomList.addAll(wallpapers);
    setBottomState(false);
  }

  void randomizer() {
    var n = objectIDs.length;
    var rng = Random();
    for (var i = 0; i < 8; i++) {
      intArray.add(objectIDs[rng.nextInt(n) - 1]);
    }
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
