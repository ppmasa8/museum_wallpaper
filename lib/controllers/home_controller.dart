import 'package:get/get.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/services/rest_api_service.dart';

class HomeController extends GetxController {
  final RestApiService _restApiService = RestApiService();
  List<MetropolitanMuseum> todaysList = [];

  void getListOfToday() async {
    todaysList = await _restApiService.convertJsonToObject(199);
    update();
  }

  @override
  void onInit() {
    getListOfToday();
    super.onInit();
  }
}