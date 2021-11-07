import 'package:flutter/material.dart';

import 'my_chargers/my_chargers.dart';
import 'my_chargers/my_chargers_button.dart';
import 'my_vehicles/my_vehicles.dart';
import 'my_vehicles/my_vehicles_button.dart';
import 'my_profile/my_profile.dart';
import 'my_profile/my_profile_button.dart';
import 'package:app/core/top_app_bar.dart';
import 'package:app/shared/constants/label.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/spacings.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: EldelTopAppBar.getAppBarByLabel(myAccountLabel),
    body: Container(
      width: double.infinity,
      color: backgroundColorPrimary,
      padding: const EdgeInsets.only(
          top: spaceXXXLarge,
          left: spaceSmall,
          right: spaceSmall
      ),
      child: Column(
        children: [
          MyVehiclesButton(
              onTap: () => _navigateToNextPage(context, const MyVehicles())),
          MyChargersButton(
              onTap: () => _navigateToNextPage(context, const MyChargers())),
          MyProfileButton(
              onTap: () => _navigateToNextPage(context, const MyProfile())),
        ],
      ),
    )
  );

  void _navigateToNextPage(BuildContext context, Widget widget) =>
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext ctx) => widget));
}
