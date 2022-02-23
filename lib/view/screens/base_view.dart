import 'package:flutter/material.dart';
import 'package:metropolitan_museum/view/screens/home_view.dart';

class BaseView extends StatelessWidget {
  const BaseView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeView(),
      bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: "Download"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        ]),
    );
  }
}