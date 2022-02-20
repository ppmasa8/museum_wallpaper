import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';

class FavoriteWidgets extends StatelessWidget {
  const FavoriteWidgets ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
      child: ValueListenableBuilder(
        valueListenable: Hive.box<MetropolitanMuseum>(favoriteBox).listenable(),
        builder: (context, Box<MetropolitanMuseum> box, child) {
          final List<String> keys = box.keys.cast<String>().toList();
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: 2 / 2.7,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              final String key = keys[index];
              final MetropolitanMuseum? wallpaper = box.get(key);
              return Container(
                color: pinkcolor,
                child: Image.network(""),
              );
            }
          );
        }
      ),
    );
  }
}
