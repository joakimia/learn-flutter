import 'package:flutter/material.dart';

import 'package:app/shared/constants/label.dart';
import 'package:app/core/top_app_bar.dart';
import 'package:app/styles/colors.dart';

class MyVehicles extends StatelessWidget {
  const MyVehicles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: EldelTopAppBar.getAppBarByLabel(myVehiclesLabel),
    body: Container(
      color: backgroundColorPrimary,
      width: double.infinity,
      child: const Center(
        child: Text(
          myVehiclesLabel,
          style: TextStyle(color: textColor),
        ),
      ),
    ),
  );
}
