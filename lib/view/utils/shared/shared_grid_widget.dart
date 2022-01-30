import 'package:flutter/material.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';

class SharedGridWidget extends StatelessWidget {
  final List<MetropolitanMuseum> wallpapers;
  const SharedGridWidget({Key? key, required this.wallpapers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            childAspectRatio: 2 / 2.7,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: pinkcolor,
          ),
          child: Image.network(
            wallpapers[index].primaryImage.toString(),
            errorBuilder: (c, o, s) {
              print('Load failed : ${c.toString()}');
              return const Icon(
                Icons.error,
                color: Colors.red,
              );
            },
          ),
        ),
      ),
    );
  }
}