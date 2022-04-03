import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/screens/wallpaper_view.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';
import 'package:metropolitan_museum/view/widgets/wallpaper_widgets.dart';

class SharedGridWidget extends StatelessWidget {
  final List<MetropolitanMuseum> wallpapers;
  final ScrollController scrollController;
  final bool isLoading;
  const SharedGridWidget(
      {Key? key,
      required this.wallpapers,
      required this.scrollController,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GridView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: 2 / 2.7,
            ),
            itemCount: (wallpapers.length / 3).floor(),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                print(wallpapers.length);
                Get.to(() => WallpaperView(
                    wallpaper: wallpapers[
                        primaryImageStartPosition + index * jsonObjectLength]));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: pinkcolor,
                  ),
                  child: Hero(
                    tag: wallpapers[primaryImageStartPosition +
                            index * jsonObjectLength]
                        .primaryImage
                        .toString(),
                    child: Image.network(
                      // TODO: response faster
                      wallpapers[primaryImageStartPosition +
                              index * jsonObjectLength]
                          .primaryImage
                          .toString(),
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
            ),
          ),
          !isLoading ? const ProgressIndication() : Container()
        ],
      ),
    );
  }
}
