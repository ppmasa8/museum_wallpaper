import 'package:flutter/material.dart';
import '../utils/helpers/color_helper.dart';
import '../utils/helpers/style_helper.dart';
import '../widgets/favorite_widgets.dart';

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
