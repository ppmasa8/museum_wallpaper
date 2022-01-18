import 'package:flutter/material.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';

class SharedGridWidget extends StatelessWidget {
  const SharedGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
          childAspectRatio: 2 / 2.7,
      ),
      itemBuilder: (context, index) => Container(
        color: pinkcolor,
      ),
    );
  }
}
