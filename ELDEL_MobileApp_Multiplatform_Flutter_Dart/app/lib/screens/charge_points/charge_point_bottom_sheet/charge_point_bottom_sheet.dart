import 'package:flutter/material.dart';

import 'package:app/models/charge_points/charger_model.dart';
import 'package:app/screens/charge_points/charge_point_bottom_sheet/start_charger/charge_point_start_charging_content.dart';
import 'package:app/screens/charge_points/charge_point_bottom_sheet/stop_charger/charge_point_stop_charging_content.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/spacings.dart';
import 'package:app/styles/borders.dart';

class ChargePointBottomSheet extends StatelessWidget {
  final Charger _charger;

  final _isChargingSessionActive = false;

  const ChargePointBottomSheet({
    Key? key,
    required Charger charger,
    required VoidCallback onClose,
  })  : _charger = charger,
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: 225,
      padding: const EdgeInsets.only(
          top: spaceSmall,
          right: spaceMedium,
          bottom: spaceLarge,
          left: spaceMedium),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadiusSmall),
            topRight: Radius.circular(borderRadiusSmall)),
        color: backgroundColorPrimary,
      ),
      child: _isChargingSessionActive
          ? ChargePointStopChargingContent(charger: _charger)
          : ChargePointStartChargingContent(charger: _charger));
}
