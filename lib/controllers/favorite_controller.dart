import 'package:hive/hive.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';

class FavoriteController extends BaseController {
  Box<MetropolitanMuseum>? favoriteBox;
  bool isFavorite = false;

  @override
  void onInit() {
    favoriteBox = Hive.box<MetropolitanMuseum>(favoriteBoxConst);
    super.onInit();
  }

  void insertWallpaperToTheList(MetropolitanMuseum data) {
    MetropolitanMuseum wallpaper = MetropolitanMuseum(
        primaryImage: data.primaryImage,
        objectWikidataUrl: data.objectWikidataUrl);
    favoriteBox!.put(wallpaper.primaryImage.toString(), wallpaper);
  }

  void deleteWallpaperFromTheList(String key) {
    favoriteBox!.delete(key);
  }

  void inTheList(String key) {
    var value = favoriteBox!.get(key);
    if (value == null) {
      isFavorite = false;
    } else {
      isFavorite = true;
    }
    update();
  }

  void favoriteToggler() {
    isFavorite = !isFavorite;
    update();
  }
}
