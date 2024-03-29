import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/favorite_controller.dart';
import '../../controllers/wallpaper_controller.dart';
import '../../models/metropolitanMuseum.dart';
import '../utils/helpers/color_helper.dart';
import '../widgets/wallpaper_widgets.dart';

class WallpaperView extends StatelessWidget {
  final MetropolitanMuseum wallpaper;
  final bool cameFromDownloadView;
  const WallpaperView(
      {Key? key, required this.wallpaper, required this.cameFromDownloadView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          cameFromDownloadView
              ? Hero(
                  tag: wallpaper.primaryImage.toString(),
                  child: Image.file(
                    File(wallpaper.primaryImage.toString()),
                    height: Get.height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              : Hero(
                  tag: wallpaper.primaryImage.toString(),
                  child: Image.network(
                    wallpaper.primaryImage.toString(),
                    height: Get.height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
          GetBuilder<WallpaperController>(
              init: WallpaperController(),
              builder: (controller) {
                return controller.wallpaperstate
                    ? Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(width: 80),
                            CircularProgressIndicator(),
                            SizedBox(width: 15),
                            Text("Loading...",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 65, 65, 65),
                                )),
                          ]),
                        ),
                      )
                    : Container();
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WallpaperViewButton(
                  color: whitecolor,
                  onPressed: () {
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
                          cameFromDownloadView
                              ? Container()
                              : CircleAvatar(
                                  backgroundColor: greycolor,
                                  child: WallpaperViewButton(
                                      onPressed: () {
                                        controller.downloadTheWallpaper(
                                            wallpaper.primaryImage.toString());
                                      },
                                      color: Colors.cyan,
                                      iconData: Icons.file_download_outlined),
                                ),
                          SetButton(
                            wallpaper: wallpaper,
                            wallpaperController: controller,
                            cameFromDownloadView: cameFromDownloadView,
                          ),
                          cameFromDownloadView
                              ? Container()
                              : GetBuilder<FavoriteController>(
                                  init: FavoriteController(),
                                  initState: (con) {
                                    Future.delayed(const Duration(seconds: 0))
                                        .then((value) {
                                      con.controller!.inTheList(
                                          wallpaper.primaryImage.toString());
                                    });
                                  },
                                  builder: (controller) {
                                    return CircleAvatar(
                                      child: WallpaperViewButton(
                                          onPressed: () {
                                            controller
                                                .favoriteToggler(wallpaper);
                                          },
                                          color: greycolor,
                                          iconData: controller.isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border),
                                    );
                                  },
                                )
                        ],
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
