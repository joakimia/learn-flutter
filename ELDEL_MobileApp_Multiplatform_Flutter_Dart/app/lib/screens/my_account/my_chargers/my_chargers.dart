import 'package:app/models/charge_points/charger_model.dart';
import 'package:app/screens/my_account/my_chargers/my_chargers_list.dart';
import 'package:flutter/material.dart';

import 'package:app/shared/constants/label.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:app/styles/borders.dart';
import 'package:app/styles/spacings.dart';
import 'package:app/core/top_app_bar.dart';
import 'package:app/styles/colors.dart';

import 'my_charger/my_charger.dart';

class MyChargers extends StatefulWidget {
  const MyChargers({Key? key}) : super(key: key);

  @override
  MyChargersState createState() {
    return MyChargersState();
  }
}

class MyChargersState extends State<MyChargers> {
  final List<Charger> _chargers = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: EldelTopAppBar.getAppBarByLabel(myChargersLabel),
        body: Container(
          color: backgroundColorPrimary,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spaceMedium, vertical: spaceMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                EldelPrimaryButton(
                  onTap: () {},
                  child: const Text(
                    registerNewChargerLabel,
                    style: TextStyle(color: buttonTextColorPrimary),
                  ),
                  borderRadius: borderRadiusXSmall,
                  padding: const EdgeInsets.symmetric(
                      horizontal: spaceMedium, vertical: spaceLarge),
                ),

                if (_chargers.isNotEmpty) MyChargersList(chargers: _chargers),

                MyCharger(charger: null,),
              ],
            ),
          ),
        ),
      );
}
