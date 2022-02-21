import 'package:hive/hive.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';

class FavoriteController extends BaseController {
  Box<MetropolitanMuseum>? favoriteBox;

  @override
  void onInit() {
    favoriteBox = Hive.box<MetropolitanMuseum>(favoriteBoxConst);
    super.onInit();
  }
}