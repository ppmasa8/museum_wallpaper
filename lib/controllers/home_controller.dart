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
  var rng = Random();

  // These number is the result of a search for the word "landscape" on MetropolitanMuseumApi.
  Future<void> getListOfLandscape() async {
    setState(true);
    for (var i = 0; i < 8; i++) {
      landscapesList +=
          await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(api +
              "${landscapeObjectIDs[rng.nextInt(landscapeObjectIDs.length) - 1]}");
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
    for (var i = 0; i < 10; i++) {
      wallpapers += await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(
          api +
              "${landscapeObjectIDs[rng.nextInt(landscapeObjectIDs.length) - 1]}");
    }
    landscapesList.addAll(wallpapers);
    setBottomState(false);
  }

  @override
  void onInit() {
    getListOfLandscape();
    loadMoreData();
    super.onInit();
  }
}
