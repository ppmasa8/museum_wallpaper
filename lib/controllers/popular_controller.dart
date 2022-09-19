import 'dart:math';

import 'package:flutter/material.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';
import 'package:metropolitan_museum/view/utils/constants/popular_objectIDs.dart';

class PopularController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController popularScrollController = ScrollController();
  List<MetropolitanMuseum> popularList = [];
  // int popularPageNumber = 0;
  var intArray = [];

  // These number is the result of a search for the word "popular" on MetropolitanMuseumApi.
  Future<void> getListOfPopular() async {
    setState(true);
    randomizer();
    for (var i = 0; i < 8; i++) {
      popularList += await _restApiService
          .convertJsonToObjectOnlyImgAndWikiURL(api + "${intArray[i]}");
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
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      wallpapers += await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(
          api +
              "${popularObjectIDs[rng.nextInt(popularObjectIDs.length) - 1]}");
      // popularPageNumber++;
    }
    popularList.addAll(wallpapers);
    setBottomState(false);
  }

  void randomizer() {
    var n = popularObjectIDs.length;
    var rng = Random();
    for (var i = 0; i < 8; i++) {
      intArray.add(popularObjectIDs[rng.nextInt(n) - 1]);
    }
  }

  @override
  void onInit() {
    getListOfPopular();
    loadMoreData();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   popularScrollController.dispose();
  //   super.onClose();
  // }
}
