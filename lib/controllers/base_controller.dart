import 'package:get/get.dart';

class BaseController extends GetxController {
  bool _state = false;
  bool get state => _state;
  bool _bottomState = false;
  bool get bottomstate => _bottomState;
  bool _wallpaperState = false;
  bool get wallpaperstate => _wallpaperState;

  void setState(bool value) {
    _state = value;
    update();
  }

  void setBottomState(bool value) {
    _bottomState = value;
    update();
  }

  void setWallpaperState(bool value) {
    _wallpaperState = value;
    update();
  }

  int currentIndex = 0;
  void setIndex(val) {
    currentIndex = val;
    update();
  }
}
