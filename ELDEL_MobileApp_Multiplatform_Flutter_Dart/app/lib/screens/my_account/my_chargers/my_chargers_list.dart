import 'package:flutter/material.dart';

import 'my_charger/my_charger.dart';
import 'package:app/models/charge_points/charger_model.dart';
import 'package:app/styles/spacings.dart';

class MyChargersList extends StatelessWidget {
  final List<Charger> _chargers;

  const MyChargersList({Key? key, required List<Charger> chargers})
      : _chargers = chargers,
        super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: const EdgeInsets.all(spaceXSmall),
        itemCount: _chargers.length,
        itemBuilder: (BuildContext context, int listItemIndex) =>
          MyCharger(charger: _chargers[listItemIndex],),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
}
