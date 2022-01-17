import 'package:flutter/material.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';
import 'package:metropolitan_museum/view/utils/helpers/style_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              "Wallpaper",
              style: h1
          ),
          centerTitle: true,
          backgroundColor: whitecolor,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: greycolor,
                )
            )
          ],
          bottom: const TabBar(
              indicatorColor: Colors.transparent,
              labelColor: pinkcolor,
              unselectedLabelColor: greycolor,
              tabs: [
            Text(
              "TODAY",
              style: links,
            ),
            Text(
              "POPULAR",
              style: links,
            ),
            Text(
              "OLDES",
              style: links,
            ),
          ]),
        ),
      ),
    );
  }
}