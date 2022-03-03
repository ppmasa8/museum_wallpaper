import 'package:flutter/material.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController landscapesScrollController = ScrollController();
  final ScrollController popularScrollController = ScrollController();
  final ScrollController oldestScrollController = ScrollController();
  // ignore: todo
  // TODO: Change the list name.
  List<MetropolitanMuseum> landscapesList = [];
  List<MetropolitanMuseum> popularList = [];
  List<MetropolitanMuseum> oldestList = [];

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

  // These number is the result of a search for the word "popular" on MetropolitanMuseumApi.
  Future<void> getListOfPopular() async {
    popularList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${500667}");
    popularList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${3411}");
    popularList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${426342}");
    popularList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${426354}");
    popularList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${426349}");
    popularList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${426344}");
    popularList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${426345}");
    popularList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${426350}");
    popularList += await _restApiService
        .convertJsonToObjectOnlyImgAndWikiURL(api + "${426348}");
  }

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
