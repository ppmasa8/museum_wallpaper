import 'dart:math';

import 'package:flutter/material.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';
import 'package:metropolitan_museum/view/utils/constants/landscape_objectIDs.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController landscapesScrollController = ScrollController();
  List<MetropolitanMuseum> landscapesList = [];
  // int landscapesPageNumber = 0;
  var intArray = [];

  // These number is the result of a search for the word "landscape" on MetropolitanMuseumApi.
  Future<void> getListOfLandscape() async {
    setState(true);
    randomizer();
    for (var i = 0; i < 8; i++) {
      landscapesList += await _restApiService
          .convertJsonToObjectOnlyImgAndWikiURL(api + "${intArray[i]}");
    }
    setState(false);
  }

  void loadMoreData() {
    landscapesScrollController.addListener(() async {
      if (landscapesScrollController.position.pixels ==
          landscapesScrollController.position.maxScrollExtent) {
        await addMoreDataToLandscapeList();
      }
    });
  }

  Future<void> addMoreDataToLandscapeList() async {
    setBottomState(true);
    List<MetropolitanMuseum> wallpapers = [];
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      wallpapers += await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(
          api +
              "${landscapeObjectIDs[rng.nextInt(landscapeObjectIDs.length) - 1]}");
      // landscapesPageNumber++;
    }
    landscapesList.addAll(wallpapers);
    setBottomState(false);
  }

  void randomizer() {
    var n = landscapeObjectIDs.length;
    var rng = Random();
    for (var i = 0; i < 8; i++) {
      intArray.add(landscapeObjectIDs[rng.nextInt(n) - 1]);
    }
  }

  @override
  void onInit() {
    getListOfLandscape();
    loadMoreData();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   landscapesScrollController.dispose();
  //   super.onClose();
  // }
}
