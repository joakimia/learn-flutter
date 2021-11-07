import 'package:flutter/material.dart';

import 'package:app/models/charge_points/charger_model.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:app/shared/widgets/svg_icon.dart';
import 'package:app/shared/constants/label.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/font.dart';
import 'package:app/styles/spacings.dart';
import 'package:app/styles/borders.dart';

class ChargePointStopChargingContent extends StatelessWidget {
  final Charger _charger;
  
  const ChargePointStopChargingContent({
    Key? key,
    required Charger charger,
  }) : _charger = charger,
      super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Align(
        alignment: Alignment.topCenter,
        child: InkWell(
            child: Container(
              width: 50,
              height: 10,
              decoration: const BoxDecoration(
                color: backgroundColorPrimaryContrast,
                borderRadius: BorderRadius.all(Radius.circular(borderRadiusSmall)),
              ),
          ),
        ),
      ),
      Text(_charger.name),
      EldelPrimaryButton(
        onTap: () {
          print('starting');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            EldelSvgIcon(
              svgImgPath: 'assets/icons/charging_socket.svg',
              semanticsLabel: stopChargingLabel,
              color: buttonTextColorPrimary,
            ),
            SizedBox(width: spaceXXSmall),
            Text(stopChargingLabel,
                style: TextStyle(fontSize: fontSizeLarge)),
          ],
        ),
      ),
    ],
  );
}
