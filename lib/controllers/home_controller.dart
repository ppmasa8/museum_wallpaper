import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  List<MetropolitanMuseum> todaysList = [];
  List<MetropolitanMuseum> popularList = [];
  List<MetropolitanMuseum> oldestList = [];

  // search today
  void getListOfToday() async {
    setState(true);
    todaysList += await _restApiService.convertJsonToObject(api + "${423169}");
    todaysList += await _restApiService.convertJsonToObject(api + "${200734}");
    todaysList += await _restApiService.convertJsonToObject(api + "${57853}");
    todaysList += await _restApiService.convertJsonToObject(api + "${20708}");
    todaysList += await _restApiService.convertJsonToObject(api + "${21661}");
    todaysList += await _restApiService.convertJsonToObject(api + "${200732}");
    todaysList += await _restApiService.convertJsonToObject(api + "${201784}");
    todaysList += await _restApiService.convertJsonToObject(api + "${207128}");
    todaysList += await _restApiService.convertJsonToObject(api + "${207125}");
    setState(false);
  }

  // search popular
  void getListOfPopular() async {
    setState(true);
    popularList += await _restApiService.convertJsonToObject(api + "${500667}");
    popularList += await _restApiService.convertJsonToObject(api + "${3411}");
    popularList += await _restApiService.convertJsonToObject(api + "${426342}");
    popularList += await _restApiService.convertJsonToObject(api + "${426354}");
    popularList += await _restApiService.convertJsonToObject(api + "${426349}");
    popularList += await _restApiService.convertJsonToObject(api + "${426344}");
    popularList += await _restApiService.convertJsonToObject(api + "${426345}");
    popularList += await _restApiService.convertJsonToObject(api + "${426350}");
    popularList += await _restApiService.convertJsonToObject(api + "${426348}");
    setState(false);
  }

  // search old
  void getListOfOldest() async {
    setState(true);
    oldestList += await _restApiService.convertJsonToObject(api + "${328905}");
    oldestList += await _restApiService.convertJsonToObject(api + "${322890}");
    oldestList += await _restApiService.convertJsonToObject(api + "${44292}");
    oldestList += await _restApiService.convertJsonToObject(api + "${751543}");
    oldestList += await _restApiService.convertJsonToObject(api + "${717577}");
    oldestList += await _restApiService.convertJsonToObject(api + "${328902}");
    oldestList += await _restApiService.convertJsonToObject(api + "${322272}");
    oldestList += await _restApiService.convertJsonToObject(api + "${327457}");
    oldestList += await _restApiService.convertJsonToObject(api + "${323535}");
    setState(false);
  }

  @override
  void onInit() {
    getListOfToday();
    getListOfPopular();
    getListOfOldest();
    super.onInit();
  }
}