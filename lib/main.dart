import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/metropolitanMuseum.dart';
import '../view/screens/base_view.dart';
import '../view/utils/constants/const.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MetropolitanMuseumAdapter());
  await Hive.openBox<MetropolitanMuseum>(favoriteBoxConst);
  await Hive.openBox<String>(downloadBox);
  runApp(const MyApp());
}

class MyTheme extends ChangeNotifier {
  ThemeData current = ThemeData.light();
  bool isDark = false;

  toggle() {
    isDark = !isDark;
    current = isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyTheme(),
      child: Consumer<MyTheme>(
        builder: (context, theme, _) {
          return GetMaterialApp(
            title: 'Museum Wallpaper',
            debugShowCheckedModeBanner: false,
            theme: theme.current,
            home: const BaseView(),
          );
        },
      ),
    );
  }
}
