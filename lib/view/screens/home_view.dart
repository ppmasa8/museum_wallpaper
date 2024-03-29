import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/random_controller.dart';
import '../../controllers/popular_controller.dart';
import '../../main.dart';
import '../utils/helpers/color_helper.dart';
import '../utils/helpers/style_helper.dart';
import '../utils/shared/shared_grid_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyTheme theme = context.watch<MyTheme>();
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Wallpaper",
                style: GoogleFonts.dancingScript(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: theme.isDark ? whitecolor : blackcolor,
                )),
            centerTitle: true,
            backgroundColor: theme.isDark ? Colors.grey[850] : Colors.grey[50],
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
                    "RANDOMS",
                    style: links,
                  ),
                ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<MyTheme>(context, listen: false).toggle();
            },
            child: const Icon(Icons.autorenew),
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
              GetBuilder<RandomController>(
                init: RandomController(),
                builder: (controller) {
                  return controller.state
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SharedGridWidget(
                          wallpapers: controller.randomList,
                          scrollController: controller.randomScrollController,
                          isLoading: controller.bottomstate);
                },
              )
            ],
          ),
        ));
  }
}
