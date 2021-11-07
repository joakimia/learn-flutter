import 'package:flutter/material.dart';

import 'package:app/core/top_app_bar.dart';
import 'package:app/shared/constants/label.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/font.dart';
import 'package:app/styles/spacings.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: EldelTopAppBar.getAppBarByLabel(favouritesLabel),
    body: Container(
      color: backgroundColorPrimary,
      padding: const EdgeInsets.only(
          top: spaceXXXLarge, left: spaceSmall, right: spaceSmall),
      width: double.infinity,
      child: Container(
        color: backgroundColorPrimary,
        padding: const EdgeInsets.only(
            top: spaceXXXLarge, left: spaceSmall, right: spaceSmall),
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              noFavouritesLabel,
              style: TextStyle(
                  fontSize: fontSizeLarge, color: textColor),
            ),
            const SizedBox(height: 100),
            Image.asset('assets/images/no_favourites.png'),
          ],
        ),
      ),
    )
  );
}
