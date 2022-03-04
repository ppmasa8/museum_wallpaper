import 'package:flutter/material.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/controllers/popular_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';

class HomeController extends PopularController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController landscapesScrollController = ScrollController();
  List<MetropolitanMuseum> landscapesList = [];

  int landscapesPageNumber = 0;

  // These number is the result of a search for the word "landscape" on MetropolitanMuseumApi.
  Future<void> getListOfLandscape() async {
    landscapesList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${359362}");
    landscapesList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${10181}");
    landscapesList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${11978}");
    landscapesList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${11231}");
    landscapesList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${11181}");
    landscapesList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${437323}");
    landscapesList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${11774}");
    landscapesList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${436455}");
    landscapesList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${36131}");
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
    List<MetropolitanMuseum> wallpapers = [];
    wallpapers += await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(
        api + "${landscapeObjectIDArray[landscapesPageNumber]}");
    landscapesPageNumber++;
    wallpapers += await _restApiService.convertJsonToObjectOnlyImgAndWikiURL(
        api + "${landscapeObjectIDArray[landscapesPageNumber]}");
    landscapesPageNumber++;
    landscapesList.addAll(wallpapers);
    update();
  }

  void getllData() async {
    setState(true);
    await getListOfLandscape();
    await getListOfPopular();
    await getListOfOldest();
    setState(false);
  }

  @override
  void onInit() {
    getllData();
    loadMoreData();
    super.onInit();
  }
}
