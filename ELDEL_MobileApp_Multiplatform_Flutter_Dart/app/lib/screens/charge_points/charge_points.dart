import 'package:app/services/service_locator.dart';
import 'package:flutter/material.dart';

import 'package:app/screens/charge_points/charge_point_bottom_sheet/charge_point_bottom_sheet.dart';
import 'package:app/screens/charge_points/charge_point_card/charge_point_card.dart';
import 'package:app/screens/charge_points/charge_points_map/charge_points_map.dart';
import 'package:app/services/charge_points/charge_points_service.dart';
import 'package:app/models/charge_points/charger_model.dart';
import 'package:app/core/top_app_bar.dart';
import 'package:app/shared/constants/label.dart';

class ChargePoints extends StatelessWidget {
  final ChargePointsService _chargePointsService = getIt<ChargePointsService>();

  ChargePoints({Key? key}) : super(key: key);

  void _showBottomSheet(BuildContext context, Charger charger) {
    Scaffold.of(context).showBottomSheet<void>((BuildContext _) =>
        ChargePointBottomSheet(
            charger: charger,
            onClose: () => Navigator.pop(context)
        ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: EldelTopAppBar.getAppBarByLabel(chargePointsLabel),
        body: Stack(
          children: [
            const ChargePointsMap(),
            StreamBuilder<Charger?>(
                stream: _chargePointsService.selectedChargePointStream,
                builder: (BuildContext _, AsyncSnapshot<Charger?> snapshot) {
                  var _hasSelectedChargePoint = snapshot.data != null;

                  return _hasSelectedChargePoint
                      ? ChargePointCard(
                          charger: snapshot.data as Charger,
                          onChargeNowTap: () => _showBottomSheet(
                              context, snapshot.data as Charger),
                        )
                      : const SizedBox.shrink();
                }),
          ],
        ),
      );
}
