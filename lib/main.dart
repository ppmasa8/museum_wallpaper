import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metropolitan_museum/models/metropolitanMuseum.dart';
import 'package:metropolitan_museum/view/utils/constants/const.dart';
import 'view/screens/homeview.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MetropolitanMuseumAdapter());
  await Hive.openBox<MetropolitanMuseum>(favoriteBox);
  await Hive.openBox<String>(downloadBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

 
