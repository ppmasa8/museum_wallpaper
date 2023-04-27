import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'download_controller.dart';

class WallpaperController extends DownloadController {
  Future<void> downloadTheWallpaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    insertImagePath(url: url, path: file.path);
    Get.showSnackbar(const GetSnackBar(
      title: 'Done',
      message: 'Image Download',
      duration: Duration(seconds: 2),
    ));
  }

// Set
  Future<void> setOnHomeScreen(
      {String? url, String? imagePath, bool? download}) async {
    if (download!) {
      await homeScreen(imagePath!);
    } else {
      setWallpaperState(true);
      var filePath = await cacheWallpaper(url!);
      await homeScreen(filePath.path);
    }

    Get.showSnackbar(const GetSnackBar(
      title: 'Done',
      message: 'The Wallpaper saved on home screen',
      duration: Duration(seconds: 2),
    ));

    setWallpaperState(false);
  }

  Future<void> setOnLockScreen(
      {String? url, String? imagePath, bool? download}) async {
    if (download!) {
      await lockScreen(imagePath!);
    } else {
      setWallpaperState(true);
      var filePath = await cacheWallpaper(url!);
      await lockScreen(filePath.path);
    }

    Get.showSnackbar(const GetSnackBar(
      title: 'Done',
      message: 'The Wallpaper saved on lock screen',
      duration: Duration(seconds: 2),
    ));

    setWallpaperState(false);
  }

  Future<void> setOnLockAndHomeScreen(
      {String? url, String? imagePath, bool? download}) async {
    if (download!) {
      await homeScreen(imagePath!);
      await lockScreen(imagePath);
    } else {
      setWallpaperState(true);
      var filePath = await cacheWallpaper(url!);
      await homeScreen(filePath.path);
      await lockScreen(filePath.path);
    }

    Get.showSnackbar(const GetSnackBar(
      title: 'Done',
      message: 'The Wallpaper saved on home and lock screen',
      duration: Duration(seconds: 2),
    ));

    setWallpaperState(false);
  }

// Screens
  Future<void> homeScreen(String path) async {
    try {
      await WallpaperManager.setWallpaperFromFile(
          path, WallpaperManager.HOME_SCREEN);
      print('Wallpaper set successfully');
    } catch (e) {
      print('Error setting wallpaper: $e');
      Fluttertoast.showToast(
          msg: 'Failed to set wallpaper',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          // textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> lockScreen(String path) async {
    try {
      await WallpaperManager.setWallpaperFromFile(
          path, WallpaperManager.LOCK_SCREEN);
      print('Wallpaper set successfully');
    } catch (e) {
      print('Error setting wallpaper: $e');
      Fluttertoast.showToast(
          msg: 'Failed to set wallpaper',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          // textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> lockAndHomeScreen(String path) async {
    try {
      await WallpaperManager.setWallpaperFromFile(
          path, WallpaperManager.HOME_SCREEN);
      await WallpaperManager.setWallpaperFromFile(
          path, WallpaperManager.LOCK_SCREEN);
      print('Wallpaper set successfully');
    } catch (e) {
      print('Error setting wallpaper: $e');
      Fluttertoast.showToast(
          msg: 'Failed to set wallpaper',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          // textColor: Colors.white,
          fontSize: 16.0);
    }
  }

// download first
  Future<File> cacheWallpaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    return file;
  }
}
