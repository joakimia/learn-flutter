import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:app/models/charge_points/charger_model.dart';
import 'package:app/shared/widgets/card.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:app/shared/widgets/svg_icon.dart';
import 'package:app/shared/constants/label.dart';
import 'package:app/styles/spacings.dart';
import 'package:app/styles/font.dart';
import 'package:app/styles/colors.dart';

class ChargePointCard extends StatelessWidget {
  final Charger _charger;
  final VoidCallback _onChargeNowTap;

  const ChargePointCard({
    Key? key,
    required Charger charger,
    required VoidCallback onChargeNowTap
  }) :
      _charger = charger,
      _onChargeNowTap = onChargeNowTap,
      super(key: key);

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.bottomCenter, 
    child: FractionallySizedBox(
      heightFactor: 0.25,
      widthFactor: 0.95,
      child: EldelCard(
        child: Container(
          padding: const EdgeInsets.all(spaceLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                    _charger.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: fontSizeLarge,
                      fontWeight: FontWeight.bold,
                      color: iconColorSecondary
                    ),) 
                  ),
                  Row(
                    children: [
                      const EldelSvgIcon(
                        svgImgPath: 'assets/icons/charging_socket.svg',
                        semanticsLabel: socketTypeLabel,
                        height: 22,
                        width: 22,
                      ),
                      const SizedBox(width: spaceSmall),
                      Text(_charger.socketType, style: const TextStyle(color: textColor))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      EldelSvgIcon(
                        svgImgPath: 'assets/icons/credit_card.svg',
                        semanticsLabel: pricePerMinuteLongLabel,
                      ),
                      SizedBox(width: spaceXXSmall),
                      Text("0.96 $pricePerMinuteShortLabel", style: TextStyle(color: textColor),),
                    ],
                  ),
                  Row(
                    children: const [
                      EldelSvgIcon(
                        svgImgPath: 'assets/icons/location_marker.svg',
                        semanticsLabel: distanceToChargerLabel,
                      ),
                      SizedBox(width: spaceXXXSmall),
                      Text("3 $kiloMeterShortLabel", style: TextStyle(color: textColor),),
                    ]
                  ),
                  Row(
                    children: const [
                      EldelSvgIcon(
                        svgImgPath: 'assets/icons/electric_vehicle.svg',
                        semanticsLabel: distanceToChargerLabel,
                        height: 22,
                        width: 22,
                      ),
                      SizedBox(width: spaceXXSmall),
                      Text("5 $minutesShortLabel", style: TextStyle(color: textColor)),
                    ],
                  ),
                ],
              ),
              EldelPrimaryButton(
                onTap: _onChargeNowTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    EldelSvgIcon(
                      svgImgPath: 'assets/icons/electric_cord.svg',
                      semanticsLabel: bookChargerLabel,
                      color: buttonTextColorPrimary,
                    ),
                    SizedBox(width: spaceXXSmall),
                    Text(bookChargerLabel, style: TextStyle(fontSize: fontSizeLarge)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
  );
}
