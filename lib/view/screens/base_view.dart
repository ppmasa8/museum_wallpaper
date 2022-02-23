import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metropolitan_museum/controllers/base_controller.dart';
import 'package:metropolitan_museum/view/screens/download_view.dart';
import 'package:metropolitan_museum/view/screens/favorite_view.dart';
import 'package:metropolitan_museum/view/screens/home_view.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
        init: BaseController(),
        builder: (controller) => Scaffold(
              body: getViewByIndex(controller.currentIndex),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.download), label: "Download"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: "Favorite"),
                ],
                currentIndex: controller.currentIndex,
                onTap: (val) {
                  controller.setIndex(val);
                },
              ),
            ));
  }

  Widget getViewByIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const DownloadView();
      case 2:
        return const FavoriteView();
      default:
        return const HomeView();
    }
  }
}
