import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metropolitan_museum/controllers/home_controller.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';
import 'package:metropolitan_museum/view/utils/helpers/style_helper.dart';
import 'package:metropolitan_museum/view/utils/shared/shared_grid_widget.dart';

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
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return controller.state == true
                    ? const Center(child: CircularProgressIndicator())
                    :SharedGridWidget(
                        wallpapers: controller.todaysList,
                    );
              }
            ),
            const SharedGridWidget(wallpapers: [],),
            const SharedGridWidget(wallpapers: [],)
          ],
        ),
      ),
    );
  }
}