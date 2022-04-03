import 'package:get/get.dart';

class BaseController extends GetxController {
  bool _state = false;
  bool get state => _state;
  bool _bottomState = false;
  bool get bottomstate => _bottomState;

  void setState(bool value) {
    _state = value;
    update();
  }

  void setBottomState(bool value) {
    _bottomState = value;
    update();
  }

  int currentIndex = 0;
  void setIndex(val) {
    currentIndex = val;
    update();
  }
}
