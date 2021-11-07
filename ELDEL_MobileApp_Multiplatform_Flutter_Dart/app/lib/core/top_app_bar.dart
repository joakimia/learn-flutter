import 'package:flutter/material.dart';

import 'package:app/styles/colors.dart';
import 'package:app/styles/font.dart';

class EldelTopAppBar {
  static PreferredSize getAppBarByLabel(String label) => PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: TopAppBar(
      appBarTitle: label,
    ),
  );
}

class TopAppBar extends StatelessWidget {
  final String _appBarTitle;

  const TopAppBar({Key? key, required String appBarTitle})
      : _appBarTitle = appBarTitle,
        super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
    centerTitle: true,
    backgroundColor: backgroundColorSecondary,
    brightness: Brightness.dark,
    title:
        Text(_appBarTitle, style: const TextStyle(fontSize: fontSizeLarge)),
  );
}
