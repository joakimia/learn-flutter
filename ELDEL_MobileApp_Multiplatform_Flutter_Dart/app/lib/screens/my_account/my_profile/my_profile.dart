import 'package:flutter/material.dart';

import 'package:app/core/top_app_bar.dart';
import 'package:app/styles/colors.dart';
import 'package:app/shared/constants/label.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: EldelTopAppBar.getAppBarByLabel(myProfileLabel),
    body: Container(
      color: backgroundColorPrimary,
      width: double.infinity,
      child: const Center(
        child: Text(
          myProfileLabel,
          style: TextStyle(color: textColor),
        ),
      ),
    ),
  );
}
