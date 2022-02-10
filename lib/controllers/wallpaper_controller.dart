import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:metropolitan_museum/controllers/download_controller.dart';

class WallpaperController extends DownloadController {
  Future<void> downloadTheWallpaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    await insertImagePath(url: url, path: file.path);
    Get.showSnackbar(GetSnackBar(
      title: 'Done',
      message: 'Image Download',
      duration: Duration(seconds: 2),
    ));
  }
}