import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metropolitan_museum/controllers/home_controller.dart';
import 'package:metropolitan_museum/controllers/oldest_controller.dart';
import 'package:metropolitan_museum/controllers/popular_controller.dart';
import 'package:metropolitan_museum/view/utils/helpers/color_helper.dart';
import 'package:metropolitan_museum/view/utils/helpers/style_helper.dart';
import 'package:metropolitan_museum/view/utils/shared/shared_grid_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Wallpaper",
                style: GoogleFonts.dancingScript(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: blackcolor,
                )),
            centerTitle: true,
            backgroundColor: whitecolor,
            elevation: 0,
            bottom: const TabBar(
                indicatorColor: Colors.transparent,
                labelColor: pinkcolor,
                unselectedLabelColor: greycolor,
                tabs: [
                  Text(
                    "LANDSCAPE",
                    style: links,
                  ),
                  Text(
                    "POPULAR",
                    style: links,
                  ),
                  Text(
                    "OLDEST",
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
                  return controller.state
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SharedGridWidget(
                          wallpapers: controller.landscapesList,
                          scrollController:
                              controller.landscapesScrollController,
                          isLoading: controller.bottomstate);
                },
              ),
              GetBuilder<PopularController>(
                init: PopularController(),
                builder: (controller) {
                  return controller.state
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SharedGridWidget(
                          wallpapers: controller.popularList,
                          scrollController: controller.popularScrollController,
                          isLoading: controller.bottomstate);
                },
              ),
              GetBuilder<OldestController>(
                init: OldestController(),
                builder: (controller) {
                  return controller.state
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SharedGridWidget(
                          wallpapers: controller.oldestList,
                          scrollController: controller.oldestScrollController,
                          isLoading: controller.bottomstate);
                },
              )
            ],
          ),
        ));
  }
}
