import 'package:flutter/material.dart';
import '../widgets/download_widgets.dart';

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