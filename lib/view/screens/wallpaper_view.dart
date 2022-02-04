import 'package:flutter/material.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';

class WallpaperView extends StatelessWidget {
  final MetropolitanMuseum wallpaper;
  const WallpaperView({Key? key, required this.wallpaper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(wallpaper.primaryImage.toString()),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios)
              )
            ],
          )
        ],
      ),
    );
  }
}
