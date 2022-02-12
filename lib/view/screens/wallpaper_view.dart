import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metropolitan_museum/controllers/wallpaper_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';
import 'package:metropolitan_museum/view/widgets/wallpaper_widgets.dart';

class WallpaperView extends StatelessWidget {
  final MetropolitanMuseum wallpaper;
  const WallpaperView({Key? key, required this.wallpaper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: wallpaper.primaryImage.toString(),
            child: Image.network(
              wallpaper.primaryImage.toString(),
              height: Get.height,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WallpaperViewButton(
                  color: whitecolor,
                  onPressed: (){
                    Get.back();
                  },
                  iconData: Icons.arrow_back_ios,
                ),
                GetBuilder<WallpaperController>(
                  init: WallpaperController(),
                  builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: pinkcolor,
                          child: WallpaperViewButton(
                              onPressed: (){
                                controller.downloadTheWallpaper(
                                  wallpaper.primaryImage.toString()
                                );
                              },
                              color: whitecolor,
                              iconData: Icons.file_download_outlined
                          ),
                        ),
                        SetButton(
                          wallpaper: wallpaper,
                          wallpaperController: controller,
                        ),
                        CircleAvatar(
                          backgroundColor: whitecolor,
                          child: WallpaperViewButton(
                              onPressed: (){

                              },
                              color: pinkcolor,
                              iconData: Icons.favorite_border
                          ),
                        )
                      ],
                    );
                  }
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

