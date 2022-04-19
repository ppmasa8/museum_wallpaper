import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metropolitan_museum/controllers/download_controller.dart';
import 'package:metropolitan_museum/view/screens/wallpaper_view.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:metropolitan_museum/view/utils/constants/const.dart';


class DownloadWidgets extends StatelessWidget {
  const DownloadWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
        child: GetBuilder<DownloadController>(
            init: DownloadController(),
            builder: (controller) => ValueListenableBuilder(
                valueListenable: controller.downloadBoxListner!.listenable(),
                builder: (context, Box<String> box, child) {
                  final List<String> keys = box.keys.cast<String>().toList();
                  return keys.isEmpty
                      ? const EmptyList()
                      : GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 30,
                            childAspectRatio: 2 / 2.7,
                          ),
                          itemCount: keys.length,
                          itemBuilder: (context, index) {
                            final String key = keys[index];
                            final String? wallpaper = box.get(key);
                            final data = rootBundle.load(downloadBox);
                            File file = File(wallpaper!);
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => WallpaperView(
                                      wallpaper: MetropolitanMuseum(
                                          primaryImage: wallpaper),
                                      cameFromDownloadView: true,
                                    ));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: greycolor,
                                  ),
                                  child: Hero(
                                      tag: file,
                                      child:
                                          Image.file(file, fit: BoxFit.cover)),
                                ),
                              ),
                            );
                          });
                })));
  }
}

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Empty list"),
    );
  }
}
