import 'dart:math';

import 'package:flutter/material.dart';
import 'base_controller.dart';
import '../models/metropolitanMuseum.dart';
import '../services/rest_api_service.dart';
import '../view/utils/constants/const.dart';
import '../view/utils/constants/random_objectIDs.dart';

class RandomController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController randomScrollController = ScrollController();
  List<MetropolitanMuseum> randomList = [];
  var rng = Random();

  // These number is the result of a search randoms.
  Future<void> getListOfRandom() async {
    setState(true);
    for (var i = 0; i < 8; i++) {
      randomList += await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(
          api + "${randomObjectIDs[rng.nextInt(randomObjectIDs.length) - 1]}");
    }
    setState(false);
  }

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
          api + "${randomObjectIDs[rng.nextInt(randomObjectIDs.length) - 1]}");
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
}
