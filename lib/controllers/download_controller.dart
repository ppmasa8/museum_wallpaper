import 'package:hive_flutter/hive_flutter.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';

class DownloadController extends BaseController {
  Future<void> insertImagePath({String? url, String? path}) async {
    var box = await Hive.openBox<String>(downloadBox);
    box.put(url, path!);
  }
}