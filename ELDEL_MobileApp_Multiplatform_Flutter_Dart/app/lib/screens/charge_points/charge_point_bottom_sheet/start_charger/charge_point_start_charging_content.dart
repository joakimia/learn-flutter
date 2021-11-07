import 'package:flutter/material.dart';

import 'package:app/screens/charge_points/charge_point_bottom_sheet/start_charger/qr_code_scanner.dart';
import 'package:app/models/charge_points/charger_model.dart';
import 'package:app/styles/font.dart';
import 'package:app/styles/spacings.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/borders.dart';
import 'package:app/shared/widgets/svg_icon.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:app/shared/constants/label.dart';

class ChargePointStartChargingContent extends StatelessWidget {
  final Charger _charger;
  
  const ChargePointStartChargingContent({
    Key? key,
    required Charger charger,
  }) : _charger = charger,
      super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Container(
              width: 50,
              height: 10,
              decoration: const BoxDecoration(
                color: backgroundColorPrimaryContrast,
                borderRadius: BorderRadius.all(Radius.circular(borderRadiusSmall)),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    privateChargerLabel,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSizeLarge,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ]
              ),
              const SizedBox(height: spaceXXSmall),
              Row(
                children: [
                  Text(_charger.name, style: const TextStyle(color: textColor),),
                ]
              ),
            ],
          ),
          Row(
            children: const [
              EldelSvgIcon(
                svgImgPath: 'assets/icons/heart.svg',
                semanticsLabel: addToFavouritesLabel,
              ),
              SizedBox(width: spaceXXXSmall),
              Text(addToFavouritesLabel, style: TextStyle(color: textColor),),
            ]
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text(
                "+47 452 16 390",
                style: TextStyle(
                  color: 
                  linktextColor, 
                  decoration: TextDecoration.underline
                ),
              ),
            ]
          ),
          Row(
            children: const [
              EldelSvgIcon(
                svgImgPath: 'assets/icons/messages.svg',
                semanticsLabel: messageOwnerLabel,
              ),
              SizedBox(width: spaceSmall),
              Text(messageOwnerLabel, style: TextStyle(color: textColor),),
            ]
          ),
        ],
      ),
      EldelPrimaryButton(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const QRCodeScanner(),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            EldelSvgIcon(
              svgImgPath: 'assets/icons/electric_cord.svg',
              semanticsLabel: startChargingLabel,
              color: buttonTextColorPrimary,
            ),
            SizedBox(width: spaceMedium),
            Text(startChargingLabel,
                style: TextStyle(fontSize: fontSizeLarge)),
          ],
        ),
      ),
    ],
  );
}
