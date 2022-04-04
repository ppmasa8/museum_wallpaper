import 'package:flutter/material.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/controllers/oldest_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';

class PopularController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  // ignore: todo
  // TODO: Change the list name.
  List<MetropolitanMuseum> popularList = [];
  final ScrollController popularScrollController = ScrollController();

  // These number is the result of a search for the word "popular" on MetropolitanMuseumApi.
  Future<void> getListOfPopular() async {
    setState(true);
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
    setState(false);
  }

  int popularPageNumber = 0;

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
          api + "${popularObjectIDArray[popularPageNumber]}");
      popularPageNumber++;
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

  // @override
  // void onClose() {
  //   popularScrollController.dispose();
  //   super.onClose();
  // }
}
