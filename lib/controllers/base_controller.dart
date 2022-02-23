import 'package:get/get.dart';

class BaseController extends GetxController {
  bool _state = false;
  bool get state => _state;

  void setState(bool value) {
    _state = value;
    update();
  }

  int currentIndex = 0;
  void setIndex(val) {
    currentIndex = val;
    update();
  }
}
