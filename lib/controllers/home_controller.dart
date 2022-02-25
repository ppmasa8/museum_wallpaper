import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  // ignore: todo
  // TODO: Change the list name.
  List<MetropolitanMuseum> landscapesList = [];
  List<MetropolitanMuseum> popularList = [];
  List<MetropolitanMuseum> oldestList = [];

  // These number is the result of a search for the word "landscape" on MetropolitanMuseumApi.
  Future<void> getListOfToday() async {
    landscapesList +=
        await _restApiService.convertJsonToObject(api + "${359362}");
    landscapesList +=
        await _restApiService.convertJsonToObject(api + "${10181}");
    landscapesList +=
        await _restApiService.convertJsonToObject(api + "${11978}");
    landscapesList +=
        await _restApiService.convertJsonToObject(api + "${11231}");
    landscapesList +=
        await _restApiService.convertJsonToObject(api + "${11181}");
    landscapesList +=
        await _restApiService.convertJsonToObject(api + "${437323}");
    landscapesList +=
        await _restApiService.convertJsonToObject(api + "${11774}");
    landscapesList +=
        await _restApiService.convertJsonToObject(api + "${436455}");
    landscapesList +=
        await _restApiService.convertJsonToObject(api + "${36131}");
  }

  // These number is the result of a search for the word "popular" on MetropolitanMuseumApi.
  Future<void> getListOfPopular() async {
    popularList += await _restApiService.convertJsonToObject(api + "${500667}");
    popularList += await _restApiService.convertJsonToObject(api + "${3411}");
    popularList += await _restApiService.convertJsonToObject(api + "${426342}");
    popularList += await _restApiService.convertJsonToObject(api + "${426354}");
    popularList += await _restApiService.convertJsonToObject(api + "${426349}");
    popularList += await _restApiService.convertJsonToObject(api + "${426344}");
    popularList += await _restApiService.convertJsonToObject(api + "${426345}");
    popularList += await _restApiService.convertJsonToObject(api + "${426350}");
    popularList += await _restApiService.convertJsonToObject(api + "${426348}");
  }

  // These number is the result of a search for the word "old" on MetropolitanMuseumApi.
  Future<void> getListOfOldest() async {
    oldestList += await _restApiService.convertJsonToObject(api + "${328905}");
    oldestList += await _restApiService.convertJsonToObject(api + "${322890}");
    oldestList += await _restApiService.convertJsonToObject(api + "${44292}");
    oldestList += await _restApiService.convertJsonToObject(api + "${751543}");
    oldestList += await _restApiService.convertJsonToObject(api + "${717577}");
    oldestList += await _restApiService.convertJsonToObject(api + "${328902}");
    oldestList += await _restApiService.convertJsonToObject(api + "${322272}");
    oldestList += await _restApiService.convertJsonToObject(api + "${327457}");
    oldestList += await _restApiService.convertJsonToObject(api + "${323535}");
  }

  void getllData() async {
    setState(true);
    await getListOfToday();
    await getListOfPopular();
    await getListOfOldest();
    setState(false);
  }

  @override
  void onInit() {
    getllData();
    super.onInit();
  }
}
