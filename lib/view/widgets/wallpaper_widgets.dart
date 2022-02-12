import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metropolitan_museum/controllers/wallpaper_controller.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';
import 'package:metropolitan_museum/view/utils/helpers/style_helper.dart';

class SetButton extends StatelessWidget {
  final WallpaperController wallpaperController;
  final MetropolitanMuseum wallpaper;
  const SetButton({
    Key? key,
    required this.wallpaper,
    required this.wallpaperController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => Container(
              decoration: const BoxDecoration(
                  color: whitecolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              height: Get.height * 0.4,
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {
                      Get.back();
                    },
                    leading: const Text(
                      "Set Wallpaper as :",
                      style: h1,
                    ),
                    trailing: const Icon(
                      Icons.cancel_outlined,
                      color: blackcolor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      wallpaperController
                          .setOnHomeScreen(wallpaper.primaryImage.toString());
                      Get.back();
                    },
                    leading: const Icon(
                      Icons.home_filled,
                      color: blackcolor,
                    ),
                    title: const Text(
                      "Home Screen",
                      style: h1,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      wallpaperController
                          .setOnLockScreen(wallpaper.primaryImage.toString());
                      Get.back();
                    },
                    leading: const Icon(
                      Icons.lock_open,
                      color: blackcolor,
                    ),
                    title: const Text(
                      "Lock Screen",
                      style: h1,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      wallpaperController
                          .setOnLockAndHomeScreen(wallpaper.primaryImage.toString());
                      Get.back();
                    },
                    leading: const Icon(
                      Icons.screen_lock_landscape,
                      color: blackcolor,
                    ),
                    title: const Text(
                      "Home & Lock Screen",
                      style: h1,
                    ),
                  )
                ],),
            ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 15,
        ),
        child: const Text(
          "SET AS",
          style: buttons,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: pinkcolor,
        ),
      ),
    );
  }
}

class WallpaperViewButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final IconData iconData;

  const WallpaperViewButton(
      {Key? key,
        required this.onPressed,
        required this.color,
        required this.iconData,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
