import 'package:get/get.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  List<MetropolitanMuseum> todaysList = [];

  void getListOfToday() async {
    setState(true);
    todaysList = await _restApiService.convertJsonToObject(199);
    setState(false);
  }

  @override
  void onInit() {
    getListOfToday();
    super.onInit();
  }
}