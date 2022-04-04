import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metropolitan_museum/controllers/favorite_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/screens/wallpaper_view.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';

class FavoriteWidgets extends StatelessWidget {
  const FavoriteWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
        child: GetBuilder<FavoriteController>(
            init: FavoriteController(),
            builder: (controller) => ValueListenableBuilder(
                valueListenable: controller.favoriteBox!.listenable(),
                builder: (context, Box<MetropolitanMuseum> box, child) {
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
                            final MetropolitanMuseum? wallpaper = box.get(key);
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => WallpaperView(
                                      wallpaper: wallpaper!,
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
                                    tag: wallpaper!.primaryImage.toString(),
                                    child: Image.network(
                                      // TODO response faster
                                      wallpaper.primaryImage.toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder: (c, o, s) {
                                        print('Load failed : ${c.toString()}');
                                        return const Icon(
                                          Icons.error,
                                          color: Colors.yellowAccent,
                                        );
                                      },
                                    ),
                                  ),
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
