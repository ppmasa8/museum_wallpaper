import 'package:flutter/material.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';
import 'package:metropolitan_museum/view/utils/helpers/style_helper.dart';
import 'package:metropolitan_museum/view/widgets/favorite_widgets.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite",
          style: h1,
        ),
        centerTitle: true,
        backgroundColor: whitecolor,
        elevation: 0,
      ),
      body: const FavoriteWidgets(),
    );
  }
}
