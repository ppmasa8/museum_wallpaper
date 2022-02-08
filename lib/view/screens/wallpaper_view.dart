import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';
import 'package:metropolitan_museum/view/utils/helpers/style_helper.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: pinkcolor,
                      child: WallpaperViewButton(
                          onPressed: (){},
                          color: whitecolor,
                          iconData: Icons.file_download_outlined
                      ),
                    ),
                    const SetButton(),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SetButton extends StatelessWidget {
  const SetButton({
    Key? key,
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

