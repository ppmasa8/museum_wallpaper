import 'package:flutter/material.dart';
import 'package:metropolitan_museum/view/widgets/download_widgets.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(child: DownloadWidgets()),
      ),
    );
  }
}