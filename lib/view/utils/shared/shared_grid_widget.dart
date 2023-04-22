import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/metropolitanMuseum.dart';
import '../../screens/wallpaper_view.dart';
import '../../utils/constants/const.dart';
import '../../utils/helpers/color_helper.dart';
import '../../widgets/wallpaper_widgets.dart';

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
                          primaryImageStartPosition + index * jsonObjectLength],
                      cameFromDownloadView: false,
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
                    tag: wallpapers[primaryImageStartPosition +
                            index * jsonObjectLength]
                        .primaryImage
                        .toString(),
                    child: CachedNetworkImage(
                      // TODO: response faster
                      imageUrl: wallpapers[primaryImageStartPosition +
                              index * jsonObjectLength]
                          .primaryImage
                          .toString(),
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const Icon(Icons.error),
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
