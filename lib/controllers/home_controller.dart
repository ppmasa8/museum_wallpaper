import 'dart:math';

import 'package:flutter/material.dart';
import 'base_controller.dart';
import '../models/metropolitanMuseum.dart';
import '../services/rest_api_service.dart';
import '../view/utils/constants/const.dart';
import '../view/utils/constants/landscape_objectIDs.dart';

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
