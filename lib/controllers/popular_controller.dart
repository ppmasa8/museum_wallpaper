import 'dart:math';

import 'package:flutter/material.dart';
import 'base_controller.dart';
import '../models/metropolitanMuseum.dart';
import '../services/rest_api_service.dart';
import '../view/utils/constants/const.dart';
import '../view/utils/constants/popular_objectIDs.dart';

class PopularController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController popularScrollController = ScrollController();
  List<MetropolitanMuseum> popularList = [];
  var rng = Random();

  // These number is the result of a search for the word "popular" on MetropolitanMuseumApi.
  Future<void> getListOfPopular() async {
    setState(true);
    for (var i = 0; i < 8; i++) {
      popularList += await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(
          api +
              "${popularObjectIDs[rng.nextInt(popularObjectIDs.length) - 1]}");
    }
    setState(false);
  }

  void loadMoreData() {
    popularScrollController.addListener(() async {
      if (popularScrollController.position.pixels ==
          popularScrollController.position.maxScrollExtent) {
        await addMoreDataToPopularList();
      }
    });
  }

  Future<void> addMoreDataToPopularList() async {
    setBottomState(true);
    List<MetropolitanMuseum> wallpapers = [];
    for (var i = 0; i < 10; i++) {
      wallpapers += await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(
          api +
              "${popularObjectIDs[rng.nextInt(popularObjectIDs.length) - 1]}");
    }
    popularList.addAll(wallpapers);
    setBottomState(false);
  }


  @override
  void onInit() {
    getListOfPopular();
    loadMoreData();
    super.onInit();
  }
}
