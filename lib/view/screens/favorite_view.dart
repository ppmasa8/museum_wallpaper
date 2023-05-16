import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../utils/helpers/color_helper.dart';
import '../utils/helpers/style_helper.dart';
import '../widgets/favorite_widgets.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyTheme theme = context.watch<MyTheme>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: GoogleFonts.dancingScript(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: theme.isDark ? whitecolor : blackcolor,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.isDark ? Colors.grey[850] : Colors.grey[50],
        elevation: 0,
      ),
      body: const FavoriteWidgets(),
    );
  }
}
